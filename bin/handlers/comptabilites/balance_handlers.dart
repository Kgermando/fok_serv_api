import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/balance_model.dart'; 
import '../../models/comptabilites/balance_sum_model.dart';
import '../../repository/repository.dart';

class BalanceHandlers {
  final Repository repos;

  BalanceHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<BalanceModel> data = await repos.balances.getAllData();
      return Response.ok(jsonEncode(data));
    });


    router.get('/balance-sum/', (Request request) async {
      List<BalanceSumModel> data = await repos.balances.getAllSumData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/balance-chart/', (Request request) async {
      List<BalanceChartModel> data = await repos.balances.getAllChartData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/balance-chart-pie/', (Request request) async {
      List<BalancePieChartModel> data = await repos.balances.getBalanceChartPie();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late BalanceModel dataItem;
      try {
        dataItem = await repos.balances.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.post('/insert-new-balance', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      BalanceModel data = BalanceModel( 
        numeroOperation: input['numeroOperation'],
        libele: input['libele'],
        comptes: input['comptes'],
        debit: input['debit'],
        credit: input['credit'], 
        signature: input['signature'],
        created: DateTime.parse(input['created']),
      );
      try {
        await repos.balances.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-balance/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = BalanceModel.fromJson(input);
      BalanceModel? data = await repos.balances.getFromId(editH.id!); 
      
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      }
      if (input['libele'] != null) {
        data.libele = input['libele'];
      }
      if (input['comptes'] != null) {
        data.comptes = input['comptes'];
      }
      if (input['debit'] != null) {
        data.debit = input['debit'];
      }
      if (input['credit'] != null) {
        data.credit = input['credit'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }

      repos.balances.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-balance/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.balances.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page BalanceModel Role n\'est pas trouvé'),
    );
    return router;
  }
}
