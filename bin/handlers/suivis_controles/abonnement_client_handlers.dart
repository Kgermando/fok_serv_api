import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
  
import '../../models/suivi_controle/abonnement_client_model.dart';
import '../../repository/repository.dart';

class AbonnementClientHandlers {
  final Repository repos;

  AbonnementClientHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AbonnementClientModel> data = await repos.abonnementRepository.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AbonnementClientModel dataId;
      try {
        dataId = await repos.abonnementRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataId.toJson()));
    });

    router.post('/insert-new-abonnement-client', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AbonnementClientModel data = AbonnementClientModel(
        duree: DateTime.parse(input['duree']),
        typeContrat: input['typeContrat'],
        sommeContrat: input['sommeContrat'],
        receptionniste: input['receptionniste'],
        dateSignatureContrat: input['dateSignatureContrat'],
        signataireContratEntreprise: input['signataireContratEntreprise'],
        signature: input['signature'], 
        created: DateTime.parse(input['created'])
      );
      try {
        await repos.abonnementRepository.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-abonnement-client/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = AbonnementClientModel.fromJson(input);
      AbonnementClientModel? data =
          await repos.abonnementRepository.getFromId(editH.id!); 

      if (input['nom'] != null) {
        data.duree = DateTime.parse(input['duree']);
      }
      if (input['typeContrat'] != null) {
        data.typeContrat = input['typeContrat'];
      }
      if (input['sommeContrat'] != null) {
        data.sommeContrat = input['sommeContrat'];
      }
      if (input['receptionniste'] != null) {
        data.receptionniste = input['receptionniste'];
      }
      if (input['dateSignatureContrat'] != null) {
        data.dateSignatureContrat = input['dateSignatureContrat'];
      }
      if (input['signataireContratEntreprise'] != null) {
        data.signataireContratEntreprise = input['signataireContratEntreprise'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      } 
      repos.abonnementRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-abonnement-client/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.abonnementRepository.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page Abonnement n\'est pas trouvé'),
    );

    return router;
  }
}
