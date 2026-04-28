import sqlite3

con = sqlite3.connect("database.db")

con.execute("""
CREATE TABLE IF NOT EXISTS users (
    name TEXT,
    email TEXT PRIMARY KEY,
    password TEXT
)
""")

con.commit()
con.close()

print("database.db created successfully")