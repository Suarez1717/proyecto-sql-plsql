SET DEFINE OFF
SET SERVEROUTPUT ON
WHENEVER SQLERROR CONTINUE
PROMPT == Compilación masiva ==

-- Funciones
@Funciones/fn_stock_producto.sql
@Funciones/fn_total_ventas_producto.sql
@Funciones/fn_total_ventas_dia.sql
@Funciones/fn_total_ingresos_dia.sql
@Funciones/fn_total_ingresos_producto.sql
@Funciones/fn_precio_producto.sql
@Funciones/fn_ultima_venta_producto.sql
@Funciones/fn_ventas_producto_en_rango.sql
@Funciones/fn_top_producto_en_rango.sql
@Funciones/fn_producto_existe.sql
@Funciones/fn_formatear_moneda.sql
@Funciones/fn_ingresos_rango.sql
@Funciones/fn_cantidad_productos.sql
@Funciones/fn_cantidad_ventas.sql
@Funciones/fn_producto_nombre.sql

-- Procedimientos (si renombraste la carpeta a 'Procedimientos')
-- @Procedimientos/prc_insertar_producto.sql
-- ...

-- Cursores
@Cursores/cur_listar_productos.sql
@Cursores/cur_productos_agotados.sql
@Cursores/cur_productos_sin_ventas.sql
@Cursores/cur_ventas_dia.sql
@Cursores/cur_ventas_rango.sql
@Cursores/cur_ventas_por_producto.sql
@Cursores/cur_top_productos.sql
@Cursores/cur_ingresos_por_dia.sql
@Cursores/cur_ingresos_por_producto.sql
@Cursores/cur_valor_inventario.sql
@Cursores/cur_ventas_ultimos_7_dias.sql
@Cursores/cur_productos_con_precio_invalido.sql
@Cursores/cur_ventas_mes.sql
@Cursores/cur_buscar_producto.sql
@Cursores/cur_buscar_usuario.sql

-- Paquetes (spec y body)
@Paquetes/spec/pkg_productos_admin.sql
@Paquetes/spec/pkg_ventas.sql
@Paquetes/spec/pkg_reportes.sql
@Paquetes/spec/pkg_stock.sql
@Paquetes/spec/pkg_utils.sql
@Paquetes/spec/pkg_seed.sql
@Paquetes/spec/pkg_purge.sql
@Paquetes/spec/pkg_cursors.sql
@Paquetes/spec/pkg_consultas_producto.sql
@Paquetes/spec/pkg_consultas_ventas.sql

@Paquetes/body/pkg_productos_admin.sql
@Paquetes/body/pkg_ventas.sql
@Paquetes/body/pkg_reportes.sql
@Paquetes/body/pkg_stock.sql
@Paquetes/body/pkg_utils.sql
@Paquetes/body/pkg_seed.sql
@Paquetes/body/pkg_purge.sql
@Paquetes/body/pkg_cursors.sql
@Paquetes/body/pkg_consultas_producto.sql
@Paquetes/body/pkg_consultas_ventas.sql
@Paquetes/body/pkg_admin.sql

-- Vistas
@Vistas/v_ventas_por_dia.sql
@Vistas/v_ventas_por_producto.sql
@Vistas/v_productos_sin_ventas.sql
@Vistas/v_productos_mas_vendidos.sql
@Vistas/v_ingresos_por_dia.sql
@Vistas/v_ingresos_por_producto.sql
@Vistas/v_productos_valor_inventario.sql
@Vistas/v_productos_agotados.sql
@Vistas/v_ventas_ultimos_7_dias.sql
@Vistas/v_ingresos_por_mes.sql

-- Triggers
@Triggers/trg_ventas_bi_validar_stock.sql
@Triggers/trg_ventas_bu_precio_no_negativo.sql
@Triggers/trg_ventas_bu_fijar_producto.sql
@Triggers/trg_productos_bd_proteger_borrado.sql
@Triggers/trg_productos_bu_normalizar_nombre.sql

PROMPT == Fin ==
