import 'package:postgres/postgres.dart';

import '../models/rh/paiement_salaire_model.dart';
import 'comptabilites/amrtissement_repository.dart';
import 'comptabilites/bilan_repository.dart';
import 'comptabilites/journal_repository.dart';
import 'comptabilites/valorisation_repository.dart';
import 'finances/banque_repository.dart';
import 'finances/caissses_repository.dart';
import 'finances/creances_repository.dart';
import 'finances/depenses_repository.dart';
import 'finances/dettes_repository.dart';
import 'finances/fin_exterieur_repository.dart';
import 'rh/agents_repository.dart';
import 'rh/paiement_divers_repository copy.dart';
import 'rh/paiement_salaire_repository.dart';
import 'rh/performence_repository.dart';
import 'rh/presence_repository.dart';
import 'user/refresh_token_repository.dart';
import 'user/user_repository.dart';

class Repository {
  final PostgreSQLConnection executor;
  late RefreshTokensRepository refreshTokens;
  late UserRepository users;
  late AgentsRepository agents;
  late PaiementSalaireRepository salaires;
  late PaiementDiversRepository paiementDivers;
  late PresenceRepository presences;
  late PerformenceRepository performences;
  late BanqueRepository banques;
  late CaissesRepository caisses;
  late CreancesRepository creances;
  late DepensesRepository depenses;
  late DettesRepository dettes;
  late FinExteRepository finExterieurs;
  late AmortissementRepository amortissements;
  late BilanRepository bilans;
  late JournalRepository journals;
  late ValorisationRepository valorisations; 

  Repository(this.executor) {
    refreshTokens = RefreshTokensRepository(executor, 'refresh_tokens');
    users = UserRepository(executor, 'users');
    agents = AgentsRepository(executor, 'agents');
    salaires = PaiementSalaireRepository(executor, 'salaires');
    paiementDivers = PaiementDiversRepository(executor, 'paiement_divers');
    presences = PresenceRepository(executor, 'presences');
    performences = PerformenceRepository(executor, 'performences');
    banques = BanqueRepository(executor, 'banques');
    caisses = CaissesRepository(executor, 'caisses');
    creances = CreancesRepository(executor, 'creances');
    depenses = DepensesRepository(executor, 'depenses');
    dettes = DettesRepository(executor, 'dettes');
    finExterieurs = FinExteRepository(executor, 'fin_exterieurs');
    amortissements = AmortissementRepository(executor, 'amortissements');
    bilans = BilanRepository(executor, 'bilans');
    journals = JournalRepository(executor, 'journals');
    valorisations = ValorisationRepository(executor, 'valorisations');
  }
}
