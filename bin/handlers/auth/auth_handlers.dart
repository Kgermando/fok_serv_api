import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../extensions/check_correct_login.dart';
import '../../extensions/jwtmethods.dart';
import '../../models/users/refresh_token.dart';
import '../../models/users/user_model.dart';
import '../../repository/repository.dart';

class AuthHandlers {
  final Repository repos;
  final String serverSecretKey;

  AuthHandlers(this.repos, this.serverSecretKey);

  Router get router {
    final router = Router();

    router.post('/register', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      // if (!checkCorrectInput(input['nom'])) {
      //   return Response(403);
      // }
      // if (!checkCorrectInput(input['postNom'])) {
      //   return Response(403);
      // }
      // if (!checkCorrectLogin(input['matricule'])) {
      //   return Response(403);
      // }
      // if (!checkCorrectPassword(input['passwordHash'])) {
      //   return Response(403);
      // }
      UserModel selectUser = UserModel(
        nom: input['nom'] ?? '',
        postNom: input['postNom'],
        prenom: input['prenom'],
        email: input['email'],
        telephone: input['telephone'],
        adresse: input['adresse'],
        sexe: input['sexe'] ?? '',
        role: input['role'] ?? '',
        matricule: input['matricule'] ?? '',
        dateNaissance: DateTime.parse(input['dateNaissance'] ?? ''),
        lieuNaissance: input['lieuNaissance'] ?? '',
        nationalite: input['nationalite'] ?? '',
        typeContrat: input['typeContrat'] ?? '',
        departement: input['departement'] ?? '',
        servicesAffectation: input['servicesAffectation'],
        dateDebutContrat: DateTime.parse(input['dateDebutContrat'] ?? ''),
        dateFinContrat: DateTime.parse(input['dateFinContrat'] ?? ''),
        fonctionOccupe: input['fonctionOccupe'] ?? '',
        competance: input['competance'] ?? '',
        experience: input['experience'] ?? '',
        rate: input['rate'] ?? '',
        statutAgent: bool.hasEnvironment(input['statutAgent'] ?? ''),
        isOnline: bool.hasEnvironment(input['isOnline'] ?? ''),
        createdAt: DateTime.parse(input['createdAt'] ?? ''),
        passwordHash:
            md5.convert(utf8.encode(input['passwordHash'] ?? '')).toString(),
      );
      try {
        await repos.user.insertData(selectUser);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode({
        'user': selectUser.matricule
      }));
    });


    router.post('/login', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      int id = await repos.user.getIdFromLoginPassword(input['matricule'],
          md5.convert(utf8.encode(input['passwordHash'])).toString());
      UserModel user = await repos.user.getFromId(id);
      String authToken = generateAuthToken(user, serverSecretKey);
      String refreshToken = generateRefreshToken(user, serverSecretKey);
      await repos.refreshTokens.write(RefreshTokenModel(
        id: null,
        owner: user.id!,
        token: refreshToken,
      ));

      return Response.ok(jsonEncode({
        'id': user.id,
        'auth_token': authToken,
        'refresh_token': refreshToken,
      }));
    });


    router.post('/reloadToken', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      RefreshTokenModel refreshToken =
          await repos.refreshTokens.get(input['refresh_token']);
      UserModel selectUser = await repos.user.getFromId(refreshToken.owner);
      String authToken = generateAuthToken(selectUser, serverSecretKey);
      refreshToken.token = generateRefreshToken(selectUser, serverSecretKey);
      await repos.refreshTokens.rewrite(refreshToken);
      return Response.ok(jsonEncode({
        'id': selectUser.id,
        'auth_token': authToken,
        'refresh_token': refreshToken.token
      }));
    });

    router.post('/checkCorrectLogin', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      String login = input['matricule'];
      if (!checkCorrectLogin(login)) {
        return Response(403);
      }
      if (!await repos.user.isUniqueLogin(login)) {
        return Response(422);
      }
      return Response(202);
    });

    
    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page auth n\'est pas trouvé'),
    );
    
    return router;
  }
  
}