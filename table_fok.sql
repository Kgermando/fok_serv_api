-- Adminer 4.8.1 PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) dump

DROP TABLE IF EXISTS "achats";
DROP SEQUENCE IF EXISTS achats_id_seq;
CREATE SEQUENCE achats_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."achats" (
    "id" integer DEFAULT nextval('achats_id_seq') NOT NULL,
    "idProduct" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qtyRemise" character varying NOT NULL,
    "qtyLivre" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "agendas";
DROP SEQUENCE IF EXISTS agendas_id_seq;
CREATE SEQUENCE agendas_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."agendas" (
    "id" integer DEFAULT nextval('agendas_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "description" character varying NOT NULL,
    "dateRappel" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "agents";
DROP SEQUENCE IF EXISTS agents_id_seq;
CREATE SEQUENCE agents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."agents" (
    "id" integer DEFAULT nextval('agents_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "postNom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "sexe" character varying NOT NULL,
    "role" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "numeroSecuriteSociale" character varying NOT NULL,
    "dateNaissance" timestamp NOT NULL,
    "lieuNaissance" character varying NOT NULL,
    "nationalite" character varying NOT NULL,
    "typeContrat" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "servicesAffectation" character varying NOT NULL,
    "dateDebutContrat" timestamp NOT NULL,
    "dateFinContrat" timestamp NOT NULL,
    "fonctionOccupe" character varying NOT NULL,
    "competance" character varying NOT NULL,
    "experience" character varying NOT NULL,
    "statutAgent" boolean NOT NULL,
    "createdAt" timestamp NOT NULL,
    "photo" character varying NOT NULL,
    "salaire" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "anguins";
DROP SEQUENCE IF EXISTS anguins_id_seq;
CREATE SEQUENCE anguins_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."anguins" (
    "id" integer DEFAULT nextval('anguins_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "numeroChassie" character varying NOT NULL,
    "couleur" character varying NOT NULL,
    "genre" character varying NOT NULL,
    "qtyMaxReservoir" character varying NOT NULL,
    "dateFabrication" timestamp NOT NULL,
    "nomeroPLaque" character varying NOT NULL,
    "nomeroEntreprise" character varying NOT NULL,
    "kilometrageInitiale" character varying NOT NULL,
    "provenance" character varying NOT NULL,
    "typeCaburant" character varying NOT NULL,
    "typeMoteur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "annuaires";
DROP SEQUENCE IF EXISTS annuaires_id_seq;
CREATE SEQUENCE annuaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."annuaires" (
    "id" integer DEFAULT nextval('annuaires_id_seq') NOT NULL,
    "categorie" character varying NOT NULL,
    "nomPostnomPrenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "mobile1" character varying NOT NULL,
    "mobile2" character varying NOT NULL,
    "secteurActivite" character varying NOT NULL,
    "nomEntreprise" character varying NOT NULL,
    "grade" character varying NOT NULL,
    "adresseEntreprise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "approbations";
DROP SEQUENCE IF EXISTS approbations_id_seq;
CREATE SEQUENCE approbations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."approbations" (
    "id" integer DEFAULT nextval('approbations_id_seq') NOT NULL,
    "reference" integer NOT NULL,
    "title" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "fontctionOccupee" character varying NOT NULL,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "approbation" character varying NOT NULL,
    "justification" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "approbations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "archives";
DROP SEQUENCE IF EXISTS archives_id_seq;
CREATE SEQUENCE archives_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."archives" (
    "id" integer DEFAULT nextval('archives_id_seq') NOT NULL,
    "nomDocument" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "description" character varying NOT NULL,
    "fichier" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "balance_comptes";
DROP SEQUENCE IF EXISTS balance_comptes_id_seq;
CREATE SEQUENCE balance_comptes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."balance_comptes" (
    "id" integer DEFAULT nextval('balance_comptes_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "comptes" json,
    "statut" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "banques";
DROP SEQUENCE IF EXISTS banques_id_seq;
CREATE SEQUENCE banques_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."banques" (
    "id" integer DEFAULT nextval('banques_id_seq') NOT NULL,
    "nomComplet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "coupureBillet" json,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "typeOperation" character varying NOT NULL,
    "numeroOperation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "bilans";
DROP SEQUENCE IF EXISTS bilans_id_seq;
CREATE SEQUENCE bilans_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bilans" (
    "id" integer DEFAULT nextval('bilans_id_seq') NOT NULL,
    "titleBilan" character varying NOT NULL,
    "comptesActif" json,
    "comptesPactif" json,
    "statut" boolean NOT NULL,
    "approbationDG" character varying NOT NULL,
    "signatureDG" character varying NOT NULL,
    "signatureJustificationDG" character varying NOT NULL,
    "approbationDD" character varying NOT NULL,
    "signatureDD" character varying NOT NULL,
    "signatureJustificationDD" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "bon_livraisons";
DROP SEQUENCE IF EXISTS bon_livraisons_id_seq;
CREATE SEQUENCE bon_livraisons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bon_livraisons" (
    "id" integer DEFAULT nextval('bon_livraisons_id_seq') NOT NULL,
    "idProduct" character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qtyRemise" character varying NOT NULL,
    "accuseReception" boolean NOT NULL,
    "accuseReceptionFirstName" character varying NOT NULL,
    "accuseReceptionLastName" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "caisses";
DROP SEQUENCE IF EXISTS caisses_id_seq;
CREATE SEQUENCE caisses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."caisses" (
    "id" integer DEFAULT nextval('caisses_id_seq') NOT NULL,
    "nomComplet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "coupureBillet" json,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "typeOperation" character varying NOT NULL,
    "numeroOperation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "campaigns";
DROP SEQUENCE IF EXISTS campaigns_id_seq;
CREATE SEQUENCE campaigns_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."campaigns" (
    "id" integer DEFAULT nextval('campaigns_id_seq') NOT NULL,
    "typeProduit" character varying NOT NULL,
    "dateDebutEtFin" character varying NOT NULL,
    "agentAffectes" json,
    "coutCampaign" character varying NOT NULL,
    "lieuCible" character varying NOT NULL,
    "promotion" character varying NOT NULL,
    "objetctifs" character varying NOT NULL,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "observation" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "carburants";
DROP SEQUENCE IF EXISTS carburants_id_seq;
CREATE SEQUENCE carburants_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."carburants" (
    "id" integer DEFAULT nextval('carburants_id_seq') NOT NULL,
    "operationEntreSortie" character varying NOT NULL,
    "typeCaburant" character varying NOT NULL,
    "fournisseur" character varying NOT NULL,
    "nomeroFactureAchat" character varying NOT NULL,
    "prixAchatParLitre" character varying NOT NULL,
    "nomReceptioniste" character varying NOT NULL,
    "numeroPlaque" character varying NOT NULL,
    "dateHeureSortieAnguin" timestamp NOT NULL,
    "qtyAchat" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "carts";
DROP SEQUENCE IF EXISTS carts_id_seq;
CREATE SEQUENCE carts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."carts" (
    "id" integer DEFAULT nextval('carts_id_seq') NOT NULL,
    "idProductCart" character varying NOT NULL,
    "quantityCart" character varying NOT NULL,
    "priceCart" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qtyRemise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "comptes_resultat";
DROP SEQUENCE IF EXISTS comptes_resultat_id_seq;
CREATE SEQUENCE comptes_resultat_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."comptes_resultat" (
    "id" integer DEFAULT nextval('comptes_resultat_id_seq') NOT NULL,
    "intitule" character varying NOT NULL,
    "achatMarchandises" character varying NOT NULL,
    "variationStockMarchandises" character varying NOT NULL,
    "achatApprovionnements" character varying NOT NULL,
    "variationApprovionnements" character varying NOT NULL,
    "autresChargesExterne" character varying NOT NULL,
    "impotsTaxesVersementsAssimiles" character varying NOT NULL,
    "renumerationPersonnel" character varying NOT NULL,
    "chargesSocialas" character varying NOT NULL,
    "dotatiopnsProvisions" character varying NOT NULL,
    "autresCharges" character varying NOT NULL,
    "chargesfinancieres" character varying NOT NULL,
    "chargesExptionnelles" character varying NOT NULL,
    "importSurbenefices" character varying NOT NULL,
    "soldeCrediteur" character varying NOT NULL,
    "ventesMarchandises" character varying NOT NULL,
    "productionVendueBienEtSerices" character varying NOT NULL,
    "productionStockee" character varying NOT NULL,
    "productionImmobilisee" character varying NOT NULL,
    "subventionExploitation" character varying NOT NULL,
    "autreProduits" character varying NOT NULL,
    "montantExportation" character varying NOT NULL,
    "produitfinancieres" character varying NOT NULL,
    "produitExceptionnels" character varying NOT NULL,
    "soldeDebiteur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "creance_dettes";
DROP SEQUENCE IF EXISTS creance_dettes_id_seq;
CREATE SEQUENCE creance_dettes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creance_dettes" (
    "id" integer DEFAULT nextval('creance_dettes_id_seq') NOT NULL,
    "nomComplet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "creanceDette" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "creance_factures";
DROP SEQUENCE IF EXISTS creance_factures_id_seq;
CREATE SEQUENCE creance_factures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creance_factures" (
    "id" integer DEFAULT nextval('creance_factures_id_seq') NOT NULL,
    "cart" json,
    "client" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "creances";
DROP SEQUENCE IF EXISTS creances_id_seq;
CREATE SEQUENCE creances_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creances" (
    "id" integer DEFAULT nextval('creances_id_seq') NOT NULL,
    "nomComplet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "numeroOperation" character varying NOT NULL,
    "statutPaie" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "departement_budgets";
DROP SEQUENCE IF EXISTS departement_budgets_id_seq;
CREATE SEQUENCE departement_budgets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."departement_budgets" (
    "id" integer DEFAULT nextval('departement_budgets_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "periodeDebut" timestamp NOT NULL,
    "periodeFin" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "dettes";
DROP SEQUENCE IF EXISTS dettes_id_seq;
CREATE SEQUENCE dettes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."dettes" (
    "id" integer DEFAULT nextval('dettes_id_seq') NOT NULL,
    "nomComplet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "numeroOperation" character varying NOT NULL,
    "statutPaie" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "devis";
DROP SEQUENCE IF EXISTS devis_id_seq;
CREATE SEQUENCE devis_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."devis" (
    "id" integer DEFAULT nextval('devis_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "priority" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "list" json,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "observation" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "entretiens";
DROP SEQUENCE IF EXISTS entretiens_id_seq;
CREATE SEQUENCE entretiens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."entretiens" (
    "id" integer DEFAULT nextval('entretiens_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "etatObjet" character varying NOT NULL,
    "objetRemplace" json,
    "dureeTravaux" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "etat_materiels";
DROP SEQUENCE IF EXISTS etat_materiels_id_seq;
CREATE SEQUENCE etat_materiels_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."etat_materiels" (
    "id" integer DEFAULT nextval('etat_materiels_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "typeObjet" character varying NOT NULL,
    "statut" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "factures";
DROP SEQUENCE IF EXISTS factures_id_seq;
CREATE SEQUENCE factures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."factures" (
    "id" integer DEFAULT nextval('factures_id_seq') NOT NULL,
    "cart" json,
    "client" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "fin_exterieurs";
DROP SEQUENCE IF EXISTS fin_exterieurs_id_seq;
CREATE SEQUENCE fin_exterieurs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."fin_exterieurs" (
    "id" integer DEFAULT nextval('fin_exterieurs_id_seq') NOT NULL,
    "nomComplet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "coupureBillet" json,
    "ligneBudgtaire" character varying NOT NULL,
    "typeOperation" character varying NOT NULL,
    "numeroOperation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "gains";
DROP SEQUENCE IF EXISTS gains_id_seq;
CREATE SEQUENCE gains_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."gains" (
    "id" integer DEFAULT nextval('gains_id_seq') NOT NULL,
    "sum" real NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "history_livraisons";
DROP SEQUENCE IF EXISTS history_livraisons_id_seq;
CREATE SEQUENCE history_livraisons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."history_livraisons" (
    "id" integer DEFAULT nextval('history_livraisons_id_seq') NOT NULL,
    "idProduct" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "margeBen" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qtyRemise" character varying NOT NULL,
    "margeBenRemise" character varying NOT NULL,
    "qtyLivre" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "history_ravitaillements";
DROP SEQUENCE IF EXISTS history_ravitaillements_id_seq;
CREATE SEQUENCE history_ravitaillements_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."history_ravitaillements" (
    "id" integer DEFAULT nextval('history_ravitaillements_id_seq') NOT NULL,
    "idProduct" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "margeBen" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "qtyRavitailler" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "immobiliers";
DROP SEQUENCE IF EXISTS immobiliers_id_seq;
CREATE SEQUENCE immobiliers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."immobiliers" (
    "id" integer DEFAULT nextval('immobiliers_id_seq') NOT NULL,
    "typeAllocation" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "numeroCertificat" character varying NOT NULL,
    "superficie" character varying NOT NULL,
    "dateAcquisition" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "journals";
DROP SEQUENCE IF EXISTS journals_id_seq;
CREATE SEQUENCE journals_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."journals" (
    "id" integer DEFAULT nextval('journals_id_seq') NOT NULL,
    "numeroOperation" character varying NOT NULL,
    "libele" character varying NOT NULL,
    "compteDebit" character varying NOT NULL,
    "montantDebit" character varying NOT NULL,
    "compteCredit" character varying NOT NULL,
    "montantCredit" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remarque" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "ligne_budgetaires";
DROP SEQUENCE IF EXISTS ligne_budgetaires_id_seq;
CREATE SEQUENCE ligne_budgetaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ligne_budgetaires" (
    "id" integer DEFAULT nextval('ligne_budgetaires_id_seq') NOT NULL,
    "nomLigneBudgetaire" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "periodeBudget" character varying NOT NULL,
    "uniteChoisie" character varying NOT NULL,
    "nombreUnite" character varying NOT NULL,
    "coutUnitaire" character varying NOT NULL,
    "coutTotal" character varying NOT NULL,
    "caisse" character varying NOT NULL,
    "banque" character varying NOT NULL,
    "finPropre" character varying NOT NULL,
    "finExterieur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "mails";
DROP SEQUENCE IF EXISTS mails_id_seq;
CREATE SEQUENCE mails_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."mails" (
    "id" integer DEFAULT nextval('mails_id_seq') NOT NULL,
    "fullName" character varying NOT NULL,
    "email" character varying NOT NULL,
    "cc" json,
    "objet" character varying NOT NULL,
    "message" character varying NOT NULL,
    "pieceJointe" character varying NOT NULL,
    "read" boolean NOT NULL,
    "fullNameDest" character varying NOT NULL,
    "emailDest" character varying NOT NULL,
    "dateSend" timestamp NOT NULL,
    "dateRead" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "mobiliers";
DROP SEQUENCE IF EXISTS mobiliers_id_seq;
CREATE SEQUENCE mobiliers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."mobiliers" (
    "id" integer DEFAULT nextval('mobiliers_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "descriptionMobilier" character varying NOT NULL,
    "nombre" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "number_factures";
DROP SEQUENCE IF EXISTS number_factures_id_seq;
CREATE SEQUENCE number_factures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."number_factures" (
    "id" integer DEFAULT nextval('number_factures_id_seq') NOT NULL,
    "number" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "performences";
DROP SEQUENCE IF EXISTS performences_id_seq;
CREATE SEQUENCE performences_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."performences" (
    "id" integer DEFAULT nextval('performences_id_seq') NOT NULL,
    "agent" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "hospitalite" character varying NOT NULL,
    "ponctualite" character varying NOT NULL,
    "travaille" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "performences_note";
DROP SEQUENCE IF EXISTS performences_note_id_seq;
CREATE SEQUENCE performences_note_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."performences_note" (
    "id" integer DEFAULT nextval('performences_note_id_seq') NOT NULL,
    "agent" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "hospitalite" character varying NOT NULL,
    "ponctualite" character varying NOT NULL,
    "travaille" character varying NOT NULL,
    "note" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "presences";
DROP SEQUENCE IF EXISTS presences_id_seq;
CREATE SEQUENCE presences_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."presences" (
    "id" integer DEFAULT nextval('presences_id_seq') NOT NULL,
    "arrive" timestamp NOT NULL,
    "arriveAgent" json,
    "sortie" timestamp NOT NULL,
    "sortieAgent" json,
    "remarque" character varying NOT NULL,
    "finJournee" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "produits_model";
DROP SEQUENCE IF EXISTS produits_model_id_seq;
CREATE SEQUENCE produits_model_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."produits_model" (
    "id" integer DEFAULT nextval('produits_model_id_seq') NOT NULL,
    "categorie" character varying NOT NULL,
    "sousCategorie1" character varying NOT NULL,
    "sousCategorie2" character varying NOT NULL,
    "sousCategorie3" character varying NOT NULL,
    "sousCategorie4" character varying NOT NULL,
    "idProduct" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "projets";
DROP SEQUENCE IF EXISTS projets_id_seq;
CREATE SEQUENCE projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."projets" (
    "id" integer DEFAULT nextval('projets_id_seq') NOT NULL,
    "nomProjet" character varying NOT NULL,
    "responsable" character varying NOT NULL,
    "objectifs" character varying NOT NULL,
    "description" character varying NOT NULL,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "responsabilite" character varying NOT NULL,
    "communication" character varying NOT NULL,
    "processusVerification" character varying NOT NULL,
    "problemePotientEtRisque" character varying NOT NULL,
    "dateDebutEtFin" character varying NOT NULL,
    "budgetDetail" character varying NOT NULL,
    "recetteAttendus" character varying NOT NULL,
    "listAgentEtRole" json,
    "typeFinancement" character varying NOT NULL,
    "observation" boolean NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "rapports";
DROP SEQUENCE IF EXISTS rapports_id_seq;
CREATE SEQUENCE rapports_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."rapports" (
    "id" integer DEFAULT nextval('rapports_id_seq') NOT NULL,
    "nomProjet" character varying NOT NULL,
    "numeroTache" character varying NOT NULL,
    "rapport" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "refresh_tokens";
DROP SEQUENCE IF EXISTS refresh_tokens_id_seq;
CREATE SEQUENCE refresh_tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."refresh_tokens" (
    "id" integer DEFAULT nextval('refresh_tokens_id_seq') NOT NULL,
    "owner" character varying NOT NULL,
    "token" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "restitutions";
DROP SEQUENCE IF EXISTS restitutions_id_seq;
CREATE SEQUENCE restitutions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."restitutions" (
    "id" integer DEFAULT nextval('restitutions_id_seq') NOT NULL,
    "idProduct" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "firstName" character varying NOT NULL,
    "lastName" character varying NOT NULL,
    "accuseReception" boolean NOT NULL,
    "accuseReceptionFirstName" character varying NOT NULL,
    "accuseReceptionLastName" character varying NOT NULL,
    "role" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "salaires";
DROP SEQUENCE IF EXISTS salaires_id_seq;
CREATE SEQUENCE salaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."salaires" (
    "id" integer DEFAULT nextval('salaires_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "postNom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "numeroSecuriteSociale" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "servicesAffectation" character varying NOT NULL,
    "salaire" character varying NOT NULL,
    "observation" boolean NOT NULL,
    "modePaiement" character varying NOT NULL,
    "createdAt" timestamp NOT NULL,
    "ligneBudgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "tauxJourHeureMoisSalaire" character varying NOT NULL,
    "joursHeuresPayeA100PourecentSalaire" character varying NOT NULL,
    "totalDuSalaire" character varying NOT NULL,
    "nombreHeureSupplementaires" character varying NOT NULL,
    "tauxHeureSupplementaires" character varying NOT NULL,
    "totalDuHeureSupplementaires" character varying NOT NULL,
    "supplementTravailSamediDimancheJoursFerie" character varying NOT NULL,
    "prime" character varying NOT NULL,
    "divers" character varying NOT NULL,
    "joursCongesPaye" character varying NOT NULL,
    "tauxCongesPaye" character varying NOT NULL,
    "totalDuCongePaye" character varying NOT NULL,
    "jourPayeMaladieAccident" character varying NOT NULL,
    "tauxJournalierMaladieAccident" character varying NOT NULL,
    "totalDuMaladieAccident" character varying NOT NULL,
    "pensionDeduction" character varying NOT NULL,
    "indemniteCompensatricesDeduction" character varying NOT NULL,
    "avancesDeduction" character varying NOT NULL,
    "diversDeduction" character varying NOT NULL,
    "retenuesFiscalesDeduction" character varying NOT NULL,
    "nombreEnfantBeneficaireAllocationsFamiliales" character varying NOT NULL,
    "nombreDeJoursAllocationsFamiliales" character varying NOT NULL,
    "tauxJoursAllocationsFamiliales" character varying NOT NULL,
    "totalAPayerAllocationsFamiliales" character varying NOT NULL,
    "netAPayer" character varying NOT NULL,
    "montantPrisConsiderationCalculCotisationsINSS" character varying NOT NULL,
    "totalDuBrut" character varying NOT NULL,
    "signature" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "stocks_global";
DROP SEQUENCE IF EXISTS stocks_global_id_seq;
CREATE SEQUENCE stocks_global_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."stocks_global" (
    "id" integer DEFAULT nextval('stocks_global_id_seq') NOT NULL,
    "idProduct" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantityAchat" character varying NOT NULL,
    "priceAchatUnit" character varying NOT NULL,
    "prixVenteUnit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "modeAchat" boolean NOT NULL,
    "tva" character varying NOT NULL,
    "qtyRavitailler" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "succursales";
DROP SEQUENCE IF EXISTS succursales_id_seq;
CREATE SEQUENCE succursales_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."succursales" (
    "id" integer DEFAULT nextval('succursales_id_seq') NOT NULL,
    "name" character varying NOT NULL,
    "adresse" character varying,
    "province" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "taches";
DROP SEQUENCE IF EXISTS taches_id_seq;
CREATE SEQUENCE taches_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."taches" (
    "id" integer DEFAULT nextval('taches_id_seq') NOT NULL,
    "nomProjet" character varying NOT NULL,
    "numeroTache" character varying NOT NULL,
    "agent" character varying NOT NULL,
    "jalon" character varying NOT NULL,
    "tache" character varying NOT NULL,
    "signatureResp" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "read" boolean NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "trajets";
DROP SEQUENCE IF EXISTS trajets_id_seq;
CREATE SEQUENCE trajets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."trajets" (
    "id" integer DEFAULT nextval('trajets_id_seq') NOT NULL,
    "nomeroEntreprise" character varying NOT NULL,
    "nomUtilisateur" character varying NOT NULL,
    "trajetDe" character varying NOT NULL,
    "trajetA" character varying NOT NULL,
    "mission" character varying NOT NULL,
    "kilometrageSorite" character varying NOT NULL,
    "kilometrageRetour" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "photo" character varying NOT NULL,
    "nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "servicesAffectation" character varying NOT NULL,
    "fonctionOccupe" character varying NOT NULL,
    "role" character varying NOT NULL,
    "isOnline" boolean NOT NULL,
    "createdAt" timestamp NOT NULL,
    "passwordHash" character varying NOT NULL,
    "succursale" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "ventes";
DROP SEQUENCE IF EXISTS ventes_id_seq;
CREATE SEQUENCE ventes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ventes" (
    "id" integer DEFAULT nextval('ventes_id_seq') NOT NULL,
    "idProductCart" character varying NOT NULL,
    "quantityCart" character varying NOT NULL,
    "priceTotalCart" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qtyRemise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "versement_projets";
DROP SEQUENCE IF EXISTS versement_projets_id_seq;
CREATE SEQUENCE versement_projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."versement_projets" (
    "id" integer DEFAULT nextval('versement_projets_id_seq') NOT NULL,
    "nomProjet" character varying NOT NULL,
    "pieceJustificative" character varying NOT NULL,
    "montantVerser" character varying NOT NULL,
    "montantEnLettre" character varying NOT NULL,
    "typeVersement" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


-- 2022-05-28 19:35:58.591367+00