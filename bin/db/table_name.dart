import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

class TableName {
  // Tables
  final tableUser = 'users';
  final tableToken = 'refresh_tokens';
  final tableSalaire = 'salaires';
  final tablePresence = 'presences';
  final tablePaiement = 'paiements';

  final banquesTable = 'banques';
  final caissesTable = 'caisses';
  final creancesTable = 'creances';
  final depensesTable = 'depenses';
  final dettesTable = 'dettes';
  final finExterieursTable = 'fin_exterieurs';
  final amortissementsTable = 'amortissements';
  final bilansTable = 'bilans';
  final journalsTable = 'journals';
  final valorisationTable = 'valorisations';
  
  // Type database
  final key = 'serial primary key NOT NULL';
  final vachar = 'VARCHAR NOT NULL';
  final timestamp = 'TIMESTAMP NOT NULL';
  final list = 'JSON NULL';
  final bool = 'BOOLEAN NOT NULL';

  Future openConnection(PostgreSQLConnection connection) async {
    try {
      await connection.open();
      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableUser(
          "id" $key,
          "nom" $vachar,
          "postNom" $vachar,
          "prenom" $vachar,
          "email" $vachar,
          "telephone" $vachar,
          "adresse" $vachar,
          "sexe" $vachar,
          "role" $vachar,
          "matricule" $vachar,
          "dateNaissance" $timestamp,
          "lieuNaissance" $vachar,
          "nationalite" $vachar,
          "typeContrat" $vachar,
          "departement" $vachar,
          "servicesAffectation" $vachar,
          "dateDebutContrat" $timestamp,
          "dateFinContrat" $timestamp,
          "fonctionOccupe" $vachar,
          "competance" $list,
          "experience" $list,
          "rate" $vachar,
          "statutAgent" $bool,
          "isOnline" $bool,
          "createdAt" $timestamp,
          "passwordHash" $vachar
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableToken(
          "id" $key,
          "owner" $vachar,
          "token" $vachar
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tableSalaire(
          "id" $key,
          "matricule" $vachar,
          "salaire" $vachar,
          "date" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePresence(
          "id" $key,
          "matricule" $vachar,
          "arrive" $timestamp,
          "sortie" $timestamp,
          "presence" $vachar,
          "motif" $vachar,
          "created" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $tablePaiement(
          "id" $key,
          "matricule" $vachar,
          "observation" $bool,
          "modePaiement" $vachar,
          "prime" $vachar,
          "created" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $banquesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $caissesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "departement" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
          
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $creancesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
      );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $depensesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "naturePayement" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "modePayement" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $dettesTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $finExterieursTable(
          "id" $key,
          "nomComplet" $vachar,
          "pieceJustificative" $vachar,
          "libelle" $vachar,
          "montant" $vachar,
          "coupureBillet" $list,
          "ligneBudgtaire" $vachar,
          "typeOperation" $vachar,
          "numeroOperation" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $amortissementsTable(
          "id" $key,
          "titleArmotissement" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeJournal" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $bilansTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeBilan" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $journalsTable(
          "id" $key,
          "titleBilan" $vachar,
          "comptes" $vachar,
          "intitule" $vachar,
          "montant" $vachar,
          "typeJournal" $vachar,
          "created" $timestamp
        );
      ''');

      await connection.query('''
        CREATE TABLE IF NOT EXISTS $valorisationTable(
          "id" $key,
          "numeroOrdre" $vachar,
          "intitule" $vachar,
          "quantite" $vachar,
          "prixUnitaire" $vachar,
          "prixTotal" $vachar,
          "source" $vachar,
          "created" $timestamp
        );
      ''');

      print("Tables created succes!");
      return connection;
    } catch (e) {
      print("TableName: $e");
      return Response(403);
    }
  }
}
