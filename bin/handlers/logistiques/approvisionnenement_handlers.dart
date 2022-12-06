import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/logistiques/approvisionnement_model.dart';
import '../../repository/repository.dart';

class ApprovisionnementHandlers {
  final Repository repos;

  ApprovisionnementHandlers(this.repos);
  
  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ApprovisionnementModel> data = await repos.approvisionnementRepository.getAllData();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/<id>', (Request request, String id) async {
      late ApprovisionnementModel dataItem;
      try {
        dataItem = await repos.approvisionnementRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.post('/insert-new-approvisionnement', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      ApprovisionnementModel dataItem = ApprovisionnementModel(
        provision: input['provision'],
        quantityTotal: input['quantityTotal'],
        quantity: input['quantity'],
        unite: input['unite'],
        signature: input['signature'], 
        created: DateTime.parse(input['created']),
        fournisseur: input['fournisseur'], 
      );

      try {
        await repos.approvisionnementRepository.insertData(dataItem);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.put('/update-approvisionnement/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ApprovisionnementModel.fromJson(input);
      ApprovisionnementModel? data =
          await repos.approvisionnementRepository.getFromId(editH.id!); 

      if (input['provision'] != null) {
        data.provision = input['provision'];
      }
      if (input['quantityTotal'] != null) {
        data.quantityTotal = input['quantityTotal'];
      }
      if (input['quantity'] != null) {
        data.quantity = input['quantity'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['fournisseur'] != null) {
        data.fournisseur = input['fournisseur'];
      } 

      repos.approvisionnementRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-approvisionnement/<id>', (
      Request request,
      String id
    ) async {
      var id = request.params['id'];
      repos.approvisionnementRepository.deleteData(int.parse(id!));
      return Response.ok('approvisionnementRepository supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page approvisionnementRepository n\'est pas trouvé'),
    );

    return router;
  }
}