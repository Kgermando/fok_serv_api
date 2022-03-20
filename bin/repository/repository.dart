import 'package:postgres/postgres.dart';

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
import 'rh/paiement_repository.dart';
import 'rh/presence_repository.dart';
import 'rh/salaire_repository.dart';
import 'users/refresh_token_repository.dart';
import 'users/users_repository.dart';
  
class Repository {
  final PostgreSQLConnection executor;
  late UsersRepository users;
  late RefreshTokensRepository refreshTokens;
  late SalaireRpository salaires;
  late PresenceRepository presences;
  late PaiementRepository paiements;
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
    users = UsersRepository(executor, 'users');
    refreshTokens = RefreshTokensRepository(executor, 'refresh_tokens');
    salaires = SalaireRpository(executor, 'salaires');
    presences = PresenceRepository(executor, 'presences');
    paiements = PaiementRepository(executor, 'paiements');
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
