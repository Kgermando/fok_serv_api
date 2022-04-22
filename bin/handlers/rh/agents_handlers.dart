import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/agent_count_model.dart';
import '../../models/rh/agent_model.dart';
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

    router.get('/get-count/', (Request request) async {
      AgentCountModel data = await repos.agents.getCount();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AgentModel agent;
      try {
        agent = await repos.agents.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-agent', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      AgentModel agent = AgentModel(
          nom: input['nom'],
          postNom: input['postNom'],
          prenom: input['prenom'],
          email: input['email'],
          telephone: input['telephone'],
          adresse: input['adresse'],
          sexe: input['sexe'],
          role: input['role'],
          matricule: input['matricule'],
          numeroSecuriteSociale: input['numeroSecuriteSociale'],
          dateNaissance: DateTime.parse(input['dateNaissance']),
          lieuNaissance: input['lieuNaissance'],
          nationalite: input['nationalite'],
          typeContrat: input['typeContrat'],
          departement: input['departement'],
          servicesAffectation: input['servicesAffectation'],
          dateDebutContrat: DateTime.parse(input['dateDebutContrat']),
          dateFinContrat: DateTime.parse(input['dateFinContrat']),
          fonctionOccupe: input['fonctionOccupe'],
          competance: input['competance'],
          experience: input['experience'],
          statutAgent: input['statutAgent'] as bool,
          createdAt: DateTime.parse(input['createdAt']),
          photo: input['photo'], 
          salaire: input['salaire'],
          signature: input['signature'],
          created: DateTime.parse(input['created'])
      );

      try {
        await repos.agents.insertData(agent);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.put('/update-agent/<id>', (Request request, String id) async {
      var id = request.params['id'];
      AgentModel selectUser = await repos.agents.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

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
      if (input['numeroSecuriteSociale'] != null) {
        selectUser.numeroSecuriteSociale = input['numeroSecuriteSociale'];
      }
      if (input['dateNaissance'] != null) {
        selectUser.dateNaissance = DateTime.parse(input['dateNaissance']);
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
        selectUser.dateDebutContrat = DateTime.parse(input['dateDebutContrat']);
      }
      if (input['dateFinContrat'] != null) {
        selectUser.dateFinContrat = DateTime.parse(input['dateFinContrat']);
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
        selectUser.statutAgent = input['statutAgent'] as bool;
      }
      if (input['createdAt'] != null) {
        selectUser.createdAt = DateTime.parse(input['createdAt']);
      }
      if (input['photo'] != null) {
        selectUser.photo = input['photo'];
      }
      if (input['salaire'] != null) {
        selectUser.salaire = input['salaire'];
      }
      if (input['signature'] != null) {
        selectUser.signature = input['signature'];
      }
      if (input['created'] != null) {
        selectUser.created = DateTime.parse(input['created']);
      }
      
      repos.agents.update(selectUser);
      return Response.ok(jsonEncode(selectUser.toJson()));
    });

    router.delete('/delete-agent/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.agents.deleteData(int.parse(id!));
      return Response.ok('Agent supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page Agent n\'est pas trouvé'),
    );

    return router;
  }
}
