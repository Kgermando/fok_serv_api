import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:crypto/crypto.dart';

import '../../models/users/user_model.dart';
import '../../repository/repository.dart';

class UserHandlers {
  final Repository repos;
  UserHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/users/', (Request request) async {
      List<UserModel> data = await repos.users.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/', (Request request) async {
      UserModel selectUser =
          await repos.users.getFromId(request.context['id'] as int);
      return Response.ok(jsonEncode(selectUser.toJson()));
    });

    router.get('/<id>', (Request request, String id) async {
      late UserModel selectUser;
      try {
        selectUser = await repos.users.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(selectUser.toJson()));
    });

    router.patch('/', (Request request) async {
      UserModel selectUser =
          await repos.users.getFromId(request.context['id'] as int);
      dynamic input = jsonDecode(await request.readAsString());
      if (input['photo'] != null) {
        selectUser.matricule = input['photo'];
      }
      if (input['nom'] != null) {
        selectUser.nom = input['nom'];
      }
      if (input['prenom'] != null) {
        selectUser.prenom = input['prenom'];
      }
      if (input['email'] != null) {
        selectUser.email = input['email'];
      }
      if (input['telephone'] != null) {
        selectUser.telephone = input['telephone'];
      }
      if (input['matricule'] != null) {
        selectUser.matricule = input['matricule'];
      }
      if (input['departement'] != null) {
        selectUser.departement = input['departement'];
      }
      if (input['servicesAffectation'] != null) {
        selectUser.servicesAffectation = input['servicesAffectation'];
      }
      if (input['fonctionOccupe'] != null) {
        selectUser.fonctionOccupe = input['fonctionOccupe'];
      }
      if (input['role'] != null) {
        selectUser.role = input['role'];
      }
      if (input['isOnline'] != null) {
        selectUser.isOnline = input['isOnline'];
      }
      if (input['createdAt'] != null) {
        selectUser.createdAt = input['createdAt'];
      }
      if (input['passwordHash'] != null) {
        selectUser.passwordHash =
            md5.convert(utf8.encode(input['passwordHash'])).toString();
        repos.refreshTokens.logoutAll(selectUser.id!);
      }
      if (input['succursale'] != null) {
        selectUser.succursale = input['succursale'];
      }
      repos.users.update(selectUser);
      return Response.ok(jsonEncode(selectUser.toJson()));
    });

    // Add new user
    router.post('/insert-new-user', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      UserModel agent = UserModel(
          photo: input['photo'],
          nom: input['nom'],
          prenom: input['prenom'],
          email: input['email'],
          telephone: input['telephone'],
          matricule: input['matricule'],
          departement: input['departement'],
          servicesAffectation: input['servicesAffectation'],
          fonctionOccupe: input['fonctionOccupe'],
          role: input['role'],
          isOnline: input['isOnline'],
          createdAt: DateTime.parse(input['createdAt']),
          passwordHash:
              md5.convert(utf8.encode(input['passwordHash'])).toString(),
          succursale: input['succursale']);

      try {
        await repos.users.insertData(agent);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    // Get all users
    router.get('/users/', (Request request) async {
      List<UserModel> data = await repos.users.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.delete('/delete-user/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.users.deleteData(int.parse(id!));
      return Response.ok('Agent supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page user n\'est pas trouvé'),
    );

    return router;
  }
}
