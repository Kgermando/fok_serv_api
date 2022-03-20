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

    router.get('/', (Request request) async {
      UserModel selectUser =
          await repos.users.getFromId(request.context['id'] as int);
      return Response.ok(jsonEncode(selectUser.toMap()));
    });

    router.get('/<id>', (Request request, String id) async {
      late UserModel selectUser;
      try {
        selectUser = await repos.users.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(selectUser.toMap()));
    });

    router.patch('/', (Request request) async {
      UserModel selectUser =
          await repos.users.getFromId(request.context['id'] as int);
      dynamic input = jsonDecode(await request.readAsString());
      if (input['matricule'] != null) {
        selectUser.matricule = input['matricule'];
      }
      if (input['nom'] != null) {
        selectUser.nom = input['nom'];
      }
      if (input['postNom'] != null) {
        selectUser.postNom = input['postNom'];
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
      if (input['adresse'] != null) {
        selectUser.adresse = input['adresse'];
      }
      if (input['sexe'] != null) {
        selectUser.sexe = input['sexe'];
      }
      if (input['role'] != null) {
        selectUser.role = input['role'];
      }
      if (input['matricule'] != null) {
        selectUser.matricule = input['matricule'];
      }
      if (input['dateNaissance'] != null) {
        selectUser.dateNaissance = input['dateNaissance'];
      }
      if (input['lieuNaissance'] != null) {
        selectUser.lieuNaissance = input['lieuNaissance'];
      }
      if (input['nationalite'] != null) {
        selectUser.nationalite = input['nationalite'];
      }
      if (input['typeContrat'] != null) {
        selectUser.typeContrat = input['typeContrat'];
      }
      if (input['departement'] != null) {
        selectUser.departement = input['departement'];
      }
      if (input['servicesAffectation'] != null) {
        selectUser.servicesAffectation = input['servicesAffectation'];
      }
      if (input['dateDebutContrat'] != null) {
        selectUser.dateDebutContrat = input['dateDebutContrat'];
      }
      if (input['dateFinContrat'] != null) {
        selectUser.dateFinContrat = input['dateFinContrat'];
      }
      if (input['fonctionOccupe'] != null) {
        selectUser.fonctionOccupe = input['fonctionOccupe'];
      }
      if (input['competance'] != null) {
        selectUser.competance = input['competance'];
      }
      if (input['experience'] != null) {
        selectUser.experience = input['experience'];
      }
      if (input['rate'] != null) {
        selectUser.rate = input['rate'];
      }
      if (input['statutAgent'] != null) {
        selectUser.statutAgent = input['statutAgent'];
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
      repos.users.update(selectUser);
      return Response.ok(jsonEncode(selectUser.toMap()));
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page user n\'est pas trouvé'),
    );

    return router;
  }

  
}
