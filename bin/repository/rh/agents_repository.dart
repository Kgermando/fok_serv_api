import 'package:postgres/postgres.dart';

import '../../models/rh/agent_count_model.dart';
import '../../models/rh/agent_model.dart';

class AgentsRepository {
  final PostgreSQLConnection executor;
  final String tableName;

  AgentsRepository(this.executor, this.tableName);

  Future<List<AgentModel>> getAllData() async {
    var data = <AgentModel>{};
 
    var querySQL = "SELECT * FROM $tableName ORDER BY \"created_at\" DESC;";
    List<List<dynamic>> results = await executor.query(querySQL);
    for (var row in results) {
      data.add(AgentModel.fromSQL(row));
    }
    return data.toList();
  }

  Future<void> insertData(AgentModel agentModel) async {
    await executor.transaction((ctx) async {
      await ctx.execute(
          "INSERT INTO $tableName (id, nom, postnom, prenom, email, telephone,"
          "adresse, sexe, role, matricule, numero_securite_sociale, date_naissance,"
          "lieu_naissance, nationalite, type_contrat, departement, services_affectation,"
          "date_debut_contrat, date_fin_contrat, fonction_occupe, competance, experience,"
          "statut_agent, created_at, photo, salaire, signature, created)"
          "VALUES (nextval('agents_id_seq'), @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12,"
          "@13, @14, @15, @16, @17, @18, @19, @20, @21, @22, @23, @24, @25, @26, @27)",
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
            '27': agentModel.created
          });
    });
  }

  Future<void> update(AgentModel agentModel) async {
    await executor.transaction((conn) async {
      await conn.execute(
        "UPDATE $tableName"
        "SET nom = @1, postnom = @2, prenom = @3, email = @4, telephone = @5,"
        "adresse = @6, sexe = @7, role = @8, matricule = @9, numero_securite_sociale = @10,"
        "date_naissance = @11, lieu_naissance = @12, nationalite = @13, type_contrat = @14,"
        "departement = @15, services_affectation = @16, date_debut_contrat = @17,"
        "date_fin_contrat = @18, fonction_occupe = @19, competance = @20,"
        "experience = @21, statut_agent = @22, created_at = @23, photo = @24,"
        "salaire = @25, signature = @26, created = @27 WHERE id = @28",

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
