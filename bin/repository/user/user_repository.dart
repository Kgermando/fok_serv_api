import 'package:postgres/postgres.dart';

import '../../models/users/user_model.dart';

class UserRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  UserRepository(this.executor, this.tableName);
  
  // Future<int> _generateId() async {
  //   int id = Random().nextInt(2147483647);
  //   while (!await _isUniqueId(id)) {
  //     id = Random().nextInt(2147483647);
  //   }
  //   return id;
  // }
 
  // Future<bool> _isUniqueId(int id) async {
  //   var data = await executor.query(
  //     "SELECT * FROM  $tableName WHERE \"id\" = '$id'");
  //   return data.isEmpty ? true : data[0].isEmpty;
  // }


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


  Future<void> insertData(UserModel data) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, photo, nom, prenom, email, telephone,"
          "role, matricule, departement, services_affectation, fonction_occupe,"
          "is_online, created_at, password_hash, succursale)"
          "VALUES (nextval('users_id_seq'), @1, @2, @3, @4, @5, @6, @7,"
            "@8, @9, @10, @11, @12, @13, @14)",
          substitutionValues: {
            '1': data.photo,
            '2': data.nom,
            '3': data.prenom,
            '4': data.email,
            '5': data.telephone,
            '6': data.role,
            '7': data.matricule,
            '8': data.departement,
            '9': data.servicesAffectation,
            '10': data.fonctionOccupe,
            '11': data.isOnline,
            '12': data.createdAt,
            '13': data.passwordHash,
            '14': data.succursale
          });
    });  

  } 

  Future<void> update(UserModel data) async {
    await executor.transaction((conn) async {
      await conn.query(
          "UPDATE $tableName"
          "SET photo = @1, nom = @2, prenom = @3, email = @4, telephone = @5,"
          "role = @6, matricule = @7, departement = @8, services_affectation = @9,"
          "fonction_occupe = @10, is_online = @11, created_at = @12,"
          "password_hash = @13, succursale = @14 WHERE id = @15",
          substitutionValues: {
            '1': data.photo,
            '2': data.nom,
            '3': data.prenom,
            '4': data.email,
            '5': data.telephone,
            '6': data.role,
            '7': data.matricule,
            '8': data.departement,
            '9': data.servicesAffectation,
            '10': data.fonctionOccupe,
            '11': data.isOnline,
            '12': data.createdAt,
            '13': data.passwordHash,
            '14': data.succursale,
            '15': data.id
          });
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


  Future<UserModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\"='$id'");
    return UserModel(
        id: data[0][0],
        photo: data[0][1],
        nom: data[0][2],
        prenom: data[0][3],
        email: data[0][4],
        telephone: data[0][5],
        matricule: data[0][6],
        departement: data[0][7],
        servicesAffectation: data[0][8],
        fonctionOccupe: data[0][9],
        role: data[0][10],
        isOnline: data[0][11],
        createdAt: data[0][12],
        passwordHash: data[0][13],
        succursale: data[0][14]);
  }

}  