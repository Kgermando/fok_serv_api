import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/amortissement_model.dart';
import '../../repository/repository.dart';

class AmortissementHandlers {
  final Repository repos;

  AmortissementHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AmortissementModel> data = await repos.amortissements.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-comptabilite-amortissement', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AmortissementModel data = AmortissementModel(
          titleArmotissement: input['titleArmotissement'],
          comptes: input['comptes'],
          intitule: input['intitule'],
          montant: input['montant'],
          typeJournal: input['typeJournal'],
          created: DateTime.parse(input['created']));
      try {
        await repos.amortissements.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-comptabilite-amortissement/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      AmortissementModel data = await repos.amortissements.getFromId(int.parse(id!));

      if (input['titleArmotissement'] != null) {
        data.titleArmotissement = input['titleArmotissement'];
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['typeJournal'] != null) {
        data.typeJournal = input['typeJournal'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.amortissements.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-comptabilite-amortissement/<id>', (Request request) async {
      var id = request.params['id'];
      repos.amortissements.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page amortissement n\'est pas trouvé'),
    );

    return router;
  }
}
