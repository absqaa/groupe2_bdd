-- Insert into Équipement
INSERT INTO Équipement VALUES (1, 'Scanner', 'Imagerie');
INSERT INTO Équipement VALUES (2, 'Lit médical', 'Mobilier');

-- Insert into Service
INSERT INTO Service VALUES (1, 'Radiologie', 1, 2);
INSERT INTO Service VALUES (2, 'Urgences', 2, 1);

-- Insert into Locaux
INSERT INTO Locaux VALUES (1, 1, 'Bâtiment A', 'Radiologie');
INSERT INTO Locaux VALUES (2, 2, 'Bâtiment B', 'Urgences');

-- Insert into Chambre
INSERT INTO Chambre VALUES (1, 1);
INSERT INTO Chambre VALUES (2, 2);

-- Insert into Stockage
INSERT INTO Stockage VALUES (1, 'Stockage radiologie');
INSERT INTO Stockage VALUES (2, 'Stockage urgences');

-- Insert into Patient
INSERT INTO Patient VALUES (1, 'Jean Dupont', '1980-05-12', 'M', 'Français', 'N', '2024-05-01 10:00:00');
INSERT INTO Patient VALUES (2, 'Marie Curie', '1990-11-23', 'F', 'Français', 'O', '2024-05-02 11:00:00');

-- Insert into Contact
INSERT INTO Contact VALUES (1, 1, '123 rue A', '0600000001', 'ASSUR123');
INSERT INTO Contact VALUES (2, 2, '456 rue B', '0600000002', 'ASSUR456');

-- Insert into Facture
INSERT INTO Facture VALUES (1, 1, 250.50, '2024-05-10 09:00:00');
INSERT INTO Facture VALUES (2, 2, 400.00, '2024-05-11 10:00:00');

-- Insert into Assurance
INSERT INTO Assurance VALUES (1, 1, 'Assurance maladie');
INSERT INTO Assurance VALUES (2, 2, 'Assurance privée');

-- Insert into Personnel
INSERT INTO Personnel VALUES (1, 'Martin', 'Paul', '2010-01-01', 3500, 'Radiologie', 'Radiologie', 'Médecin', 'Français', 'Dr. House');
INSERT INTO Personnel VALUES (2, 'Durand', 'Sophie', '2015-03-15', 2800, 'Urgences', 'Urgences', 'Infirmier', 'Français', 'Dr. House');
INSERT INTO Personnel VALUES (3, 'Lemoine', 'Pierre', '2018-06-20', 2000, 'Intendance', 'Urgences', 'Intendant', 'Français', 'Mme. Martin');

-- Insert into Médecin
INSERT INTO Médecin VALUES (1, 'LIC12345');

-- Insert into Infirmier
INSERT INTO Infirmier VALUES (2, 'CertifA');

-- Insert into Intendance
INSERT INTO Intendance VALUES (3, 'Zone 1', 'Nettoyage');

-- Insert into Profil_médical
INSERT INTO Profil_médical VALUES (1, 1);
INSERT INTO Profil_médical VALUES (2, 2);

-- Insert into Antécédents
INSERT INTO Antécédents VALUES (1, 1, 'Allergie pénicilline');
INSERT INTO Antécédents VALUES (2, 2, 'Asthme');

-- Insert into Médicament
INSERT INTO Médicament VALUES (1, 'Paracétamol', 'Antidouleur');
INSERT INTO Médicament VALUES (2, 'Ibuprofène', 'Anti-inflammatoire');

-- Insert into Consultation
INSERT INTO Consultation VALUES (1, 1, 1, '2024-05-12 14:00:00', NULL, 'Fièvre');
INSERT INTO Consultation VALUES (2, 2, 1, '2024-05-13 15:00:00', 1, 'Douleurs');

-- Insert into Prescription
INSERT INTO Prescription VALUES (1, 1, 1, '2024-05-12 15:00:00', 'Prendre 2x par jour');
INSERT INTO Prescription VALUES (2, 1, 2, '2024-05-13 16:00:00', 'Prendre après repas');

-- Insert into Commande
INSERT INTO Commande VALUES (1, 1, 1);
INSERT INTO Commande VALUES (2, 2, 2);

-- Insert into Urgence
INSERT INTO Urgence VALUES (1, 2, 1, '2024-05-14 18:00:00', 'Crise asthme');

-- Insert into Hospitalisation
INSERT INTO Hospitalisation VALUES (1, 1, 2, 'Observation', 1, 2);

-- Insert into Suivi
INSERT INTO Suivi VALUES (1, 2);





-- Insert more Patients
INSERT INTO Patient VALUES (3, 'Ahmed Benali', '1975-07-22', 'M', 'Arabe', 'N', '2024-05-03 09:30:00');
INSERT INTO Patient VALUES (4, 'Lucie Martin', '2002-03-15', 'F', 'Français', 'O', '2024-05-04 14:20:00');
INSERT INTO Patient VALUES (5, 'Carlos Gomez', '1988-09-10', 'M', 'Espagnol', 'N', '2024-05-05 08:45:00');

-- Insert Contacts for new Patients
INSERT INTO Contact VALUES (3, 3, '789 rue C', '0600000003', 'ASSUR789');
INSERT INTO Contact VALUES (4, 4, '321 rue D', '0600000004', 'ASSUR321');
INSERT INTO Contact VALUES (5, 5, '654 rue E', '0600000005', 'ASSUR654');

-- Insert Factures for new Patients
INSERT INTO Facture VALUES (3, 3, 180.00, '2024-05-12 12:00:00');
INSERT INTO Facture VALUES (4, 4, 320.00, '2024-05-13 13:00:00');
INSERT INTO Facture VALUES (5, 5, 210.00, '2024-05-14 14:00:00');

-- Insert Assurance for new Factures
INSERT INTO Assurance VALUES (3, 3, 'Assurance internationale');
INSERT INTO Assurance VALUES (4, 4, 'Assurance étudiante');
INSERT INTO Assurance VALUES (5, 5, 'Assurance privée');

-- Insert Profil_médical for new Patients
INSERT INTO Profil_médical VALUES (3, 3);
INSERT INTO Profil_médical VALUES (4, 4);
INSERT INTO Profil_médical VALUES (5, 5);

-- Insert Antécédents for new Profiles
INSERT INTO Antécédents VALUES (3, 3, 'Hypertension');
INSERT INTO Antécédents VALUES (4, 4, 'Aucun');
INSERT INTO Antécédents VALUES (5, 5, 'Diabète type 2');

-- Insert Consultations for new Patients (using Médecin id 1)
INSERT INTO Consultation VALUES (3, 3, 1, '2024-05-15 10:00:00', NULL, 'Contrôle annuel');
INSERT INTO Consultation VALUES (4, 4, 1, '2024-05-16 11:00:00', NULL, 'Vaccination');
INSERT INTO Consultation VALUES (5, 5, 1, '2024-05-17 12:00:00', NULL, 'Douleurs abdominales');

-- Insert Prescriptions for new Consultations (using Médicament id 1 and 2)
INSERT INTO Prescription VALUES (3, 1, 1, '2024-05-15 10:30:00', 'Prendre 1x par jour');
INSERT INTO Prescription VALUES (4, 1, 2, '2024-05-16 11:30:00', 'Prendre 3x par jour');
INSERT INTO Prescription VALUES (5, 1, 1, '2024-05-17 12:30:00', 'Prendre après repas');

-- Insert Urgence for new Patients (using Médecin id 1)
INSERT INTO Urgence VALUES (2, 3, 1, '2024-05-18 18:00:00', 'Douleur thoracique');
INSERT INTO Urgence VALUES (3, 4, 1, '2024-05-18 19:00:00', 'Fièvre élevée');
INSERT INTO Urgence VALUES (4, 5, 1, '2024-05-18 20:00:00', 'Blessure sportive');