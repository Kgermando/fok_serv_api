import 'package:postgres/postgres.dart';

import '../../models/rh/agent_count_model.dart';
import '../../models/rh/agent_model.dart';

class AgentsRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgentsRepository(this.executor, this.tableName);

  Future<List<AgentModel>> getAllData() async {
    var data = <AgentModel>{};

    var querySQL = "SELECT * FROM $tableName ORDER BY \"createdAt\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AgentModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AgentModel agentModel) async {
    await executor.transaction((ctx) async {
      var idLast = await ctx.query("SELECT id FROM $tableName");
      await ctx.query(
          "INSERT INTO $tableName (id, nom, postNom, prenom, email, telephone,"
          "adresse, sexe, role, matricule, numeroSecuriteSociale, dateNaissance,"
          "lieuNaissance, nationalite, typeContrat, departement, servicesAffectation,"
          "dateDebutContrat, dateFinContrat, fonctionOccupe, competance, experience,"
          "statutAgent, createdAt, photo, salaire, signature, created)"
          "VALUES (@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13,"
          "@14, @15, @16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27, @28)",
          substitutionValues: {
            '1': idLast.last[0] + 1,
            '2': agentModel.nom,
            '3': agentModel.postNom,
            '4': agentModel.prenom,
            '5': agentModel.email,
            '6': agentModel.telephone,
            '7': agentModel.adresse,
            '8': agentModel.sexe,
            '9': agentModel.role,
            '10': agentModel.matricule,
            '11': agentModel.numeroSecuriteSociale,
            '12': agentModel.dateNaissance,
            '13': agentModel.lieuNaissance,
            '14': agentModel.nationalite,
            '15': agentModel.typeContrat,
            '16': agentModel.departement,
            '17': agentModel.servicesAffectation,
            '18': agentModel.dateDebutContrat,
            '19': agentModel.dateFinContrat,
            '20': agentModel.fonctionOccupe,
            '21': agentModel.competance,
            '22': agentModel.experience,
            '23': agentModel.statutAgent,
            '24': agentModel.createdAt,
            '25': agentModel.photo,
            '26': agentModel.salaire,
            '27': agentModel.signature,
            '28': agentModel.created
          });
      // ignore: unused_local_variable
      // var result = await ctx.execute(
      //   "INSERT INTO $tableName VALUES (nextval('agents_id_seq'), '$nom', '$postNom',"
      //   "'$prenom', '$email', '$telephone', '$adresse', '$sexe', '$role', '$matricule',"
      //   "'$numeroSecuriteSociale', '$dateNaissance', '$lieuNaissance', '$nationalite',"
      //   "'$typeContrat', '$departement', '$servicesAffectation', '$dateDebutContrat',"
      //   "'$dateFinContrat', '$fonctionOccupe', '$competance', '$experience', '$statutAgent',"
      //   "'$createdAt', '$photo', '$salaire', '$signature', '$created');"
      // );
    });
  }

  Future<void> update(AgentModel agentModel) async {
    // var id = agentModel.id;
    // var nom = agentModel.nom;
    // var postNom = agentModel.postNom;
    // var prenom = agentModel.prenom;
    // var email = agentModel.email;
    // var telephone = agentModel.telephone;
    // var adresse = agentModel.adresse;
    // var sexe = agentModel.sexe;
    // var role = agentModel.role;
    // var matricule = agentModel.matricule;
    // var numeroSecuriteSociale = agentModel.numeroSecuriteSociale;
    // var dateNaissance = agentModel.dateNaissance;
    // var lieuNaissance = agentModel.lieuNaissance;
    // var nationalite = agentModel.nationalite;
    // var typeContrat = agentModel.typeContrat;
    // var departement = agentModel.departement;
    // var servicesAffectation = agentModel.servicesAffectation;
    // var dateDebutContrat = agentModel.dateDebutContrat;
    // var dateFinContrat = agentModel.dateFinContrat;
    // var fonctionOccupe = agentModel.fonctionOccupe;
    // var competance = agentModel.competance;
    // var experience = agentModel.experience;
    // var statutAgent = agentModel.statutAgent;
    // var createdAt = agentModel.createdAt;
    // var photo = agentModel.photo;
    // var salaire = agentModel.salaire;
    // var signature = agentModel.signature;
    // var created = agentModel.created;

    // await executor.transaction((conn) async {
    //   // ignore: unused_local_variable
    //   var result = await conn.execute(
    //       "UPDATE $tableName SET \"nom\"='$nom', \"postNom\"='$postNom',"
    //       "\"prenom\"='$prenom', \"email\"='$email', \"telephone\"='$telephone',"
    //       "\"adresse\"='$adresse', \"sexe\"='$sexe', \"role\"='$role',"
    //       "\"matricule\"='$matricule', \"numeroSecuriteSociale\"='$numeroSecuriteSociale', \"dateNaissance\"='$dateNaissance',"
    //       "\"lieuNaissance\"='$lieuNaissance', \"nationalite\"='$nationalite',"
    //       "\"typeContrat\"='$typeContrat', \"departement\"='$departement',"
    //       "\"servicesAffectation\"='$servicesAffectation',"
    //       "\"dateDebutContrat\"='$dateDebutContrat',"
    //       "\"dateFinContrat\"='$dateFinContrat', \"fonctionOccupe\"='$fonctionOccupe',"
    //       "\"competance\"='$competance', \"experience\"='$experience',"
    //       "\"statutAgent\"='$statutAgent', \"createdAt\"='$createdAt',"
    //       "\"photo\"='$photo', \"salaire\"='$salaire', \"signature\"='$signature', \"created\"='$created' WHERE id=$id;");
    // });
    await executor.transaction((conn) async {
      await conn.query(
        "UPDATE $tableName"
        "SET nom = @1, postNom = @2, prenom = @3, email = @4, telephone = @5,"
        "adresse = @6, sexe = @7, role = @8, matricule = @9, numeroSecuriteSociale = @10,"
        "dateNaissance = @11, lieuNaissance = @12, nationalite = @13, typeContrat = @14, departement = @15,"
        "servicesAffectation = @16, dateDebutContrat = @17, dateFinContrat = @18, fonctionOccupe = @19,"
        "competance = @20, experience = @21, statutAgent = @22, createdAt = @23,"
        "photo = @24, salaire = @25, signature = @26, created = @27 WHERE id = @28",
        substitutionValues: {
          '1': agentModel.nom,
          '2': agentModel.postNom,
          '3': agentModel.prenom,
          '4': agentModel.email,
          '5': agentModel.telephone,
          '6': agentModel.adresse,
          '7': agentModel.sexe,
          '8': agentModel.role,
          '9': agentModel.matricule,
          '10': agentModel.numeroSecuriteSociale,
          '11': agentModel.dateNaissance,
          '12': agentModel.lieuNaissance,
          '13': agentModel.nationalite,
          '14': agentModel.typeContrat,
          '15': agentModel.departement,
          '16': agentModel.servicesAffectation,
          '17': agentModel.dateDebutContrat,
          '18': agentModel.dateFinContrat,
          '19': agentModel.fonctionOccupe,
          '20': agentModel.competance,
          '21': agentModel.experience,
          '22': agentModel.statutAgent,
          '23': agentModel.createdAt,
          '24': agentModel.photo,
          '25': agentModel.salaire,
          '26': agentModel.signature,
          '27': agentModel.created,
          '28': agentModel.id
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

  Future<AgentModel> getFromId(int id) async {
    var data =
        await executor.query("SELECT * FROM  $tableName WHERE \"id\" = '$id'");
    return AgentModel(
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
        numeroSecuriteSociale: data[0][10],
        dateNaissance: data[0][11],
        lieuNaissance: data[0][12],
        nationalite: data[0][13],
        typeContrat: data[0][14],
        departement: data[0][15],
        servicesAffectation: data[0][16],
        dateDebutContrat: data[0][17],
        dateFinContrat: data[0][18],
        fonctionOccupe: data[0][19],
        competance: data[0][20],
        experience: data[0][21],
        statutAgent: data[0][22],
        createdAt: data[0][23],
        photo: data[0][24],
        salaire: data[0][25],
        signature: data[0][26],
        created: data[0][27]);
  }

  Future<AgentCountModel> getCount() async {
    try {
      var data = <AgentCountModel>{};
      var querySQL = "SELECT COUNT(*) FROM $tableName;";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(AgentCountModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw AgentCountModel;
    }
  }

  Future<List<AgentPieChartModel>> getAgentChartPie() async {
    try {
      var data = <AgentPieChartModel>{};

      var querySQL =
          "SELECT sexe, COUNT(sexe) FROM $tableName GROUP BY \"sexe\";";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(AgentPieChartModel.fromSQL(row));
      }
      return data.toList();
    } catch (e) {
      throw AgentPieChartModel;
    }
  }
}
