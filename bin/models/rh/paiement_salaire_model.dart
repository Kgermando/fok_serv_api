class PaiementSalaireModel {
  late int? id;
  late String nom;
  late String postNom;
  late String prenom;
  late String email;
  late String telephone;
  late String adresse;
  late String departement;
  late String numeroSecuriteSociale;
  late String matricule;
  late String servicesAffectation;
  late String salaire;
  late String observation; // Payé ou non Payé  // pour Finance
  late String modePaiement; // mode depayement
  late DateTime createdAt; 
  late String tauxJourHeureMoisSalaire;
  late String joursHeuresPayeA100PourecentSalaire;
  late String totalDuSalaire;
  late String nombreHeureSupplementaires;
  late String tauxHeureSupplementaires;
  late String totalDuHeureSupplementaires;
  late String supplementTravailSamediDimancheJoursFerie;
  late String prime;
  late String divers;
  late String joursCongesPaye;
  late String tauxCongesPaye;
  late String totalDuCongePaye;
  late String jourPayeMaladieAccident;
  late String tauxJournalierMaladieAccident;
  late String totalDuMaladieAccident;
  late String pensionDeduction;
  late String indemniteCompensatricesDeduction;
  late String avancesDeduction;
  late String diversDeduction;
  late String retenuesFiscalesDeduction;
  late String nombreEnfantBeneficaireAllocationsFamiliales;
  late String nombreDeJoursAllocationsFamiliales;
  late String tauxJoursAllocationsFamiliales;
  late String totalAPayerAllocationsFamiliales;
  late String netAPayer;
  late String montantPrisConsiderationCalculCotisationsINSS;
  late String totalDuBrut;
  late String signature; // celui qui fait ce document
  
  // Approbations DG
  late String approbationDG;
  late String motifDG;
  late String signatureDG;
  // Approbations Budget
  late String approbationBudget;
  late String motifBudget;
  late String signatureBudget;
  // Approbations Finance
  late String approbationFin;
  late String motifFin;
  late String signatureFin;
  // Approbations DD
  late String approbationDD;
  late String motifDD;
  late String signatureDD;

  // Ligne budgetaire pour reduction des montants
  late String ligneBudgetaire;
  late String ressource;


  PaiementSalaireModel({
    this.id,
    required this.nom,
    required this.postNom,
    required this.prenom,
    required this.email,
    required this.telephone,
    required this.adresse,
    required this.departement,
    required this.numeroSecuriteSociale,
    required this.matricule,
    required this.servicesAffectation,
    required this.salaire,
    required this.observation,
    required this.modePaiement,
    required this.createdAt, 
    required this.tauxJourHeureMoisSalaire,
    required this.joursHeuresPayeA100PourecentSalaire,
    required this.totalDuSalaire,
    required this.nombreHeureSupplementaires,
    required this.tauxHeureSupplementaires,
    required this.totalDuHeureSupplementaires,
    required this.supplementTravailSamediDimancheJoursFerie,
    required this.prime,
    required this.divers,
    required this.joursCongesPaye,
    required this.tauxCongesPaye,
    required this.totalDuCongePaye,
    required this.jourPayeMaladieAccident,
    required this.tauxJournalierMaladieAccident,
    required this.totalDuMaladieAccident,
    required this.pensionDeduction,
    required this.indemniteCompensatricesDeduction,
    required this.avancesDeduction,
    required this.diversDeduction,
    required this.retenuesFiscalesDeduction,
    required this.nombreEnfantBeneficaireAllocationsFamiliales,
    required this.nombreDeJoursAllocationsFamiliales,
    required this.tauxJoursAllocationsFamiliales,
    required this.totalAPayerAllocationsFamiliales,
    required this.netAPayer,
    required this.montantPrisConsiderationCalculCotisationsINSS,
    required this.totalDuBrut,
    required this.signature,

    required this.approbationDG,
    required this.motifDG,
    required this.signatureDG,
    required this.approbationBudget,
    required this.motifBudget,
    required this.signatureBudget,
    required this.approbationFin,
    required this.motifFin,
    required this.signatureFin,
    required this.approbationDD,
    required this.motifDD,
    required this.signatureDD,
      required this.ligneBudgetaire,
      required this.ressource

  });

  factory PaiementSalaireModel.fromSQL(List<dynamic> row) {
    return PaiementSalaireModel(
        id: row[0],
        nom: row[1],
        postNom: row[2],
        prenom: row[3],
        email: row[4],
        telephone: row[5],
        adresse: row[6],
        departement: row[7],
        numeroSecuriteSociale: row[8],
        matricule: row[9],
        servicesAffectation: row[10],
        salaire: row[11],
        observation: row[12],
        modePaiement: row[13],
        createdAt: row[14], 
        tauxJourHeureMoisSalaire: row[15],
        joursHeuresPayeA100PourecentSalaire: row[16],
        totalDuSalaire: row[17],
        nombreHeureSupplementaires: row[18],
        tauxHeureSupplementaires: row[19],
        totalDuHeureSupplementaires: row[20],
        supplementTravailSamediDimancheJoursFerie: row[21],
        prime: row[22],
        divers: row[23],
        joursCongesPaye: row[24],
        tauxCongesPaye: row[25],
        totalDuCongePaye: row[26],
        jourPayeMaladieAccident: row[27],
        tauxJournalierMaladieAccident: row[28],
        totalDuMaladieAccident: row[29],
        pensionDeduction: row[30],
        indemniteCompensatricesDeduction: row[31],
        avancesDeduction: row[32],
        diversDeduction: row[33],
        retenuesFiscalesDeduction: row[34],
        nombreEnfantBeneficaireAllocationsFamiliales: row[35],
        nombreDeJoursAllocationsFamiliales: row[36],
        tauxJoursAllocationsFamiliales: row[37],
        totalAPayerAllocationsFamiliales: row[38],
        netAPayer: row[39],
        montantPrisConsiderationCalculCotisationsINSS: row[40],
        totalDuBrut: row[41],
        signature: row[42],
        
        approbationDG: row[43],
        motifDG: row[44],
        signatureDG: row[45],

        approbationBudget: row[46],
        motifBudget: row[47],
        signatureBudget: row[48],

        approbationFin: row[49],
        motifFin: row[50],
        signatureFin: row[51],

        approbationDD: row[52],
        motifDD: row[53],
        signatureDD: row[54],
        ligneBudgetaire: row[55],
        ressource: row[56]
    );
  }

  factory PaiementSalaireModel.fromJson(Map<String, dynamic> json) {
    return PaiementSalaireModel(
        id: json['id'],
        nom: json['nom'],
        postNom: json['postNom'],
        prenom: json['prenom'],
        email: json['email'],
        telephone: json['telephone'],
        adresse: json['adresse'],
        departement: json['departement'],
        numeroSecuriteSociale: json['numeroSecuriteSociale'],
        matricule: json['matricule'],
        servicesAffectation: json['servicesAffectation'],
        salaire: json['salaire'],
        observation: json['observation'],
        modePaiement: json['modePaiement'],
        createdAt: DateTime.parse(json['createdAt']),
        tauxJourHeureMoisSalaire: json['tauxJourHeureMoisSalaire'],
        joursHeuresPayeA100PourecentSalaire: json['joursHeuresPayeA100PourecentSalaire'],
        totalDuSalaire: json['totalDuSalaire'],
        nombreHeureSupplementaires: json['nombreHeureSupplementaires'],
        tauxHeureSupplementaires: json['tauxHeureSupplementaires'],
        totalDuHeureSupplementaires: json['totalDuHeureSupplementaires'],
        supplementTravailSamediDimancheJoursFerie:
            json['supplementTravailSamediDimancheJoursFerie'],
        prime: json['prime'],
        divers: json['divers'],
        joursCongesPaye: json['joursCongesPaye'],
        tauxCongesPaye: json['tauxCongesPaye'],
        totalDuCongePaye: json['totalDuCongePaye'],
        jourPayeMaladieAccident: json['jourPayeMaladieAccident'],
        tauxJournalierMaladieAccident: json['tauxJournalierMaladieAccident'],
        totalDuMaladieAccident: json['totalDuMaladieAccident'],
        pensionDeduction: json['pensionDeduction'],
        indemniteCompensatricesDeduction:
            json['indemniteCompensatricesDeduction'],
        avancesDeduction: json['avancesDeduction'],
        diversDeduction: json['diversDeduction'],
        retenuesFiscalesDeduction: json['retenuesFiscalesDeduction'],
        nombreEnfantBeneficaireAllocationsFamiliales:
            json['nombreEnfantBeneficaireAllocationsFamiliales'],
        nombreDeJoursAllocationsFamiliales:
            json['nombreDeJoursAllocationsFamiliales'],
        tauxJoursAllocationsFamiliales: json['tauxJoursAllocationsFamiliales'],
        totalAPayerAllocationsFamiliales:
            json['totalAPayerAllocationsFamiliales'],
        netAPayer: json['netAPayer'],
        montantPrisConsiderationCalculCotisationsINSS:
            json['montantPrisConsiderationCalculCotisationsINSS'],
        totalDuBrut: json['totalDuBrut'],
        signature: json['signature'],

        approbationDG: json['approbationDG'],
        motifDG: json['motifDG'],
        signatureDG: json['signatureDG'],
        approbationBudget: json['approbationBudget'],
        motifBudget: json['motifBudget'],
        signatureBudget: json['signatureBudget'],
        approbationFin: json['approbationFin'],
        motifFin: json['motifFin'],
        signatureFin: json['signatureFin'],
        approbationDD: json['approbationDD'],
        motifDD: json['motifDD'],
        signatureDD: json['signatureDD'],
        ligneBudgetaire: json['ligneBudgetaire'],
        ressource: json['ressource']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'postNom': postNom,
      'prenom': prenom,
      'email': email,
      'telephone': telephone,
      'adresse': adresse,
      'departement': departement,
      'numeroSecuriteSociale': numeroSecuriteSociale,
      'matricule': matricule,
      'servicesAffectation': servicesAffectation,
      'salaire': salaire,
      'observation': observation.toString(),
      'modePaiement': modePaiement,
      'createdAt': createdAt.toIso8601String(),
      'tauxJourHeureMoisSalaire': tauxJourHeureMoisSalaire,
      'joursHeuresPayeA100PourecentSalaire':
          joursHeuresPayeA100PourecentSalaire,
      'totalDuSalaire': totalDuSalaire,
      'nombreHeureSupplementaires': nombreHeureSupplementaires,
      'tauxHeureSupplementaires': tauxHeureSupplementaires,
      'totalDuHeureSupplementaires': totalDuHeureSupplementaires,
      'supplementTravailSamediDimancheJoursFerie':
          supplementTravailSamediDimancheJoursFerie,
      'prime': prime,
      'divers': divers,
      'joursCongesPaye': joursCongesPaye,
      'tauxCongesPaye': tauxCongesPaye,
      'totalDuCongePaye': totalDuCongePaye,
      'jourPayeMaladieAccident': jourPayeMaladieAccident,
      'tauxJournalierMaladieAccident': tauxJournalierMaladieAccident,
      'totalDuMaladieAccident': totalDuMaladieAccident,
      'pensionDeduction': pensionDeduction,
      'indemniteCompensatricesDeduction': indemniteCompensatricesDeduction,
      'avancesDeduction': avancesDeduction,
      'diversDeduction': diversDeduction,
      'retenuesFiscalesDeduction': retenuesFiscalesDeduction,
      'nombreEnfantBeneficaireAllocationsFamiliales':
          nombreEnfantBeneficaireAllocationsFamiliales,
      'nombreDeJoursAllocationsFamiliales': nombreDeJoursAllocationsFamiliales,
      'tauxJoursAllocationsFamiliales': tauxJoursAllocationsFamiliales,
      'totalAPayerAllocationsFamiliales': totalAPayerAllocationsFamiliales,
      'netAPayer': netAPayer,
      'montantPrisConsiderationCalculCotisationsINSS':
          montantPrisConsiderationCalculCotisationsINSS,
      'totalDuBrut': totalDuBrut,
      'signature': signature,
      'approbationDG': approbationDG,
      'motifDG': motifDG,
      'signatureDG': signatureDG,
      'approbationBudget': approbationBudget,
      'motifBudget': motifBudget,
      'signatureBudget': signatureBudget,
      'approbationFin': approbationFin,
      'motifFin': motifFin,
      'signatureFin': signatureFin,
      'approbationDD': approbationDD,
      'motifDD': motifDD,
      'signatureDD': signatureDD,
      'ligneBudgetaire': ligneBudgetaire,
      'ressource': ressource
    };
  }
}
