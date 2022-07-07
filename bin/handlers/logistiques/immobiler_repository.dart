import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/logistiques/immobilier_model.dart';
import '../../repository/repository.dart';

class ImmobilierHandlers {
  final Repository repos;

  ImmobilierHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<ImmobilierModel> data = await repos.immobiliers.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late ImmobilierModel immobilierModel;
      try {
        immobilierModel = await repos.immobiliers.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(immobilierModel.toJson()));
    });

    router.post('/insert-new-immobilier', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      ImmobilierModel immobilierModel = ImmobilierModel(
        typeAllocation: input['typeAllocation'],
        adresse: input['adresse'],
        numeroCertificat: input['numeroCertificat'],
        superficie: input['superficie'],
        dateAcquisition: DateTime.parse(input['dateAcquisition']), 
        signature: input['signature'],
        createdRef: DateTime.parse(input['createdRef']),
        created: DateTime.parse(input['created']),
        approbationDG: input['approbationDG'],
          motifDG: input['motifDG'],
          signatureDG: input['signatureDG'],
          approbationDD: input['approbationDD'],
          motifDD: input['motifDD'],
          signatureDD: input['signatureDD']
      );

      try {
        await repos.immobiliers.insertData(immobilierModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(immobilierModel.toJson()));
    });

    router.put('/update-immobilier/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = ImmobilierModel.fromJson(input);
      ImmobilierModel? data =
          await repos.immobiliers.getFromId(editH.id!);
 

      if (input['typeAllocation'] != null) {
        data.typeAllocation = input['typeAllocation'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['numeroCertificat'] != null) {
        data.numeroCertificat = input['numeroCertificat'];
      }
      if (input['superficie'] != null) {
        data.superficie = input['superficie'];
      }
      if (input['dateAcquisition'] != null) {
        data.dateAcquisition = DateTime.parse(input['dateAcquisition']);
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.createdRef = DateTime.parse(input['createdRef']);
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
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
      if (input['motifDD'] != null) {
        data.motifDD = input['motifDD'];
      }
      repos.immobiliers.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-immobilier/<id>', (
      String id,
      Request request,
    ) async {
      var id = request.params['id'];
      repos.immobiliers.deleteData(int.parse(id!));
      return Response.ok('immobiliers supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page immobiliers n\'est pas trouvé'),
    );

    return router;
  }
}