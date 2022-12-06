import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/logistiques/approvision_reception_model.dart';
import '../../repository/repository.dart';

class ApprovisionReceptionHandlers {
  final Repository repos;

  ApprovisionReceptionHandlers(this.repos);
  
  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ApprovisionReceptionModel> data = await repos.approvisionReceptionRepository.getAllData();
      return Response.ok(jsonEncode(data));
    }); 

    router.get('/<id>', (Request request, String id) async {
      late ApprovisionReceptionModel dataItem;
      try {
        dataItem = await repos.approvisionReceptionRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.post('/insert-new-approvision-reception', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      ApprovisionReceptionModel dataItem = ApprovisionReceptionModel(
        provision: input['provision'],
        departement: input['departement'],
        quantity: input['quantity'],
        unite: input['unite'],
        signatureLivraison: input['signatureLivraison'],
        created: DateTime.parse(input['created']),
        accuseReception: input['accuseReception'], 
        signatureReception: input['signatureReception'],  
        createdReception: DateTime.parse(input['createdReception']),
        livraisonAnnuler: input['livraisonAnnuler'],
        reference: input['reference'], 
      );

      try {
        await repos.approvisionReceptionRepository.insertData(dataItem);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.put('/update-approvision-reception/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ApprovisionReceptionModel.fromJson(input);
      ApprovisionReceptionModel? data =
          await repos.approvisionReceptionRepository.getFromId(editH.id!); 

      if (input['provision'] != null) {
        data.provision = input['provision'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['quantity'] != null) {
        data.quantity = input['quantity'];
      }
      if (input['unite'] != null) {
        data.unite = input['unite'];
      }
      if (input['signatureLivraison'] != null) {
        data.signatureLivraison = input['signatureLivraison'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      } 
      if (input['accuseReception'] != null) {
        data.accuseReception = input['accuseReception'];
      }
      if (input['signatureReception'] != null) {
        data.signatureReception = input['signatureReception'];
      } 
      if (input['createdReception'] != null) {
        data.createdReception = DateTime.parse(input['createdReception']);
      }
      if (input['livraisonAnnuler'] != null) {
        data.livraisonAnnuler = input['livraisonAnnuler'];
      }
      if (input['reference'] != null) {
        data.reference = input['reference'];
      } 

      repos.approvisionReceptionRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-approvision-reception/<id>', (
      Request request,
      String id
    ) async {
      var id = request.params['id'];
      repos.approvisionReceptionRepository.deleteData(int.parse(id!));
      return Response.ok('approvisionReceptionRepository supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page approvisionReceptionRepository n\'est pas trouvé'),
    );

    return router;
  }
}