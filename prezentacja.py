import mariadb
import sys

DB_CONFIG = {
    "host": "localhost",
    "port": 3306,
    "user": "root",  
    "password": "plokijuh",
}

DATABASE_NAME = "prezentacja"
def create_database():
    conn = None
    cursor = None
    try:
        conn = mariadb.connect(
            host=DB_CONFIG["host"],
            port=DB_CONFIG["port"],
            user=DB_CONFIG["user"],
            password=DB_CONFIG["password"]
        )
        cursor = conn.cursor()
        print("Pomyślnie połączono z bazą danych")
        try:
            cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}")
            print(f"Baza danych {DATABASE_NAME} została utworzona lub już istnieje")
        except mariadb.Error as e:
            print(f"Błąd podczas tworzenia bazy danych '{DATABASE_NAME}': {e}")
            sys.exit(1)

        cursor.close()
        conn.close()

        DB_CONFIG["database"] = DATABASE_NAME
        conn = mariadb.connect(**DB_CONFIG)
        cursor = conn.cursor()

        print(f"Połączono z bazą danych {DATABASE_NAME}")
    except mariadb.Error as e:
        print("Wystąpił błąd podczas tworzenia bazy danych: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Wystąpił nieoczekiwany błąd: {e}")
        sys.exit(1)
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()
            print("Połączenie z bazą danych zostało zamknięte.")
if __name__ == "__main__":
    create_database()