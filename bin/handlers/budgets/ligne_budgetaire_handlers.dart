import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/budgets/ligne_budgetaire_model.dart';
import '../../repository/repository.dart';

class LignBudgetaireHanlers {
  final Repository repos;

  LignBudgetaireHanlers(this.repos);

  Router get router {
    final router = Router();


   router.get('/', (Request request) async {
      List<LigneBudgetaireModel> data = await repos.ligneBudgetaires.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late LigneBudgetaireModel data;
      try {
        data = await repos.ligneBudgetaires.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-ligne-budgetaire', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      LigneBudgetaireModel data = LigneBudgetaireModel(
        nomLigneBudgetaire: input['nomLigneBudgetaire'],
        departement: input['departement'],
        periodeBudget: input['periodeBudget'],
        uniteChoisie: input['uniteChoisie'],
        nombreUnite: input['nombreUnite'],
        coutUnitaire: input['coutUnitaire'],
        coutTotal: input['coutTotal'],
        caisse: input['caisse'],
        banque: input['banque'],
        finPropre: input['finPropre'],
        finExterieur: input['finExterieur'],

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
        created: DateTime.parse(input['created']),
        );
      try {
        await repos.ligneBudgetaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-ligne-budgetaire/<id>', (Request request, String id) async {
      var id = request.params['id'];
      LigneBudgetaireModel data = await repos.ligneBudgetaires.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['nomLigneBudgetaire'] != null) {
        data.nomLigneBudgetaire = input['nomLigneBudgetaire'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['periodeBudget'] != null) {
        data.periodeBudget = input['periodeBudget'];
      }
      if (input['uniteChoisie'] != null) {
        data.uniteChoisie = input['uniteChoisie'];
      }
      if (input['nombreUnite'] != null) {
        data.nombreUnite = input['nombreUnite'];
      }
      if (input['coutUnitaire'] != null) {
        data.coutUnitaire = input['coutUnitaire'];
      }
      if (input['coutTotal'] != null) {
        data.coutTotal = input['coutTotal'];
      }
      if (input['caisse'] != null) {
        data.caisse = input['caisse'];
      }
      if (input['banque'] != null) {
        data.banque = input['banque'];
      }
      if (input['finPropre'] != null) {
        data.finPropre = input['finPropre'];
      }
      if (input['finExterieur'] != null) {
        data.finExterieur = input['finExterieur'];
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
        data.signatureJustificationBudget = input['signatureJustificationBudget'];
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
      repos.ligneBudgetaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-ligne-budgetaire/<id>', (String id, Request request) async {
      var id = request.params['id'];
      repos.ligneBudgetaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page ligne Budgetaire n\'est pas trouvé'),
    );

    return router;
  }
}