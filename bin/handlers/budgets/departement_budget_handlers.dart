import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/budgets/departement_budget_model.dart';
import '../../repository/repository.dart';

class DepartementBudgetHandlers {
  final Repository repos;

  DepartementBudgetHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<DepartementBudgetModel> data =
          await repos.departementBudgets.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late DepartementBudgetModel data;
      try {
        data = await repos.departementBudgets.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-departement-budget', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      DepartementBudgetModel data = DepartementBudgetModel(
        title: input['title'],
        departement: input['departement'],
        periodeDebut:  DateTime.parse(input['periodeDebut']),
        periodeFin:  DateTime.parse(input['periodeFin']),
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
        await repos.departementBudgets.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-departement-budget/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      DepartementBudgetModel data =
          await repos.departementBudgets.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

      if (input['title'] != null) {
        data.title = input['title'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['periodeDebut'] != null) {
        data.periodeDebut = DateTime.parse(input['periodeDebut']);
      }
      if (input['periodeFin'] != null) {
        data.periodeFin = DateTime.parse(input['periodeFin']);
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
      repos.departementBudgets.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-departement-budget/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.departementBudgets.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page departement Budgets n\'est pas trouvé'),
    );

    return router;
  }
}
