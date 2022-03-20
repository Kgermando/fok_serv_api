import 'dart:math';

import 'package:postgres/postgres.dart';

import '../../db/config_db.dart';
import '../../models/users/user_model.dart';

class UsersRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  UsersRepository(this.executor, this.tableName);
  
  Future<int> _generateId() async {
    int id = Random().nextInt(2147483647);
    while (!await _isUniqueId(id)) {
      id = Random().nextInt(2147483647);
    }
    return id;
  }
 
  Future<bool> _isUniqueId(int id) async {
    var data = await executor.query(
      "SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return data.isEmpty ? true : data[0].isEmpty;
  }


  Future<bool> isUniqueLogin(String matricule) async {
    var data = await executor.query(
        "SELECT * FROM  $tableName WHERE \"matricule\" = '$matricule'");
    return data.isEmpty ? true : data[0].isEmpty;
  }

  Future<int> getIdFromLoginPassword(
      String matricule, String passwordHash) async {
    var data = await executor.query(
      "SELECT id FROM  $tableName WHERE \"matricule\"='$matricule' AND \"passwordHash\"='$passwordHash'");
    return data[0][0];
  }


  Future<void> insertData(UserModel user) async {
    // var id = user.id;
    var nom = user.nom;
    var postNom = user.postNom;
    var prenom = user.prenom;
    var email = user.email;
    var telephone = user.telephone;
    var adresse = user.adresse;
    var sexe = user.sexe;
    var role = user.role;
    var matricule = user.matricule;
    var dateNaissance = user.dateNaissance;
    var lieuNaissance = user.lieuNaissance;
    var nationalite = user.nationalite;
    var typeContrat = user.typeContrat;
    var departement = user.departement;
    var servicesAffectation = user.servicesAffectation;
    var dateDebutContrat = user.dateDebutContrat;
    var dateFinContrat = user.dateFinContrat;
    var fonctionOccupe = user.fonctionOccupe;
    var competance = user.competance;
    var experience = user.experience;
    var rate = user.rate;
    var statutAgent = user.statutAgent;
    var isOnline = user.isOnline;
    var createdAt = user.createdAt;
    var passwordHash = user.passwordHash;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
          "INSERT INTO $tableName VALUES (nextval('users_id_seq'), '$nom',"
          "'$postNom', '$prenom', '$email', '$telephone', '$adresse', '$sexe',"
          "'$role', '$matricule', '$dateNaissance', '$lieuNaissance',"
          "'$nationalite', '$typeContrat', '$departement','$servicesAffectation',"
          "'$dateDebutContrat', '$dateFinContrat','$fonctionOccupe',"
          "'$competance', '$experience', '$rate', '$statutAgent', '$isOnline',"
          "'$createdAt', '$passwordHash');");
    });
    // await ConnexionDatabase().closeConnection(executor);
  }


  Future<UserModel> getFromId(int id) async {
    var data = await executor
        .query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return UserModel(
      id: data[0][0],
      nom: data[0][1],
      postNom: data[0][2],
      prenom: data[0][3],
      email: data[0][4],
      telephone: data[0][5],
      adresse: data[0][6],
      sexe: data[0][7],
      role: data[0][8],
      matricule: data[0][9],
      dateNaissance: data[0][10],
      lieuNaissance: data[0][11],
      nationalite: data[0][12],
      typeContrat: data[0][13],
      departement: data[0][14],
      servicesAffectation: data[0][15],
      dateDebutContrat: data[0][16],
      dateFinContrat: data[0][17],
      fonctionOccupe: data[0][18],
      competance: data[0][19],
      experience: data[0][20],
      rate: data[0][21],
      statutAgent: data[0][22],
      isOnline: data[0][23],
      createdAt: data[0][24],
      passwordHash: data[0][25],
    );
  }


  Future<void> update(UserModel user) async {
    var id = user.id;
    var nom = user.nom;
    var postNom = user.postNom;
    var prenom = user.prenom;
    var email = user.email;
    var telephone = user.telephone;
    var adresse = user.adresse;
    var sexe = user.sexe;
    var role = user.role;
    var matricule = user.matricule;
    var dateNaissance = user.dateNaissance;
    var lieuNaissance = user.lieuNaissance;
    var nationalite = user.nationalite;
    var typeContrat = user.typeContrat;
    var departement = user.departement;
    var servicesAffectation = user.servicesAffectation;
    var dateDebutContrat = user.dateDebutContrat;
    var dateFinContrat = user.dateFinContrat;
    var fonctionOccupe = user.fonctionOccupe;
    var competance = user.competance;
    var experience = user.experience;
    var rate = user.rate;
    var statutAgent = user.statutAgent;
    var isOnline = user.isOnline;
    var createdAt = user.createdAt;
    var passwordHash = user.passwordHash;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"nom\"='$nom', \"postNom\"='$postNom',"
        "\"prenom\"='$prenom', \"email\"='$email', \"telephone\"='$telephone',"
        "\"adresse\"='$adresse', \"sexe\"='$sexe', \"role\"='$role',"
        "\"matricule\"='$matricule', \"dateNaissance\"='$dateNaissance',"
        "\"lieuNaissance\"='$lieuNaissance', \"nationalite\"='$nationalite',"
        "\"typeContrat\"='$typeContrat', \"departement\"='$departement',"
        "\"servicesAffectation\"='$servicesAffectation',"
        "\"dateDebutContrat\"='$dateDebutContrat',"
        "\"dateFinContrat\"='$dateFinContrat', \"fonctionOccupe\"='$fonctionOccupe',"
        "\"competance\"='$competance', \"experience\"='$experience',"
        "\"rate\"='$rate',\"statutAgent\"='$statutAgent',\"isOnline\"='$isOnline'"
        "\"createdAt\"='$createdAt', \"passwordHash\"='$passwordHash' WHERE id=$id;");
    });

    // await ConnexionDatabase().closeConnection(executor);
  }

}  