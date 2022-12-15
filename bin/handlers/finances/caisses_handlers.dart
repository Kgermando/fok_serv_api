import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/charts/courbe_chart_model.dart';
import '../../models/finances/caisse_model.dart';
import '../../repository/repository.dart';

class CaissesHandlers {
  final Repository repos;

  CaissesHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CaisseModel> data = await repos.caisses.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-month-encaissement/', (Request request) async {
      List<CourbeChartModel> data = await repos.caisses.getAllDataChartMounthEncaissement();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-month-decaissement/', (Request request) async {
      List<CourbeChartModel> data =
          await repos.caisses.getAllDataChartMounthDecaissement();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-year-encaissement/', (Request request) async {
      List<CourbeChartModel> data = await repos.caisses.getAllDataChartYearEncaissement();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-year-decaissement/', (Request request) async {
      List<CourbeChartModel> data = await repos.caisses.getAllDataChartYearDecaissement();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CaisseModel agent;
      try {
        agent = await repos.caisses.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-caisse', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CaisseModel data = CaisseModel(
          nomComplet: input['nomComplet'],
          pieceJustificative: input['pieceJustificative'],
          libelle: input['libelle'],
          montantEncaissement: input['montantEncaissement'], 
          departement: input['departement'],
          typeOperation: input['typeOperation'],
          numeroOperation: input['numeroOperation'],
          signature: input['signature'],
          reference: input['reference'],
          caisseName: input['caisseName'],
          created: DateTime.parse(input['created']),
        montantDecaissement: input['montantDecaissement'],
      );
      try {
        await repos.caisses.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-caisse/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = CaisseModel.fromJson(input);
      CaisseModel? data =
          await repos.caisses.getFromId(editH.id!); 

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['pieceJustificative'] != null) {
        data.pieceJustificative = input['pieceJustificative'];
      }
      if (input['libelle'] != null) {
        data.libelle = input['libelle'];
      }
      if (input['montantEncaissement'] != null) {
        data.montantEncaissement = input['montantEncaissement'];
      } 
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['typeOperation'] != null) {
        data.typeOperation = input['typeOperation'];
      }
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['reference'] != null) {
        data.reference = input['reference'];
      }
      if (input['caisseName'] != null) {
        data.caisseName = input['caisseName'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['montantDecaissement'] != null) {
        data.montantDecaissement = input['montantDecaissement'];
      } 
      repos.caisses.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-caisse/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.caisses.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page caisse n\'est pas trouvé'),
    );

    return router;
  }
}
