
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
    
    var nom = agentModel.nom;
    var postNom = agentModel.postNom;
    var prenom = agentModel.prenom;
    var email = agentModel.email;
    var telephone = agentModel.telephone;
    var adresse = agentModel.adresse;
    var sexe = agentModel.sexe;
    var role = agentModel.role;
    var matricule = agentModel.matricule;
    var numeroSecuriteSociale = agentModel.numeroSecuriteSociale; 
    var dateNaissance = agentModel.dateNaissance;
    var lieuNaissance = agentModel.lieuNaissance;
    var nationalite = agentModel.nationalite;
    var typeContrat = agentModel.typeContrat;
    var departement = agentModel.departement;
    var servicesAffectation = agentModel.servicesAffectation;
    var dateDebutContrat = agentModel.dateDebutContrat;
    var dateFinContrat = agentModel.dateFinContrat;
    var fonctionOccupe = agentModel.fonctionOccupe;
    var competance = agentModel.competance;
    var experience = agentModel.experience;
    var statutAgent = agentModel.statutAgent;
    var createdAt = agentModel.createdAt;
    var photo = agentModel.photo;
    var salaire = agentModel.salaire;
    var signature = agentModel.signature;
    var created = agentModel.created;

    await executor.transaction((ctx) async {
      // ignore: unused_local_variable
      var result = await ctx.execute(
        """INSERT INTO $tableName VALUES (nextval('agents_id_seq'), "$nom",
        "$postNom", "$prenom", "$email", "$telephone", "$adresse", "$sexe",
        "$role", "$matricule", "$numeroSecuriteSociale", "$dateNaissance", "$lieuNaissance",
        "$nationalite", '$typeContrat", "$departement",'"$servicesAffectation",
        "$dateDebutContrat", "$dateFinContrat","$fonctionOccupe",
        "$competance", "$experience", "$statutAgent",
        "$createdAt", "$photo", "$salaire", "$signature", "$created");""");
    });
  }


  Future<void> update(AgentModel agentModel) async {
    var id = agentModel.id;
    var nom = agentModel.nom;
    var postNom = agentModel.postNom;
    var prenom = agentModel.prenom;
    var email = agentModel.email;
    var telephone = agentModel.telephone;
    var adresse = agentModel.adresse;
    var sexe = agentModel.sexe;
    var role = agentModel.role;
    var matricule = agentModel.matricule;
    var numeroSecuriteSociale = agentModel.numeroSecuriteSociale; 
    var dateNaissance = agentModel.dateNaissance;
    var lieuNaissance = agentModel.lieuNaissance;
    var nationalite = agentModel.nationalite;
    var typeContrat = agentModel.typeContrat;
    var departement = agentModel.departement;
    var servicesAffectation = agentModel.servicesAffectation;
    var dateDebutContrat = agentModel.dateDebutContrat;
    var dateFinContrat = agentModel.dateFinContrat;
    var fonctionOccupe = agentModel.fonctionOccupe;
    var competance = agentModel.competance;
    var experience = agentModel.experience;
    var statutAgent = agentModel.statutAgent;
    var createdAt = agentModel.createdAt;
    var photo = agentModel.photo;
    var salaire = agentModel.salaire;
    var signature = agentModel.signature;
    var created = agentModel.created;

    await executor.transaction((conn) async {
      // ignore: unused_local_variable
      var result = await conn.execute(
        """UPDATE $tableName SET "nom"="$nom", "postNom"="$postNom",
        "prenom"="$prenom", "email"="$email", "telephone"="$telephone",
        "adresse"="$adresse", "sexe"="$sexe", "role"="$role",
        "matricule"="$matricule", "numeroSecuriteSociale"="$numeroSecuriteSociale", "dateNaissance"="$dateNaissance",
        "lieuNaissance"="$lieuNaissance", "nationalite"="$nationalite",
        "typeContrat"="$typeContrat", "departement"="$departement",
        "servicesAffectation"="$servicesAffectation",
        "dateDebutContrat"="$dateDebutContrat",
        "dateFinContrat"="$dateFinContrat", "fonctionOccupe"="$fonctionOccupe",
        "competance"="$competance", "experience"="$experience",
        "statutAgent"="$statutAgent", "createdAt"="$createdAt",
        "photo"="$photo", "salaire"="$salaire", "signature"="$signature", "created"="$created" WHERE id=$id;""");
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
      created: data[0][27]
    );
  }


  Future<AgentCountModel> getCount() async {
    try {
      var data = <AgentCountModel>{};
      var querySQL =  "SELECT COUNT(*) FROM $tableName;";
      List<List<dynamic>> results = await executor.query(querySQL);
      for (var row in results) {
        data.add(AgentCountModel.fromSQL(row));
      }
      return data.single;
    } catch (e) {
      throw AgentCountModel;
    }
  }
 

  Future<List<AgentPieChartModel>>getAgentChartPie() async {
    try { 
      var data = <AgentPieChartModel>{};
      
      var querySQL =  "SELECT sexe, COUNT(sexe) FROM $tableName GROUP BY \"sexe\";";
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