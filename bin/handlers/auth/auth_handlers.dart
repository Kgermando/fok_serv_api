import 'dart:convert';

// ignore: depend_on_referenced_packages
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

    router.post('/login', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      int id = await repos.users.getIdFromLoginPassword(input['matricule'],
          md5.convert(utf8.encode(input['passwordHash'])).toString());
      UserModel user = await repos.users.getFromId(id);
      String authToken = generateAuthToken(user, serverSecretKey);
      String refreshToken = generateRefreshToken(user, serverSecretKey);
      await repos.refreshTokens.write(RefreshTokenModel(
        id: null,
        owner: user.id.toString(),
        token: refreshToken,
      ));

      return Response.ok(jsonEncode({
        'id': user.id,
        'auth_token': authToken,
        'refresh_token': refreshToken,
      }));
    });

    router.post('/reloadToken', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      RefreshTokenModel refreshToken =
          await repos.refreshTokens.get(input['refresh_token']);
      print('refreshToken $refreshToken');
      UserModel selectUser =
          await repos.users.getFromId(int.parse(refreshToken.owner));
          print('selectUser $selectUser');
      String authToken = generateAuthToken(selectUser, serverSecretKey);
      print('authToken $authToken');
      refreshToken.token = generateRefreshToken(selectUser, serverSecretKey);
      print('refreshToken.token ${refreshToken.token}');
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
      if (!await repos.users.isUniqueLogin(login)) {
        return Response(422);
      }
      return Response(202);
    });

    router.post('/logout', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      RefreshTokenModel refreshToken =
          await repos.refreshTokens.get(input['refresh_token']);
      print('refreshToken $refreshToken');
      RefreshTokenModel token = await repos.refreshTokens.logout(refreshToken);
      print('token $token');
      return Response.ok(jsonEncode({'refresh_token': "Deleted success!"}));
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page auth n\'est pas trouvé'),
    );

    return router;
  }
}
