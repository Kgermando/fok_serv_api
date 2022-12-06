import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/logistiques/etat_materiel_model.dart';
import '../../repository/repository.dart';

class EtatMaterielHandlers {
  final Repository repos;

  EtatMaterielHandlers(this.repos);
  
    Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<EtatMaterielModel> data = await repos.etatMateriels.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-pie-statut/', (Request request) async {
      List<PieChartMaterielModel> data = await repos.etatMateriels.getChartPie();
      return Response.ok(jsonEncode(data));
    });


    router.get('/<id>', (Request request, String id) async {
      late EtatMaterielModel etatMaterielModel;
      try {
        etatMaterielModel = await repos.etatMateriels.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(etatMaterielModel.toJson()));
    });

    router.post('/insert-new-etat-materiel', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      EtatMaterielModel etatMaterielModel = EtatMaterielModel(
        nom: input['nom'],
        modele: input['modele'],
        marque: input['marque'],
        typeObjet: input['typeObjet'],
        statut: input['statut'], 
        signature: input['signature'], 
        created: DateTime.parse(input['created']),
        approbationDD: input['approbationDD'],
        motifDD: input['motifDD'],
        signatureDD: input['signatureDD']
      );

      try {
        await repos.etatMateriels.insertData(etatMaterielModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(etatMaterielModel.toJson()));
    });

    router.put('/update-etat-materiel/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = EtatMaterielModel.fromJson(input);
      EtatMaterielModel? data =
          await repos.etatMateriels.getFromId(editH.id!); 

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['modele'] != null) {
        data.modele = input['modele'];
      }
      if (input['marque'] != null) {
        data.marque = input['marque'];
      }
      if (input['typeObjet'] != null) {
        data.typeObjet = input['typeObjet'];
      }
      if (input['statut'] != null) {
        data.statut = input['statut'];
      } 
      if (input['signature'] != null) {
        data.signature = input['signature'];
      } 
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
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
      repos.etatMateriels.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-etatMateriel/<id>', (
      Request request, String id
    ) async {
      var id = request.params['id'];
      repos.etatMateriels.deleteData(int.parse(id!));
      return Response.ok('etatMateriels supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page etatMateriels n\'est pas trouvé'),
    );

    return router;
  }
}