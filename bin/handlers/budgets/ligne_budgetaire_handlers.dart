import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/budgets/ligne_budgetaire_model.dart';
import '../../repository/repository.dart';

class LigneBudgetaireHanlers {
  final Repository repos;

  LigneBudgetaireHanlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<LigneBudgetaireModel> data =
          await repos.ligneBudgetaires.getAllData();
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
        periodeBudgetDebut: DateTime.parse(input['periodeBudgetDebut']),
        periodeBudgetFin: DateTime.parse(input['periodeBudgetFin']),
        uniteChoisie: input['uniteChoisie'],
        nombreUnite: input['nombreUnite'],
        coutUnitaire: input['coutUnitaire'],
        coutTotal: input['coutTotal'],
        caisse: input['caisse'],
        banque: input['banque'],
        finExterieur: input['finExterieur'],
        signature: input['signature'],
        created: DateTime.parse(input['created']),
        reference: input['reference'],
        caisseSortie: input['caisseSortie'],
        banqueSortie: input['banqueSortie'],
        finExterieurSortie: input['finExterieurSortie']
      );
      try {
        await repos.ligneBudgetaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-ligne-budgetaire/', (Request request) async {

      dynamic input = jsonDecode(await request.readAsString());
      final editH = LigneBudgetaireModel.fromJson(input);
      LigneBudgetaireModel? data =
        await repos.ligneBudgetaires.getFromId(editH.id!);

      if (input['nomLigneBudgetaire'] != null) {
        data.nomLigneBudgetaire = input['nomLigneBudgetaire'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['periodeBudgetDebut'] != null) {
        data.periodeBudgetDebut = DateTime.parse(input['periodeBudgetDebut']);
      }
      if (input['periodeBudgetFin'] != null) {
        data.periodeBudgetFin = DateTime.parse(input['periodeBudgetFin']);
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
      if (input['finExterieur'] != null) {
        data.finExterieur = input['finExterieur'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['caisseSortie'] != null) {
        data.caisseSortie = input['caisseSortie'];
      }
      if (input['banqueSortie'] != null) {
        data.banqueSortie = input['banqueSortie'];
      }
      if (input['finExterieurSortie'] != null) {
        data.finExterieurSortie = input['finExterieurSortie'];
      }
      repos.ligneBudgetaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-ligne-budgetaire/<id>',
        (Request request, String id) async {
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
