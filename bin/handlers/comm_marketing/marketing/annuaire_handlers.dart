import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../../models/comm_maketing/annuaire_model.dart';
import '../../../repository/repository.dart';

class AnnuaireHandlers {
  final Repository repos;

  AnnuaireHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<AnnuaireModel> data = await repos.annuaires.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/search/<query>', (Request request, String query) async {
      List<AnnuaireModel> data = await repos.annuaires.getAllDataSearch(query);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AnnuaireModel data;
      try {
        data = await repos.annuaires.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-annuaire', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AnnuaireModel data = AnnuaireModel(
        categorie: input['categorie'],
        nomPostnomPrenom: input['nomPostnomPrenom'],
        email: input['email'],
        mobile1: input['mobile1'],
        mobile2: input['mobile2'],
        secteurActivite: input['secteurActivite'],
        nomEntreprise: input['nomEntreprise'],
        grade: input['grade'],
        adresseEntreprise: input['adresseEntreprise'],
        approbationDG: input['approbationDG'],
        signatureDG: input['signatureDG'],
        signatureJustificationDG: input['signatureJustificationDG'],
        approbationFin: input['approbationFin'],
        signatureFin: input['signatureFin'],
        signatureJustificationFin: input['signatureJustificationFin'],
        approbationBudget: input['approbationBudget'],
        signatureBudget: input['signatureBudget'],
        signatureJustificationBudget: input['signatureJustificationBudget'],
        approbationDD: input['approbationDD'],
        signatureDD: input['signatureDD'],
        signatureJustificationDD: input['signatureJustificationDD'],
        signature: input['signature'],
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.annuaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-annuaire/<id>', (Request request, String id) async {
      var id = request.params['id'];
      AnnuaireModel data = await repos.annuaires.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['categorie'] != null) {
        data.categorie = input['categorie'];
      }
      if (input['nomPostnomPrenom'] != null) {
        data.nomPostnomPrenom = input['nomPostnomPrenom'];
      }
      if (input['email'] != null) {
        data.email = input['email'];
      }
      if (input['mobile1'] != null) {
        data.mobile1 = input['mobile1'];
      }
      if (input['mobile2'] != null) {
        data.mobile2 = input['mobile2'];
      }
      if (input['secteurActivite'] != null) {
        data.secteurActivite = input['secteurActivite'];
      }
      if (input['nomEntreprise'] != null) {
        data.nomEntreprise = input['nomEntreprise'];
      }
      if (input['grade'] != null) {
        data.grade = input['grade'];
      }
      if (input['adresseEntreprise'] != null) {
        data.adresseEntreprise = input['adresseEntreprise'];
      }
      
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }

      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.annuaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-annuaire/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.annuaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page annuaires n\'est pas trouvé'),
    );

    return router;
  }
}