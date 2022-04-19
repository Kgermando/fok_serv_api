import 'package:postgres/postgres.dart';

import '../../../models/comm_maketing/restitution_model.dart';

class RestitutionRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  RestitutionRepository(this.executor, this.tableName);


  Future<List<RestitutionModel>> getAllData() async {
    var data = <RestitutionModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"created\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(RestitutionModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(RestitutionModel restitutionModel) async {
    var idProduct = restitutionModel.idProduct;
    var quantity = restitutionModel.quantity;
    var unite = restitutionModel.unite;
    var created = restitutionModel.created;
    var firstName = restitutionModel.firstName;
    var lastName = restitutionModel.lastName;
    var telephone = restitutionModel.telephone;
    var succursale = restitutionModel.succursale;
    var nameBusiness = restitutionModel.nameBusiness;
    var accuseReception = restitutionModel.accuseReception;
    var accuseReceptionFirstName = restitutionModel.accuseReceptionFirstName;
    var accuseReceptionLastName = restitutionModel.accuseReceptionLastName;
    var role = restitutionModel.role;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('restitutions_id_seq'), '$idProduct',"
        "'$quantity','$unite','$created', '$firstName', '$lastName',"
        "'$telephone','$succursale', '$nameBusiness', '$accuseReception',"
        "'$accuseReceptionFirstName', '$accuseReceptionLastName', '$role');");
    });
  }

  Future<void> update(RestitutionModel restitutionModel) async {
    var id = restitutionModel.id;
    var idProduct = restitutionModel.idProduct;
    var quantity = restitutionModel.quantity;
    var unite = restitutionModel.unite;
    var created = restitutionModel.created;
    var firstName = restitutionModel.firstName;
    var lastName = restitutionModel.lastName;
    var telephone = restitutionModel.telephone;
    var succursale = restitutionModel.succursale;
    var nameBusiness = restitutionModel.nameBusiness;
    var accuseReception = restitutionModel.accuseReception;
    var accuseReceptionFirstName = restitutionModel.accuseReceptionFirstName;
    var accuseReceptionLastName = restitutionModel.accuseReceptionLastName;
    var role = restitutionModel.role;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"unite\"='$unite', \"created\"='$created',"
        "\"firstName\"='$firstName',\"lastName\"='$lastName',"
        "\"telephone\"='$telephone', \"succursale\"='$succursale', \"nameBusiness\"='$nameBusiness',"
        "\"accuseReception\"='$accuseReception', \"accuseReceptionFirstName\"='$accuseReceptionFirstName',"
        "\"accuseReceptionLastName\"='$accuseReceptionLastName',"
        "\"role\"='$role' WHERE id=$id;");
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

  Future<RestitutionModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return RestitutionModel(
      id: data[0][0],
      idProduct: data[0][1],
      quantity: data[0][2],
      unite: data[0][3],
      created: data[0][4],
      firstName: data[0][5],
      lastName: data[0][6],
      telephone: data[0][7],
      succursale: data[0][8],
      nameBusiness: data[0][9],
      accuseReception: data[0][10],
      accuseReceptionFirstName: data[0][11],
      accuseReceptionLastName: data[0][12],
      role: data[0][13]
    );
  } 
}