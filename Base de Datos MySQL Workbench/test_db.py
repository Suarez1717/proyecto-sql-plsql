import os
from dotenv import load_dotenv
import mysql.connector as mysql
load_dotenv()
DB_HOST=os.getenv('DB_HOST','127.0.0.1'); DB_PORT=int(os.getenv('DB_PORT','3306'))
DB_USER=os.getenv('DB_USER','root'); DB_PASS=os.getenv('DB_PASS',''); DB_NAME=os.getenv('DB_NAME','tienda')
print(f"Conectando a {DB_HOST}:{DB_PORT} user={DB_USER}")
try:
    conn=mysql.connect(host=DB_HOST,port=DB_PORT,user=DB_USER,password=DB_PASS)
    cur=conn.cursor(); cur.execute("SELECT VERSION()"); print("Version:",cur.fetchone()[0]); cur.close(); conn.close()
    conn=mysql.connect(host=DB_HOST,port=DB_PORT,user=DB_USER,password=DB_PASS,database=DB_NAME)
    cur=conn.cursor(); cur.execute("SHOW TABLES"); print("Tablas:",[r[0] for r in cur.fetchall()]); cur.close(); conn.close()
    print("OK")
except mysql.Error as e:
    print("ERROR:", e)
