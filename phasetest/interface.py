import streamlit as st
import sqlite3
from datetime import datetime
from random import randint
# Connexion à la base de données SQLite
DB_FILE = 'hospital_project.db'

def get_connection():
    return sqlite3.connect(DB_FILE)

def fetch_data(query, params=()):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(query, params)
    rows = cursor.fetchall()
    conn.close()
    return rows

def execute_query(query, params):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.execute(query, params)
    conn.commit()
    conn.close()

def get_next_id(table, id_col):
    result = fetch_data(f"SELECT MAX({id_col}) FROM {table}")
    max_id = result[0][0] if result and result[0][0] is not None else 0
    return max_id + 1

st.title("🏥 Système de Gestion Hospitalière")

menu = st.sidebar.selectbox(
    "Sélectionnez une action",
    ["Ajouter une Hospitalisation", "Ajouter une Urgence", "Voir les Données", "Enregistrer un Patient"]
)

if menu == "Ajouter une Hospitalisation":
    st.subheader("➕ Ajouter une Hospitalisation")

    # Récupérer les données des clés étrangères
    patients = fetch_data("SELECT id_patient, NomComplet FROM Patient")
    Médecins = fetch_data("SELECT id_personnel, num_licence FROM Médecin")
    infirmiers = fetch_data("SELECT id_personnel, niveau_certification FROM Infirmier")
    chambres = fetch_data("SELECT id_chambre FROM Chambre")

    selected_patient = st.selectbox("Patient", patients, format_func=lambda x: f"{x[0]} - {x[1]}")
    selected_Médecin = st.selectbox("Médecin", Médecins, format_func=lambda x: f"{x[0]} - {x[1]}")
    selected_infirmier = st.selectbox("Infirmier", infirmiers, format_func=lambda x: f"{x[0]} - {x[1]}")
    selected_chambre = st.selectbox("Chambre", [c[0] for c in chambres])

    motif = st.text_area("Motif")

    if st.button("📥 Enregistrer l'Hospitalisation"):
        next_id = get_next_id("Hospitalisation", "id_hospitalisation")
        execute_query(
            "INSERT INTO Hospitalisation (id_hospitalisation, id_médecin, id_patient, motif, id_chambre, id_infirmier) VALUES (?, ?, ?, ?, ?, ?)",
            (next_id, selected_Médecin[0], selected_patient[0], motif, selected_chambre, selected_infirmier[0])
        )
        st.success("Hospitalisation enregistrée avec succès.")

elif menu == "Ajouter une Urgence":
    st.subheader("🚨 Ajouter une Urgence")

    patients = fetch_data("SELECT id_patient, NomComplet FROM Patient")
    Médecins = fetch_data("SELECT id_personnel, num_licence FROM Médecin")

    selected_patient = st.selectbox("Patient", patients, format_func=lambda x: f"{x[0]} - {x[1]}")
    selected_Médecin = st.selectbox("Médecin", Médecins, format_func=lambda x: f"{x[0]} - {x[1]}")
    date_urgence = st.date_input("Date")
    time_urgence = st.time_input("Heure")
    description = st.text_area("Description de l'urgence")

    full_datetime = datetime.combine(date_urgence, time_urgence)

    if st.button("📥 Enregistrer l'Urgence"):
        next_id = get_next_id("Urgence", "id_urgence")
        execute_query(
            "INSERT INTO Urgence (id_urgence, id_patient, id_médecin, date, description) VALUES (?, ?, ?, ?, ?)",
            (next_id, selected_patient[0], selected_Médecin[0], full_datetime, description)
        )
        st.success("Urgence enregistrée avec succès.")
elif menu == "Enregistrer un Patient":
    st.subheader("🧑‍⚕️ Enregistrer un Patient")

    NomComplet = st.text_input("Nom Complet")
    date_naissance = st.date_input("Date de Naissance")
    sexe = st.selectbox("Sexe", ["Masculin", "Féminin"])
    if sexe == "Masculin":
        sexe = "M"
    else:
        sexe = "F"
    langue = st.selectbox("Langue", ['Français', 'Arabe', 'Espagnol', 'Anglais', 'Italien', 'Allemand', 'Tchèque', 'Russe'])
    Hospitalise = st.selectbox("Hospitalisé", ['Oui', 'Non'])
    if Hospitalise == "Oui":
        Hospitalise = "O"
    else:
        Hospitalise = "N"
    
    adresse = st.selectbox("Canton", [
        "Zurich",
        "Aargau",
        "Schwyz",
        "Zug",
        "Thurgau",
        "St. Gallen",
        "Bern",
        "Vaud",
        "Geneva",
        "Lucerne",
        "Ticino",
        "Valais",
        "Neuchâtel",
        "Fribourg",
        "Jura",
        "Uri",
        "Obwalden",
        "Nidwalden",
        "Glarus",
        "Appenzell Innerrhoden",
        "Appenzell Ausserrhoden",
        "Basel-Stadt",
        "Basel-Landschaft",
        "Graubünden",
        "Solothurn",
        "Schaffhausen"
    ])
    telephone = st.text_input("Téléphone")
    if st.button("📥 Enregistrer le Patient"):
        next_id_patient = get_next_id("Patient", "id_patient")
        next_id_contact = get_next_id("Contact", "id_contact")
        execute_query(
            "INSERT INTO contact ('id_contact', 'id_patient', 'adresse', 'telephone', 'num_assurance') VALUES (?, ?, ?, ?, ?)",
            (next_id_contact, next_id_patient, adresse, telephone, f'ASSUR{randint(1000, 9999)}')
        )
        execute_query(
            "INSERT INTO patient ('id_patient', 'NomComplet', 'DATE_naissance', 'sexe', 'langue', 'hospitalise') VALUES (?, ?, ?, ?, ?, ?)",
            (next_id_patient, NomComplet, date_naissance, sexe, langue, Hospitalise)
        )
        st.success("Patient enregistré avec succès.")

elif menu == "Voir les Données":
    st.subheader("📄 Voir les Données")
    table = st.selectbox("Choisir la table", ["Hospitalisation", "Urgence", "Patient", "Médecin"])

    if st.button("🔍 Afficher"):
        rows = fetch_data(f"SELECT * FROM {table}")
        st.dataframe(rows)