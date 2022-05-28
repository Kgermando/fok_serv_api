import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/comptabilites/compte_resultat_model.dart';
import '../../repository/repository.dart';

class CompteResultatHandlers {
  final Repository repos;

  CompteResultatHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<CompteResulatsModel> data = await repos.comptesResultat.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late CompteResulatsModel data;
      try {
        data = await repos.comptesResultat.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.post('/insert-new-compte-resultat', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      CompteResulatsModel data = CompteResulatsModel(
          intitule: input['intitule'],

          achatMarchandises: input['achatMarchandises'],
          variationStockMarchandises: input['variationStockMarchandises'],
          achatApprovionnements: input['achatApprovionnements'],
          variationApprovionnements: input['variationApprovionnements'],
          autresChargesExterne: input['autresChargesExterne'],
          impotsTaxesVersementsAssimiles: input['impotsTaxesVersementsAssimiles'],
          renumerationPersonnel: input['renumerationPersonnel'],
          chargesSocialas: input['chargesSocialas'],
          dotatiopnsProvisions: input['dotatiopnsProvisions'],
          autresCharges: input['autresCharges'],
          chargesfinancieres: input['chargesfinancieres'],
          chargesExptionnelles: input['chargesExptionnelles'],
          impotSurbenefices: input['impotSurbenefices'],
          soldeCrediteur: input['soldeCrediteur'],
          ventesMarchandises: input['ventesMarchandises'],
          productionVendueBienEtSerices: input['productionVendueBienEtSerices'],
          productionStockee: input['productionStockee'],
          productionImmobilisee: input['productionImmobilisee'],
          subventionExploitation: input['subventionExploitation'],
          autreProduits: input['autreProduits'],
          montantExportation: input['montantExportation'],
          produitfinancieres: input['produitfinancieres'],
          produitExceptionnels: input['produitExceptionnels'],
          soldeDebiteur: input['soldeDebiteur'],
          signature: input['signature'],
          created: DateTime.parse(input['created']));
      try {
        await repos.comptesResultat.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-compte-resultat/<id>',
        (Request request, String id) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      CompteResulatsModel data =
          await repos.comptesResultat.getFromId(int.parse(id!));

      if (input['intitule'] != null) {
        data.intitule = input['intitule'];
      }

      if (input['achatMarchandises'] != null) {
        data.achatMarchandises = input['achatMarchandises'];
      }
      if (input['variationStockMarchandises'] != null) {
        data.variationStockMarchandises = input['variationStockMarchandises'];
      }
      if (input['achatApprovionnements'] != null) {
        data.achatApprovionnements = input['achatApprovionnements'];
      }
      if (input['variationApprovionnements'] != null) {
        data.variationApprovionnements = input['variationApprovionnements'];
      }
      if (input['autresChargesExterne'] != null) {
        data.autresChargesExterne = input['autresChargesExterne'];
      }
      if (input['chargesfinancieres'] != null) {
        data.chargesfinancieres = input['chargesfinancieres'];
      }
      if (input['impotsTaxesVersementsAssimiles'] != null) {
        data.impotsTaxesVersementsAssimiles = input['impotsTaxesVersementsAssimiles'];
      }
      if (input['renumerationPersonnel'] != null) {
        data.renumerationPersonnel = input['renumerationPersonnel'];
      }
      if (input['chargesSocialas'] != null) {
        data.chargesSocialas = input['chargesSocialas'];
      }
      if (input['dotatiopnsProvisions'] != null) {
        data.dotatiopnsProvisions = input['dotatiopnsProvisions'];
      }
      if (input['autresCharges'] != null) {
        data.autresCharges = input['autresCharges'];
      }
      if (input['chargesExptionnelles'] != null) {
        data.chargesExptionnelles = input['chargesExptionnelles'];
      }
      if (input['impotSurbenefices'] != null) {
        data.impotSurbenefices = input['impotSurbenefices'];
      }
      if (input['soldeCrediteur'] != null) {
        data.soldeCrediteur = input['soldeCrediteur'];
      }
      if (input['ventesMarchandises'] != null) {
        data.ventesMarchandises = input['ventesMarchandises'];
      }
      if (input['productionVendueBienEtSerices'] != null) {
        data.productionVendueBienEtSerices = input['productionVendueBienEtSerices'];
      }
      if (input['productionStockee'] != null) {
        data.productionStockee = input['productionStockee'];
      }
      if (input['productionImmobilisee'] != null) {
        data.productionImmobilisee = input['productionImmobilisee'];
      }
      if (input['subventionExploitation'] != null) {
        data.subventionExploitation = input['subventionExploitation'];
      }
      if (input['autreProduits'] != null) {
        data.autreProduits = input['autreProduits'];
      }
      if (input['montantExportation'] != null) {
        data.montantExportation = input['montantExportation'];
      }
      if (input['produitfinancieres'] != null) {
        data.produitfinancieres = input['produitfinancieres'];
      }
      if (input['produitExceptionnels'] != null) {
        data.produitExceptionnels = input['produitExceptionnels'];
      }
      if (input['soldeDebiteur'] != null) {
        data.soldeDebiteur = input['soldeDebiteur'];
      }

      if (input['signature'] != null) {
        data.signature = input['signature'];
      }
      if (input['created'] != null) {
        data.created = DateTime.parse(input['created']);
      }
      repos.comptesResultat.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-compte-resultat/<id>',
        (Request request, String id) async {
      var id = request.params['id'];
      repos.comptesResultat.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page compte-resultat n\'est pas trouvé'),
    );

    return router;
  }
}
