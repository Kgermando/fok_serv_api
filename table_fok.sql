-- Adminer 4.8.1 PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) dump

DROP TABLE IF EXISTS "achats";
DROP SEQUENCE IF EXISTS achats_id_seq;
CREATE SEQUENCE achats_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."achats" (
    "id" integer DEFAULT nextval('achats_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "qty_livre" character varying NOT NULL,
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
    "date_rappel" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "agents";
DROP SEQUENCE IF EXISTS agents_id_seq;
CREATE SEQUENCE agents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."agents" (
    "id" integer DEFAULT nextval('agents_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "postnom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "sexe" character varying NOT NULL,
    "role" character varying NOT NULL,
    "matricule" character varying NOT NULL UNIQUE,
    "numero_securite_sociale" character varying NOT NULL,
    "date_naissance" timestamp NOT NULL,
    "lieu_naissance" character varying NOT NULL,
    "nationalite" character varying NOT NULL,
    "type_contrat" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "services_affectation" character varying NOT NULL,
    "date_debut_contrat" timestamp NOT NULL,
    "date_fin_contrat" timestamp NOT NULL,
    "fonction_occupe" character varying NOT NULL,
    "competance" text NOT NULL,
    "experience" text NOT NULL,
    "statut_agent" character varying NOT NULL,
    "created_at" timestamp NOT NULL,
    "photo" character varying,
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
    "numero_chassie" character varying NOT NULL,
    "couleur" character varying NOT NULL,
    "genre" character varying NOT NULL,
    "qty_max_reservoir" character varying NOT NULL,
    "date_fabrication" timestamp NOT NULL,
    "nomero_plaque" character varying NOT NULL,
    "nomero_entreprise" character varying NOT NULL,
    "kilometrage_initiale" character varying NOT NULL,
    "provenance" character varying NOT NULL,
    "type_caburant" character varying NOT NULL,
    "type_moteur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "annuaires";
DROP SEQUENCE IF EXISTS annuaires_id_seq;
CREATE SEQUENCE annuaires_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."annuaires" (
    "id" integer DEFAULT nextval('annuaires_id_seq') NOT NULL,
    "categorie" character varying NOT NULL,
    "nom_postnom_prenom" character varying NOT NULL,
    "email" character varying NOT NULL,
    "mobile_1" character varying NOT NULL,
    "mobile_2" character varying NOT NULL,
    "secteur_activite" character varying NOT NULL,
    "nom_entreprise" character varying NOT NULL,
    "grade" character varying NOT NULL,
    "adresse_entreprise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "approbations";
DROP SEQUENCE IF EXISTS approbations_id_seq;
CREATE SEQUENCE approbations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."approbations" (
    "id" integer DEFAULT nextval('approbations_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "title" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "fontction_occupee" character varying NOT NULL,
    "ligne_budgtaire" character varying NOT NULL,
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
    "departement" character varying NOT NULL,
    "folder_name" character varying NOT NULL,
    "nom_document" character varying NOT NULL,
    "description" character varying NOT NULL,
    "fichier" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "archives_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "archives_folders";
DROP SEQUENCE IF EXISTS archives_folders_id_seq;
CREATE SEQUENCE archives_folders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."archives_folders" (
    "id" integer DEFAULT nextval('archives_folders_id_seq') NOT NULL,
    "departement" character varying NOT NULL,
    "folder_name" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "archives_folders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "balance_comptes";
DROP SEQUENCE IF EXISTS balance_comptes_id_seq;
CREATE SEQUENCE balance_comptes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."balance_comptes" (
    "id" integer DEFAULT nextval('balance_comptes_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "comptes" jsonb,
    "statut" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "banques";
DROP SEQUENCE IF EXISTS banques_id_seq;
CREATE SEQUENCE banques_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."banques" (
    "id" integer DEFAULT nextval('banques_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "coupure_billet" json,
    "ligne_budgetaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "type_operation" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "bilans";
DROP SEQUENCE IF EXISTS bilans_id_seq;
CREATE SEQUENCE bilans_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bilans" (
    "id" integer DEFAULT nextval('bilans_id_seq') NOT NULL,
    "title_bilan" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "bilans_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "bon_livraisons";
DROP SEQUENCE IF EXISTS bon_livraisons_id_seq;
CREATE SEQUENCE bon_livraisons_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."bon_livraisons" (
    "id" integer DEFAULT nextval('bon_livraisons_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "accuse_reception" character varying NOT NULL,
    "accuse_reception_first_name" character varying NOT NULL,
    "accuse_reception_last_name" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "caisses";
DROP SEQUENCE IF EXISTS caisses_id_seq;
CREATE SEQUENCE caisses_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."caisses" (
    "id" integer DEFAULT nextval('caisses_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "coupure_billet" json,
    "ligne_budgetaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "type_operation" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "campaigns";
DROP SEQUENCE IF EXISTS campaigns_id_seq;
CREATE SEQUENCE campaigns_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."campaigns" (
    "id" integer DEFAULT nextval('campaigns_id_seq') NOT NULL,
    "type_produit" character varying NOT NULL,
    "date_debut_et_fin" character varying NOT NULL,
    "agent_affectes" json,
    "cout_campaign" character varying NOT NULL,
    "lieu_cible" character varying NOT NULL,
    "promotion" character varying NOT NULL,
    "objetctifs" character varying NOT NULL,
    "ligne_budgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "carburants";
DROP SEQUENCE IF EXISTS carburants_id_seq;
CREATE SEQUENCE carburants_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."carburants" (
    "id" integer DEFAULT nextval('carburants_id_seq') NOT NULL,
    "operation_entre_sortie" character varying NOT NULL,
    "type_caburant" character varying NOT NULL,
    "fournisseur" character varying NOT NULL,
    "nomero_facture_achat" character varying NOT NULL,
    "prix_achat_par_litre" character varying NOT NULL,
    "nom_receptioniste" character varying NOT NULL,
    "numero_plaque" character varying NOT NULL,
    "date_heure_sortie_anguin" timestamp NOT NULL,
    "qty_achat" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "carts";
DROP SEQUENCE IF EXISTS carts_id_seq;
CREATE SEQUENCE carts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."carts" (
    "id" integer DEFAULT nextval('carts_id_seq') NOT NULL,
    "id_product_cart" character varying NOT NULL,
    "quantity_cart" character varying NOT NULL,
    "price_cart" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "compte_actifs";
DROP SEQUENCE IF EXISTS compte_actifs_id_seq;
CREATE SEQUENCE compte_actifs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."compte_actifs" (
    "id" integer DEFAULT nextval('compte_actifs_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "comptes" character varying NOT NULL,
    "montant" character varying NOT NULL,
    CONSTRAINT "compte_actifs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "compte_passifs";
DROP SEQUENCE IF EXISTS compte_passifs_id_seq;
CREATE SEQUENCE compte_passifs_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."compte_passifs" (
    "id" integer DEFAULT nextval('compte_passifs_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "comptes" character varying NOT NULL,
    "montant" character varying NOT NULL,
    CONSTRAINT "compte_passifs_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "comptes_resultat";
DROP SEQUENCE IF EXISTS comptes_resultat_id_seq;
CREATE SEQUENCE comptes_resultat_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."comptes_resultat" (
    "id" integer DEFAULT nextval('comptes_resultat_id_seq') NOT NULL,
    "intitule" character varying NOT NULL,
    "achat_marchandises" character varying NOT NULL,
    "variation_stock_marchandises" character varying NOT NULL,
    "achat_approvionnements" character varying NOT NULL,
    "variation_approvionnements" character varying NOT NULL,
    "autres_charges_externe" character varying NOT NULL,
    "impots_taxes_versements_assimiles" character varying NOT NULL,
    "renumeration_personnel" character varying NOT NULL,
    "charges_socialas" character varying NOT NULL,
    "dotatiopns_provisions" character varying NOT NULL,
    "autres_charges" character varying NOT NULL,
    "charges_financieres" character varying NOT NULL,
    "charges_exptionnelles" character varying NOT NULL,
    "impot_surbenefices" character varying NOT NULL,
    "solde_crediteur" character varying NOT NULL,
    "ventes_marchandises" character varying NOT NULL,
    "production_vendue_bien_et_serices" character varying NOT NULL,
    "production_stockee" character varying NOT NULL,
    "production_immobilisee" character varying NOT NULL,
    "subvention_exploitation" character varying NOT NULL,
    "autre_produits" character varying NOT NULL,
    "montant_exportation" character varying NOT NULL,
    "produit_financieres" character varying NOT NULL,
    "produit_exceptionnels" character varying NOT NULL,
    "solde_debiteur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "creance_dettes";
DROP SEQUENCE IF EXISTS creance_dettes_id_seq;
CREATE SEQUENCE creance_dettes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."creance_dettes" (
    "id" integer DEFAULT nextval('creance_dettes_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "creance_dette" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "creance_dettes_pkey" PRIMARY KEY ("id")
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
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "statut_paie" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "creances_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "departement_budgets";
DROP SEQUENCE IF EXISTS departement_budgets_id_seq;
CREATE SEQUENCE departement_budgets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."departement_budgets" (
    "id" integer DEFAULT nextval('departement_budgets_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "periode_debut" timestamp NOT NULL,
    "periode_fin" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "dettes";
DROP SEQUENCE IF EXISTS dettes_id_seq;
CREATE SEQUENCE dettes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."dettes" (
    "id" integer DEFAULT nextval('dettes_id_seq') NOT NULL,
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "statut_paie" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "dettes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "devis";
DROP SEQUENCE IF EXISTS devis_id_seq;
CREATE SEQUENCE devis_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."devis" (
    "id" integer DEFAULT nextval('devis_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "priority" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    "is_submit" character varying NOT NULL,
    CONSTRAINT "devis_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "devis_list_objets";
DROP SEQUENCE IF EXISTS devis_list_objets_id_seq;
CREATE SEQUENCE devis_list_objets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."devis_list_objets" (
    "id" integer DEFAULT nextval('devis_list_objets_id_seq') NOT NULL,
    "reference_date" timestamp NOT NULL,
    "title" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "designation" character varying NOT NULL,
    "montant_unitaire" character varying NOT NULL,
    "montant_global" character varying NOT NULL,
    CONSTRAINT "devis_list_objets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "entretiens";
DROP SEQUENCE IF EXISTS entretiens_id_seq;
CREATE SEQUENCE entretiens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."entretiens" (
    "id" integer DEFAULT nextval('entretiens_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "etat_objet" character varying NOT NULL,
    "objet_remplace" json,
    "duree_travaux" character varying NOT NULL,
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
    "type_objet" character varying NOT NULL,
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
    "nom_complet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "libelle" character varying NOT NULL,
    "montant" character varying NOT NULL,
    "coupure_billet" json,
    "ligne_budgetaire" character varying NOT NULL,
    "ressource_fin" character varying NOT NULL,
    "type_operation" character varying NOT NULL,
    "numero_operation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "fin_exterieurs_pkey" PRIMARY KEY ("id")
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
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "marge_ben" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "marge_ben_remise" character varying NOT NULL,
    "qty_livre" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "history_ravitaillements";
DROP SEQUENCE IF EXISTS history_ravitaillements_id_seq;
CREATE SEQUENCE history_ravitaillements_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."history_ravitaillements" (
    "id" integer DEFAULT nextval('history_ravitaillements_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "marge_ben" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "qty_ravitailler" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "immobiliers";
DROP SEQUENCE IF EXISTS immobiliers_id_seq;
CREATE SEQUENCE immobiliers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."immobiliers" (
    "id" integer DEFAULT nextval('immobiliers_id_seq') NOT NULL,
    "type_allocation" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "numero_certificat" character varying NOT NULL,
    "superficie" character varying NOT NULL,
    "date_acquisition" timestamp NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "journals";
DROP SEQUENCE IF EXISTS journals_id_seq;
CREATE SEQUENCE journals_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."journals" (
    "id" integer DEFAULT nextval('journals_id_seq') NOT NULL,
    "numero_operation" character varying NOT NULL,
    "libele" character varying NOT NULL,
    "compte_debit" character varying NOT NULL,
    "montant_debit" character varying NOT NULL,
    "compte_credit" character varying NOT NULL,
    "montant_credit" character varying NOT NULL,
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
    "nom_ligne_budgetaire" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "periode_budget" character varying NOT NULL,
    "unite_choisie" character varying NOT NULL,
    "nombre_unite" character varying NOT NULL,
    "cout_unitaire" character varying NOT NULL,
    "cout_total" character varying NOT NULL,
    "caisse" character varying NOT NULL,
    "banque" character varying NOT NULL,
    "fin_propre" character varying NOT NULL,
    "fin_exterieur" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "mails";
DROP SEQUENCE IF EXISTS mails_id_seq;
CREATE SEQUENCE mails_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."mails" (
    "id" integer DEFAULT nextval('mails_id_seq') NOT NULL,
    "full_name" character varying NOT NULL,
    "email" character varying NOT NULL,
    "cc" json,
    "objet" character varying NOT NULL,
    "message" character varying NOT NULL,
    "piece_jointe" character varying NOT NULL,
    "read" character varying NOT NULL,
    "full_name_dest" character varying NOT NULL,
    "email_dest" character varying NOT NULL,
    "date_send" timestamp NOT NULL,
    "date_read" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "mobiliers";
DROP SEQUENCE IF EXISTS mobiliers_id_seq;
CREATE SEQUENCE mobiliers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."mobiliers" (
    "id" integer DEFAULT nextval('mobiliers_id_seq') NOT NULL,
    "nom" character varying NOT NULL,
    "modele" character varying NOT NULL,
    "marque" character varying NOT NULL,
    "description_mobilier" character varying NOT NULL,
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
    "nom" character varying NOT NULL,
    "postnom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
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
    "remarque" character varying NOT NULL,
    "fin_journee" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "signature_fermeture" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "presences_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "presences_entrer";
DROP SEQUENCE IF EXISTS presences_entrer_id_seq;
CREATE SEQUENCE presences_entrer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."presences_entrer" (
    "id" integer DEFAULT nextval('presences_entrer_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "note" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "presences_entrer_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "presences_sortie";
DROP SEQUENCE IF EXISTS presences_sortie_id_seq;
CREATE SEQUENCE presences_sortie_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."presences_sortie" (
    "id" integer DEFAULT nextval('presences_sortie_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "note" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "presences_sortie_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "produits_model";
DROP SEQUENCE IF EXISTS produits_model_id_seq;
CREATE SEQUENCE produits_model_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."produits_model" (
    "id" integer DEFAULT nextval('produits_model_id_seq') NOT NULL,
    "categorie" character varying NOT NULL,
    "sous_categorie_1" character varying NOT NULL,
    "sous_categorie_2" character varying NOT NULL,
    "sous_categorie_3" character varying NOT NULL,
    "sous_categorie_4" character varying NOT NULL,
    "id_product" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "projets";
DROP SEQUENCE IF EXISTS projets_id_seq;
CREATE SEQUENCE projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."projets" (
    "id" integer DEFAULT nextval('projets_id_seq') NOT NULL,
    "nom_projet" character varying NOT NULL,
    "responsable" character varying NOT NULL,
    "objectifs" character varying NOT NULL,
    "description" character varying NOT NULL,
    "ligne_budgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "responsabilite" character varying NOT NULL,
    "communication" character varying NOT NULL,
    "processus_verification" character varying NOT NULL,
    "probleme_potient_et_risque" character varying NOT NULL,
    "date_debut_et_fin" character varying NOT NULL,
    "budget_detail" character varying NOT NULL,
    "recette_attendus" character varying NOT NULL,
    "list_agent_et_role" json,
    "type_financement" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "rapports";
DROP SEQUENCE IF EXISTS rapports_id_seq;
CREATE SEQUENCE rapports_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."rapports" (
    "id" integer DEFAULT nextval('rapports_id_seq') NOT NULL,
    "nom_projet" character varying NOT NULL,
    "numero_tache" character varying NOT NULL,
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
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "first_name" character varying NOT NULL,
    "last_name" character varying NOT NULL,
    "accuse_reception" character varying NOT NULL,
    "accuse_reception_firstName" character varying NOT NULL,
    "accuse_reception_lastName" character varying NOT NULL,
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
    "postnom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "telephone" character varying NOT NULL,
    "adresse" character varying NOT NULL,
    "departement" character varying NOT NULL,
    "numero_securite_sociale" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "services_affectation" character varying NOT NULL,
    "salaire" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "mode_paiement" character varying NOT NULL,
    "created_at" timestamp NOT NULL,
    "ligne_budgtaire" character varying NOT NULL,
    "resources" character varying NOT NULL,
    "taux_jour_heure_mois_salaire" character varying NOT NULL,
    "jours_heures_paye_a_100_pourecent_salaire" character varying NOT NULL,
    "total_du_salaire" character varying NOT NULL,
    "nombre_heure_supplementaires" character varying NOT NULL,
    "taux_heure_supplementaires" character varying NOT NULL,
    "total_du_heure_supplementaires" character varying NOT NULL,
    "supplement_travail_samedi_dimanche_jours_ferie" character varying NOT NULL,
    "prime" character varying NOT NULL,
    "divers" character varying NOT NULL,
    "jours_conges_paye" character varying NOT NULL,
    "taux_conges_paye" character varying NOT NULL,
    "total_du_conge_paye" character varying NOT NULL,
    "jour_paye_maladie_accident" character varying NOT NULL,
    "taux_journalier_maladie_accident" character varying NOT NULL,
    "total_du_maladie_accident" character varying NOT NULL,
    "pension_deduction" character varying NOT NULL,
    "indemnite_compensatrices_deduction" character varying NOT NULL,
    "avances_deduction" character varying NOT NULL,
    "divers_deduction" character varying NOT NULL,
    "retenues_fiscalesdeduction" character varying NOT NULL,
    "nombre_enfant_beneficaire_allocations_familiales" character varying NOT NULL,
    "nombre_de_jours_allocations_familiales" character varying NOT NULL,
    "taux_jours_allocations_familiales" character varying NOT NULL,
    "total_a_payer_allocations_familiales" character varying NOT NULL,
    "net_a_payer" character varying NOT NULL,
    "montant_pris_consideration_calcul_cotisationsinss" character varying NOT NULL,
    "total_du_brut" character varying NOT NULL,
    "signature" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "stocks_global";
DROP SEQUENCE IF EXISTS stocks_global_id_seq;
CREATE SEQUENCE stocks_global_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."stocks_global" (
    "id" integer DEFAULT nextval('stocks_global_id_seq') NOT NULL,
    "id_product" character varying NOT NULL,
    "quantity" character varying NOT NULL,
    "quantity_achat" character varying NOT NULL,
    "price_achat_unit" character varying NOT NULL,
    "prix_vente_unit" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "mode_achat" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "qty_ravitailler" character varying NOT NULL,
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
    "nom_projet" character varying NOT NULL,
    "numero_tache" character varying NOT NULL,
    "agent" character varying NOT NULL,
    "jalon" character varying NOT NULL,
    "tache" character varying NOT NULL,
    "signature_resp" character varying NOT NULL,
    "created" timestamp NOT NULL,
    "read" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "trajets";
DROP SEQUENCE IF EXISTS trajets_id_seq;
CREATE SEQUENCE trajets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."trajets" (
    "id" integer DEFAULT nextval('trajets_id_seq') NOT NULL,
    "nomero_entreprise" character varying NOT NULL,
    "nom_utilisateur" character varying NOT NULL,
    "trajet_de" character varying NOT NULL,
    "trajet_a" character varying NOT NULL,
    "mission" character varying NOT NULL,
    "kilometrage_sorite" character varying NOT NULL,
    "kilometrage_retour" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "trans_rest_agents";
DROP SEQUENCE IF EXISTS trans_rest_agents_id_seq;
CREATE SEQUENCE trans_rest_agents_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."trans_rest_agents" (
    "id" integer DEFAULT nextval('trans_rest_agents_id_seq') NOT NULL,
    "reference" timestamp NOT NULL,
    "nom" character varying NOT NULL,
    "prenom" character varying NOT NULL,
    "matricule" character varying NOT NULL,
    "montant" character varying NOT NULL,
    CONSTRAINT "trans_rest_agents_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "transport_restaurations";
DROP SEQUENCE IF EXISTS transport_restaurations_id_seq;
CREATE SEQUENCE transport_restaurations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."transport_restaurations" (
    "id" integer DEFAULT nextval('transport_restaurations_id_seq') NOT NULL,
    "title" character varying NOT NULL,
    "observation" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created_ref" timestamp NOT NULL,
    "created" timestamp NOT NULL,
    CONSTRAINT "transport_restaurations_pkey" PRIMARY KEY ("id")
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
    "isOnline" character varying NOT NULL,
    "createdAt" timestamp NOT NULL,
    "passwordHash" character varying NOT NULL,
    "succursale" character varying NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "ventes";
DROP SEQUENCE IF EXISTS ventes_id_seq;
CREATE SEQUENCE ventes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."ventes" (
    "id" integer DEFAULT nextval('ventes_id_seq') NOT NULL,
    "id_product_cart" character varying NOT NULL,
    "quantity_cart" character varying NOT NULL,
    "price_total_cart" character varying NOT NULL,
    "unite" character varying NOT NULL,
    "tva" character varying NOT NULL,
    "remise" character varying NOT NULL,
    "qty_remise" character varying NOT NULL,
    "succursale" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


DROP TABLE IF EXISTS "versement_projets";
DROP SEQUENCE IF EXISTS versement_projets_id_seq;
CREATE SEQUENCE versement_projets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."versement_projets" (
    "id" integer DEFAULT nextval('versement_projets_id_seq') NOT NULL,
    "nom_projet" character varying NOT NULL,
    "piece_justificative" character varying NOT NULL,
    "montant_verser" character varying NOT NULL,
    "montant_en_lettre" character varying NOT NULL,
    "type_versement" character varying NOT NULL,
    "signature" character varying NOT NULL,
    "created" timestamp NOT NULL
) WITH (oids = false);


-- 2022-06-08 15:08:15.276325+00