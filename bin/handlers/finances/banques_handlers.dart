import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/charts/courbe_chart_model.dart';
import '../../models/finances/banque_model.dart';
import '../../repository/repository.dart';

class BanqueHandlers {
  final Repository repos;

  BanqueHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<BanqueModel> data = await repos.banques.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-month-retrait/', (Request request) async {
      List<CourbeChartModel> data =
          await repos.banques.getAllDataChartMounthRetrait();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-month-depot/', (Request request) async {
      List<CourbeChartModel> data =
          await repos.banques.getAllDataChartMounthDepot();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-year-retrait/', (Request request) async {
      List<CourbeChartModel> data =
          await repos.banques.getAllDataChartYearRetrait();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-year-depot/', (Request request) async {
      List<CourbeChartModel> data =
          await repos.banques.getAllDataChartYearDepot();
      return Response.ok(jsonEncode(data));
    });


    router.get('/<id>', (Request request, String id) async {
      late BanqueModel agent;
      try {
        agent = await repos.banques.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-transaction-banque', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BanqueModel data = BanqueModel(
          nomComplet: input['nomComplet'],
          pieceJustificative: input['pieceJustificative'],
          libelle: input['libelle'],
          montantDepot: input['montantDepot'], 
          departement: input['departement'],
          typeOperation: input['typeOperation'],
          numeroOperation: input['numeroOperation'],
          signature: input['signature'],
          reference: input['reference'],
          banqueName: input['banqueName'],
          created: DateTime.parse(input['created']),
        montantRetrait: input['montantRetrait'],
      );
      try {
        await repos.banques.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-banque/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = BanqueModel.fromJson(input);
      BanqueModel? data =
          await repos.banques.getFromId(editH.id!); 

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['pieceJustificative'] != null) {
        data.pieceJustificative = input['pieceJustificative'];
      }
      if (input['libelle'] != null) {
        data.libelle = input['libelle'];
      }
      if (input['montantDepot'] != null) {
        data.montantDepot = input['montantDepot'];
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
      if (input['banqueName'] != null) {
        data.banqueName = input['banqueName'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['montantRetrait'] != null) {
        data.montantRetrait = input['montantRetrait'];
      }
      repos.banques.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-banque/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.banques.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page banque n\'est pas trouvé'),
    );

    return router;
  }
}
