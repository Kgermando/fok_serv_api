import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../models/rh/paiement_salaire_model.dart';
import '../../repository/repository.dart';

class PaiementSalaireHandlers {
  final Repository repos;

  PaiementSalaireHandlers(this.repos);

  Router get router {
    final router = Router();

    router.get('/', (Request request) async {
      List<PaiementSalaireModel> data = await repos.salaires.getAllData();
      return Response.ok(jsonEncode(data));
    });

    router.get('/<id>', (Request request, String id) async {
      late PaiementSalaireModel agent;
      try {
        agent = await repos.salaires.getFromId(int.parse(id));
      } catch (e) {
        print(e);
        return Response(404);
      }
      return Response.ok(jsonEncode(agent.toJson()));
    });

    router.post('/insert-new-paiement', (Request request) async {
      var input = jsonDecode(await request.readAsString());

      PaiementSalaireModel data = PaiementSalaireModel(
         agent: input['agent'],
          observation: bool.hasEnvironment(input['observation']),
          modePaiement: input['modePaiement'],
          salaire: input['salaire'],
          createdAt: DateTime.parse(input['createdAt']),
          approbation: input['approbation'] as bool,
          tauxJourHeureMoisSalaire: input['tauxJourHeureMoisSalaire'],
          joursHeuresPayeA100PourecentSalaire: input['joursHeuresPayeA100PourecentSalaire'],
          totalDuSalaire: input['totalDuSalaire'],
          nombreHeureSupplementaires: input['nombreHeureSupplementaires'],
          tauxHeureSupplementaires: input['tauxHeureSupplementaires'],
          totalDuHeureSupplementaires: input['totalDuHeureSupplementaires'],
          supplementTravailSamediDimancheJoursFerie:input['supplementTravailSamediDimancheJoursFerie'],
          prime: input['prime'],
          divers: input['divers'],
          joursCongesPaye: input['joursCongesPaye'],
          tauxCongesPaye: input['tauxCongesPaye'],
          totalDuCongePaye: input['totalDuCongePaye'],
          jourPayeMaladieAccident: input['jourPayeMaladieAccident'],
          tauxJournalierMaladieAccident: input['tauxJournalierMaladieAccident'],
          totalDuMaladieAccident: input['totalDuMaladieAccident'],
          pensionDeduction: input['pensionDeduction'],
          indemniteCompensatricesDeduction: input['indemniteCompensatricesDeduction'],
          avancesDeduction: input['avancesDeduction'],
          diversDeduction: input['diversDeduction'],
          retenuesFiscalesDeduction: input['retenuesFiscalesDeduction'],
          nombreEnfantBeneficaireAllocationsFamiliales:input['nombreEnfantBeneficaireAllocationsFamiliales'],
          nombreDeJoursAllocationsFamiliales:input['nombreDeJoursAllocationsFamiliales'],
          tauxJoursAllocationsFamiliales: input['tauxJoursAllocationsFamiliales'],
          totalAPayerAllocationsFamiliales: input['totalAPayerAllocationsFamiliales'],
          netAPayer: input['netAPayer'],
          montantPrisConsiderationCalculCotisationsINSS: input['montantPrisConsiderationCalculCotisationsINSS'],
          totalDuBrut: input['totalDuBrut'],
      );
      try {
        await repos.salaires.insertData(data);
      } catch (e) {
        print(e);
        return Response(422);
      }
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.put('/update-paiement/<id>', (Request request) async {
      dynamic input = jsonDecode(await request.readAsString());
      var id = request.params['id'];
      PaiementSalaireModel data =
          await repos.salaires.getFromId(int.parse(id!));

      if (input['agent'] != null) {
        data.agent = input['agent'];
      }
      if (input['observation'] != null) {
        data.observation = bool.hasEnvironment(input['observation']);
      }
      if (input['modePaiement'] != null) {
        data.modePaiement = input['modePaiement'];
      }
      if (input['salaire'] != null) {
        data.salaire = input['salaire'];
      }
      if (input['createdAt'] != null) {
        data.createdAt = DateTime.parse(input['createdAt']);
      }
      if (input['approbation'] != null) {
        data.approbation = input['approbation'] as bool;
      }
      repos.salaires.update(data);
      return Response.ok(jsonEncode(data.toJson()));
    });

    router.delete('/delete-paiement/<id>', (Request request) async {
      var id = request.params['id'];
      repos.salaires.deleteData(int.parse(id!));
      return Response.ok('Supprimée');
    });

    router.all(
      '/<ignored|.*>',
      (Request request) =>
          Response.notFound('La Page paiements salaire n\'est pas trouvé'),
    );
    return router;
  }
}
