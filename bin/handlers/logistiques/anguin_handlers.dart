import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/charts/pie_chart_model.dart';
import '../../models/logistiques/anguin_model.dart';
import '../../repository/repository.dart';

class AnguinHandlers {
  final Repository repos;

  AnguinHandlers(this.repos);
  
  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<AnguinModel> data = await repos.anguins.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/chart-pie-genre/', (Request request) async {
      List<PieChartEnguinModel> data =
          await repos.anguins.getChartPie();
      return Response.ok(jsonEncode(data));
    });


    router.get('/<id>', (Request request, String id) async {
      late AnguinModel anguinModel;
      try {
        anguinModel = await repos.anguins.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(anguinModel.toJson()));
    });

    router.post('/insert-new-anguin', (Request request) async {
      var input = jsonDecode(await request.readAsString());
      AnguinModel anguinModel = AnguinModel(
        nom: input['nom'],
        modele: input['modele'],
        marque: input['marque'],
        numeroChassie: input['numeroChassie'],
        couleur: input['couleur'],
        genre: input['genre'],
        qtyMaxReservoir: input['qtyMaxReservoir'],
        dateFabrication: DateTime.parse(input['dateFabrication']),
        nomeroPLaque: input['nomeroPLaque'],
        nomeroEntreprise: input['nomeroEntreprise'],
        kilometrageInitiale: input['kilometrageInitiale'],
        provenance: input['provenance'],
        typeCaburant: input['typeCaburant'],
        typeMoteur: input['typeMoteur'],
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
        await repos.anguins.insertData(anguinModel);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(anguinModel.toJson()));
    });

    router.put('/update-anguin/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = AnguinModel.fromJson(input);
      AnguinModel? data =
          await repos.anguins.getFromId(editH.id!); 

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['modele'] != null) {
        data.modele = input['modele'];
      }
      if (input['marque'] != null) {
        data.marque = input['marque'];
      }
      if (input['numeroChassie'] != null) {
        data.numeroChassie = input['numeroChassie'];
      }
      if (input['couleur'] != null) {
        data.couleur = input['couleur'];
      }
      if (input['qtyMaxReservoir'] != null) {
        data.qtyMaxReservoir = input['qtyMaxReservoir'];
      }
      if (input['dateFabrication'] != null) {
        data.dateFabrication = DateTime.parse(input['dateFabrication']);
      }
      if (input['nomeroPLaque'] != null) {
        data.nomeroPLaque = input['nomeroPLaque'];
      }
      if (input['nomeroEntreprise'] != null) {
        data.nomeroEntreprise = input['nomeroEntreprise'];
      }
      if (input['kilometrageInitiale'] != null) {
        data.kilometrageInitiale = input['kilometrageInitiale'];
      }
      if (input['provenance'] != null) {
        data.provenance = input['provenance'];
      }
      if (input['typeCaburant'] != null) {
        data.typeCaburant = input['typeCaburant'];
      }
      if (input['typeMoteur'] != null) {
        data.typeMoteur = input['typeMoteur'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['createdRef'] != null) {
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
      if (input['signatureDD'] != null) {
        data.signatureDD = input['signatureDD'];
      }


      repos.anguins.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-anguin/<id>', (
      Request request,
      String id
    ) async {
      var id = request.params['id'];
      repos.anguins.deleteData(int.parse(id!));
      return Response.ok('anguins supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page anguins n\'est pas trouvé'),
    );

    return router;
  }
}