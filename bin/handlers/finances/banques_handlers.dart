import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/finances/banque_model.dart';
import '../../repository/repository.dart';

class BanqueHandlers {
  final Repository repos;

  BanqueHandlers(this.repos);

  Router get router {
    final router = Router();


    router.get('/', (Request request) async {
      List<BanqueModel> data = await repos.banques.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.post('/insert-new-transaction-banque', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      BanqueModel data = BanqueModel(
          nomComplet: input['nomComplet'],
          pieceJustificative: input['pieceJustificative'],
          libelle: input['libelle'],
          montant: input['montant'],
          coupureBillet: input['coupureBillet'],
          ligneBudgtaire: input['ligneBudgtaire'],
          departement: input['departement'],
          typeOperation: input['typeOperation'],
          numeroOperation: input['numeroOperation'],
          created: DateTime.parse(input['created']));
      try {
        await repos.banques.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-transaction-banque/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      BanqueModel data = await repos.banques.getFromId(int.parse(id!));

      if (input['nomComplet'] != null) {
        data.nomComplet = input['nomComplet'];
      }
      if (input['pieceJustificative'] != null) {
        data.pieceJustificative = input['pieceJustificative'];
      }
      if (input['libelle'] != null) {
        data.libelle = input['libelle'];
      }
      if (input['montant'] != null) {
        data.montant = input['montant'];
      }
      if (input['coupureBillet'] != null) {
        data.coupureBillet = input['coupureBillet'];
      }
      if (input['ligneBudgtaire'] != null) {
        data.ligneBudgtaire = input['ligneBudgtaire'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['typeOperation'] != null) {
        data.typeOperation = input['typeOperation'];
      }
      if (input['numeroOperation'] != null) {
        data.numeroOperation = input['numeroOperation'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.banques.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-transaction-banque/<id>', (Request request) async {
      var id = request.params['id'];
      repos.banques.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page banque n\'est pas trouvé'),
    );

    return router;
  }
}
