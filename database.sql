CREATE TABLE Personnel (
    id_personnel INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    DATE_embauche DATE,
    salaire FLOAT,
    affectation_specialite VARCHAR(50),
    service_affectation VARCHAR(50),
    statut VARCHAR(50),
    langue VARCHAR(50),
    responsable VARCHAR(50)
);

CREATE TABLE Patient (
    id_patient INT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    DATE_naissance DATE,
    sexe CHAR,
    adresse VARCHAR(50),
    téléphone VARCHAR(50),
    num_assurance VARCHAR(50),
    langue VARCHAR(50),
    hospitalise CHAR,
    DATE_création DATETIME,
    id_chambre INT,
    id_dossier_médical INT
);

CREATE TABLE Dossier_médical (
    id_dossier_médical INT PRIMARY KEY,
    id_patient INT,
    antécédents TEXT,
    traitements TEXT
);

CREATE TABLE Service (
    id_service INT PRIMARY KEY,
    nom VARCHAR(50),
    id_personnel INT
);

CREATE TABLE Locaux (
    id_locaux INT PRIMARY KEY,
    id_service INT,
    localisation VARCHAR(50),
    fonctions VARCHAR(50)
);

CREATE TABLE Chambre (
    id_locaux INT PRIMARY KEY,
    id_patient INT
);

CREATE TABLE Stockage (
    id_locaux INT PRIMARY KEY,
    description TEXT
);

CREATE TABLE Équipement (
    id_équipement INT PRIMARY KEY,
    nom VARCHAR(50),
    type VARCHAR(50),
    id_service_ref INT,
    id_service_actif INT
);

CREATE TABLE Médecin (
    id_personnel INT PRIMARY KEY,
    num_licence VARCHAR(50)
);

CREATE TABLE Infirmier (
    id_personnel INT PRIMARY KEY,
    niveau_certification VARCHAR(50)
);

CREATE TABLE Intendance (
    id_personnel INT PRIMARY KEY,
    zone_attribuee VARCHAR(50),
    fonction VARCHAR(50)
);

CREATE TABLE Pharmacie (
    id_pharmacie INT PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(50)
);

CREATE TABLE Médicament (
    id_médicament INT PRIMARY KEY,
    nom VARCHAR(50),
    description TEXT,
    id_pharmacie INT
);

CREATE TABLE Hospitalisation (
    id_hospitalisation INT PRIMARY KEY,
    id_médecin INT,
    id_patient INT,
    motif TEXT,
    id_chambre INT,
    id_service INT,
    id_infirmier INT
);

CREATE TABLE Prescription (
    id_prescription INT PRIMARY KEY,
    id_médecin INT,
    id_médicament INT,
    date DATETIME,
    description TEXT
);

CREATE TABLE Consultation (
    id_consultation INT PRIMARY KEY,
    id_patient INT,
    id_médecin INT,
    date DATETIME,
    id_consultation_ref INT,
    id_prescription INT,
    motif TEXT
);

CREATE TABLE Urgence (
    id_urgence INT PRIMARY KEY,
    id_patient INT,
    date DATETIME,
    description TEXT
);

CREATE TABLE Facture (
    id_facture INT PRIMARY KEY,
    id_patient INT,
    montant FLOAT,
    date DATETIME
);

CREATE TABLE Commande (
    id_commande INT PRIMARY KEY,
    id_médicament INT,
    id_prescription INT
);

CREATE TABLE Suivi (
    id_hospitalisation INT,
    id_infirmier INT,
    PRIMARY KEY (id_hospitalisation, id_infirmier)
);