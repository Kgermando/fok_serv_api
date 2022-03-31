import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/agent_model.dart';
import '../../models/users/user_model.dart';
import '../../repository/repository.dart';

class AgentsHandlers {
  final Repository repos;

  AgentsHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AgentModel> data = await repos.agents.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-agent', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      AgentModel agent = AgentModel(
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
      statutAgent: bool.hasEnvironment(input['statutAgent'] ?? ''),
      createdAt: DateTime.parse(input['createdAt'] ?? ''),
      passwordHash:
          md5.convert(utf8.encode(input['passwordHash'] ?? '')).toString(),
      );

      try {
        await repos.agents.insertData(agent);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });


    router.put('/update-agent/<id>', (Request request) async {
      AgentModel selectUser =
          await repos.agents.getFromId(request.context['id'] as int);
      dynamic input = jsonDecode(await request.readAsString());
      if (input['photo'] != null) {
        selectUser.photo = input['photo'];
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
      if (input['statutAgent'] != null) {
        selectUser.statutAgent = input['statutAgent'];
      }
      if (input['createdAt'] != null) {
        selectUser.createdAt = input['createdAt'];
      }
      if (input['passwordHash'] != null) {
        selectUser.passwordHash =
            md5.convert(utf8.encode(input['passwordHash'])).toString();
        repos.refreshTokens.logoutAll(selectUser.id!);
      }
      repos.agents.update(selectUser);
      return Response.ok(jsonEncode(selectUser.toJson()));
    });


    router.delete('/delete-agent/<id>', (Request request) async {
      var id = request.params['id'];
      repos.agents.deleteData(int.parse(id!));
      return Response.ok('Agent supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page Agent n\'est pas trouvé'),
    );

    return router;
  }

 
}