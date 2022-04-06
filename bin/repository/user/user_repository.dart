import 'dart:math';

import 'package:postgres/postgres.dart';

import '../../models/users/user_model.dart';

class UserRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  UserRepository(this.executor, this.tableName);
  
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
      "SELECT id FROM $tableName WHERE \"matricule\"='$matricule' AND \"passwordHash\"='$passwordHash'");
    return data[0][0];
  }

  Future<List<UserModel>> getAllData() async {
    var data = <UserModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"createdAt\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(UserModel.fromSQL(row));
    }
    return data.toList();
  }


  Future<void> insertData(UserModel user) async {
    var photo = user.photo;
    var nom = user.nom;
    var prenom = user.prenom;
    var role = user.role;
    var matricule = user.matricule;
    var isOnline = user.isOnline;
    var createdAt = user.createdAt;
    var passwordHash = user.passwordHash;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('users_id_seq'), '$photo', '$nom', '$prenom',"
        "'$matricule', '$role', '$isOnline', '$createdAt', '$passwordHash');");
    });

  }


  Future<UserModel> getFromId(int id) async {
    var data = await executor
        .query("SELECT * FROM  $tableName WHERE \"id\"='$id'");
    return UserModel(
      id: data[0][0],
      photo: data[0][1],
      nom: data[0][2],
      prenom: data[0][3],
      matricule: data[0][4],
      role: data[0][5],
      isOnline: data[0][6],
      createdAt: data[0][7],
      passwordHash: data[0][8]
    );
  }


  Future<void> update(UserModel user) async {
    var id = user.id;
    var photo = user.photo;
    var nom = user.nom;
    var prenom = user.prenom;
    var matricule = user.matricule;
    var role = user.role;
    var isOnline = user.isOnline;
    var createdAt = user.createdAt;
    var passwordHash = user.passwordHash;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"photo\"='$photo', \"nom\"='$nom',"
        "\"prenom\"='$prenom', \"matricule\"='$matricule', \"role\"='$role',"
        "\"isOnline\"='$isOnline', \"createdAt\"='$createdAt', \"passwordHash\"='$passwordHash' WHERE id=$id;");
    });
  }

  deleteData(int id) async {
    try {
      await executor.transaction((conn) async {
        // ignore: unused_local_variable
        var result = await conn.execute('DELETE FROM $tableName WHERE id=$id;');
      });
    } catch (e) {
      'erreur $e';
    }
  }

}  