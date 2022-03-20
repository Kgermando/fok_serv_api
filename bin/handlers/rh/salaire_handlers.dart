import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/salaire_model.dart';
import '../../repository/repository.dart';

class SalaireHandlers {
  final Repository repos;
  SalaireHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<SalaireModel> salaires = await repos.salaires.getAllData();
      return Response.ok(jsonEncode(salaires));
    });

    router.post('/insert-new-salaire', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      SalaireModel data = SalaireModel(
          matricule: input['matricule'],
          salaire: input['salaire'],
          date: DateTime.parse(input['date']));
      try {
        await repos.salaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });



    router.put('/update-salaire/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      SalaireModel data = await repos.salaires.getFromId(int.parse(id!));

      // if (input['matricule'] != null) {
      //   salaireModel.matricule = input['matricule'];
      // }
      if (input['salaire'] != null) {
        data.salaire = input['salaire'];
      }
      if (input['date'] != null) {
        data.date = DateTime.parse(input['date']);
      }
      repos.salaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });



    router.delete('/delete-salaire/<id>', (Request request) async {
      // SalaireModel salaireModel = await repos.salaires.getFromId(id);
      var id = request.params['id'];
      repos.salaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page salaire n\'est pas trouvé'),
    );

    return router;
  }
}
