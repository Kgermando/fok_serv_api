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
        approbationDG: input['approbationDG'],
        signatureDG: input['signatureDG'],
        signatureJustificationDG: input['signatureJustificationDG'],
        approbationFin: input['approbationFin'],
        signatureFin: input['signatureFin'],
        signatureJustificationFin: input['signatureJustificationFin'],
        approbationBudget: input['approbationBudget'],
        signatureBudget: input['signatureBudget'],
        signatureJustificationBudget: input['signatureJustificationBudget'],
        approbationDD: input['approbationDD'],
        signatureDD: input['signatureDD'],
        signatureJustificationDD: input['signatureJustificationDD'],
        signature: input['signature'],
        created: DateTime.parse(input['created']));

      try {
        await repos.etatMateriels.insertData(etatMaterielModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(etatMaterielModel.toJson()));
    });

    router.put('/update-etat-materiel/<id>', (Request request, String id) async {
      var id = request.params['id'];
      EtatMaterielModel data = await repos.etatMateriels.getFromId(int.parse(id!));
      dynamic input = jsonDecode(await request.readAsString());

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
      if (input['approbationDG'] != null) {
        data.approbationDG = input['approbationDG'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureJustificationDG'] != null) {
        data.signatureJustificationDG = input['signatureJustificationDG'];
      }

      if (input['approbationFin'] != null) {
        data.approbationFin = input['approbationFin'];
      }
      if (input['signatureFin'] != null) {
        data.signatureFin = input['signatureFin'];
      }
      if (input['signatureJustificationFin'] != null) {
        data.signatureJustificationFin = input['signatureJustificationFin'];
      }

      if (input['approbationBudget'] != null) {
        data.approbationBudget = input['approbationBudget'];
      }
      if (input['signatureBudget'] != null) {
        data.signatureBudget = input['signatureBudget'];
      }
      if (input['signatureJustificationBudget'] != null) {
        data.signatureJustificationBudget =
            input['signatureJustificationBudget'];
      }

      if (input['approbationDD'] != null) {
        data.approbationDD = input['approbationDD'];
      }
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }
      if (input['signatureJustificationDD'] != null) {
        data.signatureJustificationDD = input['signatureJustificationDD'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.etatMateriels.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-etatMateriel/<id>', (
      String id,
      Request request,
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