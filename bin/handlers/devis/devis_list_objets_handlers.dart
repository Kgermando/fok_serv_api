import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/devis/devis_list_objets_model.dart';
import '../../repository/repository.dart';

class DevisListObjetsHandlers {
  final Repository repos;

  DevisListObjetsHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<DevisListObjetsModel> data = await repos.devisListObjets.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late DevisListObjetsModel data;
      try {
        data = await repos.devisListObjets.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-devis-list-objet', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      DevisListObjetsModel data = DevisListObjetsModel(
          referenceDate: DateTime.parse(input['referenceDate']),
          title: input['title'],
          quantity: input['quantity'],
          designation: input['designation'],
          montantUnitaire: input['montantUnitaire'],
          montantGlobal: input['montantGlobal'],
      );
      try {
        await repos.devisListObjets.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-devis-list-objet/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = DevisListObjetsModel.fromJson(input);
      DevisListObjetsModel? data =
          await repos.devisListObjets.getFromId(editH.id!); 
          
      if (input['referenceDate'] != null) {
        data.referenceDate = DateTime.parse(input['referenceDate']);  // A ne pas modifier ficher reference
      }
      // if (input['title'] != null) {   // A ne pas modifier ficher reference
      //   data.title = input['title'];
      // }
      if (input['quantity'] != null) {
        data.quantity = input['quantity'];
      }
      if (input['designation'] != null) {
        data.designation = input['designation'];
      }
      if (input['montantUnitaire'] != null) {
        data.montantUnitaire = input['montantUnitaire'];
      }
      if (input['montantGlobal'] != null) {
        data.montantGlobal = input['montantGlobal'];
      }

      repos.devisListObjets.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-devis-list-objet/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.devis.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) => Response.notFound('La Page devis n\'est pas trouvé'),
    );

    return router;
  }
}
