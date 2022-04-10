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
        nom: input['nom'],
        postNom: input['postNom'],
        prenom: input['prenom'],
        telephone: input['telephone'],
        adresse: input['adresse'],
        departement: input['departement'],
        numeroSecuriteSociale: input['numeroSecuriteSociale'],
        matricule: input['matricule'],
        servicesAffectation: input['servicesAffectation'],
        salaire: input['salaire'],
        observation: input['observation'] as bool,
        modePaiement: input['modePaiement'],
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
        signatureDG: input['signatureDG'],
        signatureFinance: input['signatureFinance'],
        signatureRH: input['signatureRH']
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

      if (input['nom'] != null) {
        data.nom = input['nom'];
      }
      if (input['postNom'] != null) {
        data.postNom = input['postNom'];
      }
      if (input['prenom'] != null) {
        data.prenom = input['prenom'];
      }
      if (input['telephone'] != null) {
        data.telephone = input['telephone'];
      }
      if (input['adresse'] != null) {
        data.adresse = input['adresse'];
      }
      if (input['departement'] != null) {
        data.departement = input['departement'];
      }
      if (input['numeroSecuriteSociale'] != null) {
        data.numeroSecuriteSociale = input['numeroSecuriteSociale'];
      }
      if (input['matricule'] != null) {
        data.matricule = input['matricule'];
      }
      if (input['servicesAffectation'] != null) {
        data.servicesAffectation = input['servicesAffectation'];
      }
      if (input['salaire'] != null) {
        data.salaire = input['salaire'];
      }
      if (input['observation'] != null) {
        data.observation = bool.hasEnvironment(input['observation']);
      }
      if (input['modePaiement'] != null) {
        data.modePaiement = input['modePaiement'];
      }
      if (input['createdAt'] != null) {
        data.createdAt = DateTime.parse(input['createdAt']);
      }
      if (input['approbation'] != null) {
        data.approbation = input['approbation'] as bool;
      }
      if (input['tauxJourHeureMoisSalaire'] != null) {
        data.tauxJourHeureMoisSalaire = input['tauxJourHeureMoisSalaire'];
      }
      if (input['joursHeuresPayeA100PourecentSalaire'] != null) {
        data.joursHeuresPayeA100PourecentSalaire = input['joursHeuresPayeA100PourecentSalaire'];
      }
      if (input['totalDuSalaire'] != null) {
        data.totalDuSalaire = input['totalDuSalaire'];
      }
      if (input['nombreHeureSupplementaires'] != null) {
        data.nombreHeureSupplementaires = input['nombreHeureSupplementaires'];
      }
      if (input['tauxHeureSupplementaires'] != null) {
        data.tauxHeureSupplementaires = input['tauxHeureSupplementaires'];
      }
      if (input['totalDuHeureSupplementaires'] != null) {
        data.totalDuHeureSupplementaires = input['totalDuHeureSupplementaires'];
      }
      if (input['supplementTravailSamediDimancheJoursFerie'] != null) {
        data.supplementTravailSamediDimancheJoursFerie = input['supplementTravailSamediDimancheJoursFerie'];
      }
      if (input['prime'] != null) {
        data.prime = input['prime'];
      }
      if (input['divers'] != null) {
        data.divers = input['divers'];
      }
      if (input['joursCongesPaye'] != null) {
        data.joursCongesPaye = input['joursCongesPaye'];
      }
      if (input['tauxCongesPaye'] != null) {
        data.tauxCongesPaye = input['tauxCongesPaye'];
      }
      if (input['totalDuCongePaye'] != null) {
        data.totalDuCongePaye = input['totalDuCongePaye'];
      }
      if (input['jourPayeMaladieAccident'] != null) {
        data.jourPayeMaladieAccident = input['jourPayeMaladieAccident'];
      }
      if (input['tauxJournalierMaladieAccident'] != null) {
        data.tauxJournalierMaladieAccident = input['tauxJournalierMaladieAccident'];
      }
      if (input['totalDuMaladieAccident'] != null) {
        data.totalDuMaladieAccident = input['totalDuMaladieAccident'];
      }
      if (input['pensionDeduction'] != null) {
        data.pensionDeduction = input['pensionDeduction'];
      }
      if (input['indemniteCompensatricesDeduction'] != null) {
        data.indemniteCompensatricesDeduction = input['indemniteCompensatricesDeduction'];
      }
      if (input['avancesDeduction'] != null) {
        data.avancesDeduction = input['avancesDeduction'];
      }
      if (input['diversDeduction'] != null) {
        data.diversDeduction = input['diversDeduction'];
      }
      if (input['retenuesFiscalesDeduction'] != null) {
        data.retenuesFiscalesDeduction = input['retenuesFiscalesDeduction'];
      }
      if (input['nombreEnfantBeneficaireAllocationsFamiliales'] != null) {
        data.nombreEnfantBeneficaireAllocationsFamiliales = input['nombreEnfantBeneficaireAllocationsFamiliales'];
      }
      if (input['nombreDeJoursAllocationsFamiliales'] != null) {
        data.nombreDeJoursAllocationsFamiliales = input['nombreDeJoursAllocationsFamiliales'];
      }
      if (input['tauxJoursAllocationsFamiliales'] != null) {
        data.tauxJoursAllocationsFamiliales = input['tauxJoursAllocationsFamiliales'];
      }
      if (input['totalAPayerAllocationsFamiliales'] != null) {
        data.totalAPayerAllocationsFamiliales = input['totalAPayerAllocationsFamiliales'];
      }
      if (input['netAPayer'] != null) {
        data.netAPayer = input['netAPayer'];
      }
      if (input['montantPrisConsiderationCalculCotisationsINSS'] != null) {
        data.montantPrisConsiderationCalculCotisationsINSS = input['montantPrisConsiderationCalculCotisationsINSS'];
      }
      if (input['totalDuBrut'] != null) {
        data.totalDuBrut = input['totalDuBrut'];
      }
      if (input['signatureDG'] != null) {
        data.signatureDG = input['signatureDG'];
      }
      if (input['signatureFinance'] != null) {
        data.signatureFinance = input['signatureFinance'];
      }
      if (input['signatureRH'] != null) {
        data.signatureRH = input['signatureRH'];
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
