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
    var firstName = restitutionModel.firstName;
    var lastName = restitutionModel.lastName;
    var accuseReception = restitutionModel.accuseReception;
    var accuseReceptionFirstName = restitutionModel.accuseReceptionFirstName;
    var accuseReceptionLastName = restitutionModel.accuseReceptionLastName;
    var role = restitutionModel.role;
    var approbationDG = restitutionModel.approbationDG;
    var signatureDG = restitutionModel.signatureDG;
    var signatureJustificationDG =
        restitutionModel.signatureJustificationDG;

    var approbationFin = restitutionModel.approbationFin;
    var signatureFin = restitutionModel.signatureFin;
    var signatureJustificationFin =
        restitutionModel.signatureJustificationFin;

    var approbationBudget = restitutionModel.approbationBudget;
    var signatureBudget = restitutionModel.signatureBudget;
    var signatureJustificationBudget =
        restitutionModel.signatureJustificationBudget;

    var approbationDD = restitutionModel.approbationDD;
    var signatureDD = restitutionModel.signatureDD;
    var signatureJustificationDD =
        restitutionModel.signatureJustificationDD;
    var succursale = restitutionModel.succursale;
    var signature = restitutionModel.signature;
    var created = restitutionModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        "INSERT INTO $tableName VALUES (nextval('restitutions_id_seq'), '$idProduct',"
        "'$quantity','$unite','$created', '$firstName', '$lastName',"
        "'$accuseReception', '$accuseReceptionFirstName', '$accuseReceptionLastName', '$role'"
        "'$approbationDG', '$signatureDG', '$signatureJustificationDG', '$approbationFin',"
        "'$signatureFin', '$signatureJustificationFin', '$approbationBudget',"
        "'$signatureBudget', '$signatureJustificationBudget', '$approbationDD',"
        "'$signatureDD', '$signatureJustificationDD', '$succursale',"
        "'$signature','$created');");
    });
  }

  Future<void> update(RestitutionModel restitutionModel) async {
    var id = restitutionModel.id;
    var idProduct = restitutionModel.idProduct;
    var quantity = restitutionModel.quantity;
    var unite = restitutionModel.unite;
    var firstName = restitutionModel.firstName;
    var lastName = restitutionModel.lastName;
    var accuseReception = restitutionModel.accuseReception;
    var accuseReceptionFirstName = restitutionModel.accuseReceptionFirstName;
    var accuseReceptionLastName = restitutionModel.accuseReceptionLastName;
    var role = restitutionModel.role;
    var approbationDG = restitutionModel.approbationDG;
    var signatureDG = restitutionModel.signatureDG;
    var signatureJustificationDG = restitutionModel.signatureJustificationDG;

    var approbationFin = restitutionModel.approbationFin;
    var signatureFin = restitutionModel.signatureFin;
    var signatureJustificationFin = restitutionModel.signatureJustificationFin;

    var approbationBudget = restitutionModel.approbationBudget;
    var signatureBudget = restitutionModel.signatureBudget;
    var signatureJustificationBudget =
        restitutionModel.signatureJustificationBudget;

    var approbationDD = restitutionModel.approbationDD;
    var signatureDD = restitutionModel.signatureDD;
    var signatureJustificationDD = restitutionModel.signatureJustificationDD;
    var succursale = restitutionModel.succursale;
    var signature = restitutionModel.signature;
    var created = restitutionModel.created;


    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        "UPDATE $tableName SET \"idProduct\"='$idProduct', \"quantity\"='$quantity',"
        "\"unite\"='$unite', \"created\"='$created',"
        "\"firstName\"='$firstName',\"lastName\"='$lastName',"
        "\"accuseReception\"='$accuseReception', \"accuseReceptionFirstName\"='$accuseReceptionFirstName',"
        "\"accuseReceptionLastName\"='$accuseReceptionLastName', \"role\"='$role',"
        "\"approbationDG\"='$approbationDG', \"signatureDG\"='$signatureDG',"
        "\"signatureJustificationDG\"='$signatureJustificationDG',"
        "\"approbationFin\"='$approbationFin', \"signatureFin\"='$signatureFin',"
        "\"signatureJustificationFin\"='$signatureJustificationFin',"
        "\"approbationBudget\"='$approbationBudget', \"signatureBudget\"='$signatureBudget',"
        "\"signatureJustificationBudget\"='$signatureJustificationBudget',"
        "\"approbationDD\"='$approbationDD', \"signatureDD\"='$signatureDD',"
        "\"signatureJustificationDD\"='$signatureJustificationDD', \"succursale\"='$succursale'"
        "\"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
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
      firstName: data[0][4],
      lastName: data[0][5],
      accuseReception: data[0][6],
      accuseReceptionFirstName: data[0][7],
      accuseReceptionLastName: data[0][8],
      role: data[0][9],
      approbationDG: data[0][10],
      signatureDG: data[0][11],
      signatureJustificationDG: data[0][12],
      approbationFin: data[0][13],
      signatureFin: data[0][14],
      signatureJustificationFin: data[0][15],
      approbationBudget: data[0][16],
      signatureBudget: data[0][17],
      signatureJustificationBudget: data[0][18],
      approbationDD: data[0][19],
      signatureDD: data[0][20],
      signatureJustificationDD: data[0][21],
      succursale: data[0][22],
      signature: data[0][23],
      created: data[0][24]
    );
  } 
}