import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/charts/pie_chart_model.dart'; 
import '../../models/logistiques/material_model.dart';
import '../../repository/repository.dart';

class MaterielHandlers {
  final Repository repos;

  MaterielHandlers(this.repos);
  
  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<MaterielModel> data = await repos.materielRepository.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-pie-genre/', (Request request) async {
      List<PieChartEnguinModel> data =
          await repos.materielRepository.getChartPie();
      return Response.ok(jsonEncode(data));
    });


    router.get('/<id>', (Request request, String id) async {
      late MaterielModel dataItem;
      try {
        dataItem = await repos.materielRepository.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.post('/insert-new-materiel', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      MaterielModel dataItem = MaterielModel(
        typeMateriel: input['typeMateriel'],
        marque: input['marque'],
        modele: input['modele'],
        numeroRef: input['numeroRef'],
        couleur: input['couleur'],
        genre: input['genre'],
        qtyMaxReservoir: input['qtyMaxReservoir'],
        dateFabrication: DateTime.parse(input['dateFabrication']),
        numeroPLaque: input['numeroPLaque'],
        identifiant: input['identifiant'],
        kilometrageInitiale: input['kilometrageInitiale'],
        fournisseur: input['fournisseur'],
        alimentation: input['alimentation'], 
        signature: input['signature'], 
        created: DateTime.parse(input['created']),

        approbationDG: input['approbationDG'],
        motifDG: input['motifDG'],
        signatureDG: input['signatureDG'],
        approbationDD: input['approbationDD'],
        motifDD: input['motifDD'],
        signatureDD: input['signatureDD']
      );

      try {
        await repos.materielRepository.insertData(dataItem);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(dataItem.toJson()));
    });

    router.put('/update-materiel/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = MaterielModel.fromJson(input);
      MaterielModel? data =
          await repos.materielRepository.getFromId(editH.id!);

      if (input['typeMateriel'] != null) {
        data.typeMateriel = input['typeMateriel'];
      }
      if (input['marque'] != null) {
        data.marque = input['marque'];
      }
      if (input['modele'] != null) {
        data.modele = input['modele'];
      }
      if (input['numeroRef'] != null) {
        data.numeroRef = input['numeroRef'];
      }
      if (input['couleur'] != null) {
        data.couleur = input['couleur'];
      }
      if (input['genre'] != null) {
        data.genre = input['genre'];
      }
      if (input['qtyMaxReservoir'] != null) {
        data.qtyMaxReservoir = input['qtyMaxReservoir'];
      }
      if (input['dateFabrication'] != null) {
        data.dateFabrication = DateTime.parse(input['dateFabrication']);
      }
      if (input['numeroPLaque'] != null) {
        data.numeroPLaque = input['numeroPLaque'];
      }
      if (input['identifiant'] != null) {
        data.identifiant = input['identifiant'];
      }
      if (input['kilometrageInitiale'] != null) {
        data.kilometrageInitiale = input['kilometrageInitiale'];
      }
      if (input['kilometrageInitiale'] != null) {
        data.kilometrageInitiale = input['kilometrageInitiale'];
      }
      if (input['fournisseur'] != null) {
        data.fournisseur = input['fournisseur'];
      }
      if (input['alimentation'] != null) {
        data.alimentation = input['alimentation'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
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
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }


      repos.materielRepository.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-materiel/<id>', (
      Request request,
      String id
    ) async {
      var id = request.params['id'];
      repos.materielRepository.deleteData(int.parse(id!));
      return Response.ok('anguins supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page materiels n\'est pas trouvé'),
    );

    return router;
  }
}