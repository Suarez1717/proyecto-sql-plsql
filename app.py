import cx_Oracle

connection = cx_Oracle.connect("usuario", "contrasena", "localhost/XEPDB1")
cursor = connection.cursor()

def registrar_producto():
    nombre = input("Nombre del producto: ")
    precio = float(input("Precio unitario: "))
    stock = int(input("Cantidad inicial: "))
    id_prod = int(input("ID del producto: "))

    cursor.execute("INSERT INTO productos VALUES (:1, :2, :3, :4)", (id_prod, nombre, precio, stock))
    connection.commit()
    print("Producto registrado correctamente.")

def listar_productos():
    cursor.execute("SELECT * FROM productos")
    for row in cursor.fetchall():
        print(row)

def registrar_venta():
    id_venta = int(input("ID de venta: "))
    id_producto = int(input("ID del producto vendido: "))
    cantidad = int(input("Cantidad vendida: "))

    cursor.execute("INSERT INTO ventas VALUES (:1, :2, :3, SYSDATE)", (id_venta, id_producto, cantidad))
    connection.commit()
    print("Venta registrada correctamente.")

while True:
    print("\n1. Registrar producto")
    print("2. Listar productos")
    print("3. Registrar venta")
    print("4. Salir")
    opcion = input("Seleccione una opción: ")

    if opcion == "1":
        registrar_producto()
    elif opcion == "2":
        listar_productos()
    elif opcion == "3":
        registrar_venta()
    elif opcion == "4":
        break
    else:
        print("Opción inválida")
