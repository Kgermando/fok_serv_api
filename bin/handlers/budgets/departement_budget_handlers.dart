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
        periodeDebut: DateTime.parse(input['periodeDebut']),
        periodeFin: DateTime.parse(input['periodeFin']),
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created']),
        isSubmit: input['isSubmit'],
        approbationDG: input['approbationDG'],
        motifDG: input['motifDG'],
        signatureDG: input['signatureDG'],
        approbationDD: input['approbationDD'],
        motifDD: input['motifDD'],
        signatureDD: input['signatureDD']
      );
      try {
        await repos.departementBudgets.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });


    router.put('/update-departement-budget/', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      final editH = DepartementBudgetModel.fromJson(input);
      DepartementBudgetModel? data =
          await repos.departementBudgets.getFromId(editH.id!);

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
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['isSubmit'] != null) {
        data.isSubmit = input['isSubmit'];
      }
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['motifDG'] != null) {
        data.motifDG = input['motifDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
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
