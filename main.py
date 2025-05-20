import random
from datetime import datetime, timedelta

try:
    from faker import Faker
    fake = Faker('fr_FR')
    language = ['fr_CH', 'en_US', 'de_CH', 'it_IT', 'ar_EG', 'en_IN']
except ImportError:
    fake = None

def random_date(start, end):
    """Generate a random datetime between `start` and `end`"""
    return start + timedelta(
        seconds=random.randint(0, int((end - start).total_seconds())),
    )

def generate_names(n, start=1):
    global fake, language
    names = []
    for i in range(start, start + n):

        if fake:
            fake = Faker(random.choice(language))
            gender = random.choice(['M', 'F'])
            name = fake.name_male() if gender == 'M' else fake.name_female()
            langue = random.choice(['Français', 'Arabe', 'Espagnol', 'Anglais', 'Italien', 'Allemand', 'Tchèque', 'Russe', 'Somali', 'Malayalam'])
            names.append((name, gender, langue))

    return names

def generate_patients(n=5, start=1):
    names = generate_names(n, start)
    patients = []
    for i in range(n):
        name, sexe, langue = names[i]
        dob = datetime(1950, 1, 1) + timedelta(days=random.randint(0, 25000))
        hospitalise = random.choice(['O', 'N'])
        patients.append(
            f"INSERT INTO Patient VALUES ({start + i}, '{name}', '{dob.date()}', '{sexe}', '{langue}', '{hospitalise}');"
        )
    return patients

def generate_contacts(n=5, start=1):
    contacts = []
    for i in range(n):
        adresse = f"{random.randint(1,999)} rue {chr(65+(start+i)%26)}"
        telephone = f"06{random.randint(10000000,99999999)}"
        num_assurance = f"ASSUR{random.randint(100,999)}"
        contacts.append(
            f"INSERT INTO Contact VALUES ({start + i}, {start + i}, '{adresse}', '{telephone}', '{num_assurance}');"
        )
    return contacts

def generate_factures(n=5, start=1):
    factures = []
    base_date = datetime(2024, 5, 10, 9, 0, 0)
    for i in range(n):
        montant = round(random.uniform(100, 500), 2)
        date_ = base_date + timedelta(days=i, hours=i)
        factures.append(
            f"INSERT INTO Facture VALUES ({start + i}, {start + i}, {montant}, '{date_.strftime('%Y-%m-%d %H:%M:%S')}');"
        )
    return factures

def generate_assurances(n=5, start=1):
    descs = [
        "Assurance maladie", "Assurance privée", "Assurance internationale",
        "Assurance étudiante", "Assurance privée"
    ]
    assurances = []
    for i in range(n):
        assurances.append(
            f"INSERT INTO Assurance VALUES ({start + i}, {start + i}, '{descs[i % len(descs)]}');"
        )
    return assurances

def generate_profils(n=5, start=1):
    profils = []
    for i in range(n):
        profils.append(
            f"INSERT INTO Profil_médical VALUES ({start + i}, {start + i});"
        )
    return profils

def generate_antecedents(n=5, start=1):
    antecedents_list = [
        "Allergie pénicilline", "Asthme", "Hypertension", 
        "Aucun", "Diabète type 2"
    ]
    antecedents = []
    for i in range(n):
        antecedents.append(
            f"INSERT INTO Antécédents VALUES ({start + i}, {start + i}, '{antecedents_list[i % len(antecedents_list)]}');"
        )
    return antecedents

def main():
    n = 50 
    i = 6
    
    
    lines = []
    lines += ["-- Patients"]
    lines += generate_patients(n, start=i)
    lines += ["\n-- Contact"]
    lines += generate_contacts(n, start=i)
    lines += ["\n-- Facture"]
    lines += generate_factures(n, start=i)
    lines += ["\n-- Assurance"]
    lines += generate_assurances(n, start=i)
    lines += ["\n-- Profil_médical"]
    lines += generate_profils(n, start=i)
    lines += ["\n-- Antécédents"]
    lines += generate_antecedents(n, start=i)

    with open("dummy_generated.sql", "w", encoding="utf-8") as f:
        for line in lines:
            f.write(line + "\n")

if __name__ == "__main__":
    main()