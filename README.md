# Estructura y compilación

Este paquete contiene:
- **15 Funciones** (`Funciones/`)
- **25 Procedimientos** (`Procedimiento almacenados/`)
- **10 Paquetes** (spec y body en `Paquetes/`)
- **10 Vistas** (`Vistas/`)
- **5 Triggers** (`Triggers/`)
- **15 Cursores** como procedimientos con `SYS_REFCURSOR` (`Cursores/`)

> **Nota:** No se crean tablas ni columnas nuevas. Todo opera sobre `PRODUCTOS`, `VENTAS`, `USUARIOS`.

## Paso a paso de compilación (SQL*Plus / SQLcl)

> Por la carpeta **"Procedimiento almacenados"** con espacio, ejecuta manualmente por bloques (o renómbrala en tu repo a `Procedimientos` para usar `@master.sql`).

1. **Funciones**
   ```
   SQL> @Funciones/fn_stock_producto.sql
   SQL> @Funciones/fn_total_ventas_producto.sql
   ... (resto de .sql en la carpeta)
   ```
2. **Procedimientos**
   ```
   SQL> @"Procedimiento almacenados"/prc_insertar_producto.sql
   SQL> @"Procedimiento almacenados"/prc_actualizar_precio_producto.sql
   ... (resto de .sql en la carpeta)
   ```
3. **Cursores**
   ```
   SQL> @Cursores/cur_listar_productos.sql
   ... (resto)
   ```
4. **Paquetes (primero SPEC, luego BODY)**
   ```
   SQL> @Paquetes/spec/pkg_productos_admin.sql
   ...
   SQL> @Paquetes/body/pkg_productos_admin.sql
   ...
   ```
5. **Vistas**
   ```
   SQL> @Vistas/v_ventas_por_dia.sql
   ... (resto)
   ```
6. **Triggers**
   ```
   SQL> @Triggers/trg_ventas_bi_validar_stock.sql
   ... (resto)
   ```

## Pruebas rápidas
```sql
-- Funciones
SELECT fn_total_ingresos_dia(SYSDATE) AS ingresos_hoy FROM dual;

-- Vistas
SELECT * FROM v_ventas_por_producto FETCH FIRST 5 ROWS ONLY;

-- Cursores vía paquete
VAR rc REFCURSOR
EXEC pkg_reportes.ventas_dia(SYSDATE, :rc);
PRINT rc;
```

Generado: 2025-08-27 03:46:29
