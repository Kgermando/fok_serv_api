import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';

import '../../models/users/user_model.dart';
import '../../repository/repository.dart';

class UserHandlers {
  final Repository repos;
  UserHandlers(this.repos);

  Router get router {
    final router = Router();

    // router.get('/users/', (Request request) async {
    //   List<UserModel> data = await repos.users.getAllData();
    //   return Response.ok(jsonEncode(data));
    // });

    // Get all users
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


    router.put('/update-user/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = UserModel.fromJson(input);
      UserModel? selectUser = await repos.users.getFromId(editH.id!);

      if (input['succursale'] != null) {
        selectUser.succursale = input['succursale'];
      }
      repos.users.update(selectUser);
      return Response.ok(jsonEncode(selectUser.toJson()));
    });


    
    router.put('/change-password/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = UserModel.fromJson(input);
      UserModel? selectUser = await repos.users.getFromId(editH.id!);

      // Check si le mot de passe par defaut est correct
      if (input['passwordHash'] != null) {
        selectUser.passwordHash =
            md5.convert(utf8.encode(input['passwordHash'])).toString();
      }
      repos.users.update(selectUser);
      return Response.ok(jsonEncode(selectUser.toJson()));
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
