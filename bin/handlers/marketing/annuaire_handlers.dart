import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
 
import '../../models/marketing/annuaire_model.dart';
import '../../repository/repository.dart';

class AnnuaireHandlers {
  final Repository repos;

  AnnuaireHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/<business>/', (Request request, String business) async {
      List<AnnuaireModel> data = await repos.annuaires.getAllData(business);
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late AnnuaireModel data;
      try {
        data = await repos.annuaires.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-annuaire', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      AnnuaireModel data = AnnuaireModel(
          categorie: input['categorie'],
          nomPostnomPrenom: input['nomPostnomPrenom'],
          email: input['email'],
          mobile1: input['mobile1'],
          mobile2: input['mobile2'],
          secteurActivite: input['secteurActivite'],
          nomEntreprise: input['nomEntreprise'],
          grade: input['grade'],
          adresseEntreprise: input['adresseEntreprise'],
          succursale: input['succursale'],
          signature: input['signature'],
          created: DateTime.parse(input['created']),
        business: input['business'],
        sync: input['sync'],
        async: input['async'],
      );
      try {
        await repos.annuaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-annuaire/', (Request request) async {
       dynamic input = jsonDecode(await request.readAsString());
      final editH = AnnuaireModel.fromJson(input);
      AnnuaireModel? data =
          await repos.annuaires.getFromId(editH.id!); 

      if (input['categorie'] != null) {
        data.categorie = input['categorie'];
      }
      if (input['nomPostnomPrenom'] != null) {
        data.nomPostnomPrenom = input['nomPostnomPrenom'];
      }
      if (input['email'] != null) {
        data.email = input['email'];
      }
      if (input['mobile1'] != null) {
        data.mobile1 = input['mobile1'];
      }
      if (input['mobile2'] != null) {
        data.mobile2 = input['mobile2'];
      }
      if (input['secteurActivite'] != null) {
        data.secteurActivite = input['secteurActivite'];
      }
      if (input['nomEntreprise'] != null) {
        data.nomEntreprise = input['nomEntreprise'];
      }
      if (input['grade'] != null) {
        data.grade = input['grade'];
      }
      if (input['adresseEntreprise'] != null) {
        data.adresseEntreprise = input['adresseEntreprise'];
      }
      if (input['succursale'] != null) {
        data.succursale = input['succursale'];
      }
      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      if (input['business'] != null) {
        data.business = input['business'];
      }
      if (input['sync'] != null) {
        data.sync = input['sync'];
      }
      if (input['async'] != null) {
        data.async = input['async'];
      }
      repos.annuaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-annuaire/<id>', (Request request, String id) async {
      var id = request.params['id'];
      repos.annuaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page annuaires n\'est pas trouvé'),
    );

    return router;
  }
}
