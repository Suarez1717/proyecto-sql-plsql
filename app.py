# versión compacta del app.py (igual lógica de la v2)
import os
from datetime import date
import pandas as pd
import mysql.connector as mysql
from dotenv import load_dotenv
import dash
from dash import Dash, html, dcc, Input, Output, State, callback_context
from dash.dash_table import DataTable
import dash_bootstrap_components as dbc

load_dotenv()
DB_HOST=os.getenv("DB_HOST","127.0.0.1"); DB_PORT=int(os.getenv("DB_PORT","3306"))
DB_USER=os.getenv("DB_USER","root"); DB_PASS=os.getenv("DB_PASS",""); DB_NAME=os.getenv("DB_NAME","tienda")
def get_conn(): return mysql.connect(host=DB_HOST,port=DB_PORT,user=DB_USER,password=DB_PASS,database=DB_NAME)

def callproc_fetchall(proc, params=()):
    with get_conn() as conn:
        cur=conn.cursor(dictionary=True); cur.callproc(proc, params)
        rows=[]; [rows.extend(r.fetchall()) for r in cur.stored_results()]; conn.commit(); return rows
def callproc_affect(proc, params=()):
    with get_conn() as conn:
        cur=conn.cursor(dictionary=True); cur.callproc(proc, params)
        out=[]; [out.extend(r.fetchall()) for r in cur.stored_results()]; conn.commit(); return out
def fetch_df(sql): 
    with get_conn() as conn: return pd.read_sql(sql, conn)
def toast(m,c="success"): return dbc.Alert(m,color=c,dismissable=True,is_open=True,duration=4000)

app=Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])
app.layout=html.Div([
    dbc.Navbar(dbc.Container([dbc.NavbarBrand("Inventario - MySQL + Dash"),
                              html.Div(id="db-ok",className="text-white ms-auto")]), color="dark", dark=True),
    dcc.Tabs(id="tabs",value="inv",children=[
        dcc.Tab(label="Inventario",value="inv",children=dbc.Container([
            dbc.Card([dbc.CardHeader("Agregar"), dbc.CardBody([
                dbc.Row([dbc.Col(dbc.Input(id="add-nombre",placeholder="Nombre"),md=4),
                         dbc.Col(dbc.Input(id="add-precio",type="number",placeholder="Precio",step="0.01"),md=4),
                         dbc.Col(dbc.Input(id="add-stock",type="number",placeholder="Stock"),md=4)],className="g-2"),
                dbc.Button("Agregar",id="btn-add",color="primary",className="mt-2")])],className="mb-3"),
            dbc.Card([dbc.CardHeader("Editar/Eliminar"), dbc.CardBody([
                dbc.Row([dbc.Col(dbc.Input(id="edit-id",disabled=True),md=2),
                         dbc.Col(dbc.Input(id="edit-nombre"),md=4),
                         dbc.Col(dbc.Input(id="edit-precio",type="number",step="0.01"),md=3),
                         dbc.Col(dbc.Input(id="edit-stock",type="number"),md=3)],className="g-2"),
                dbc.Button("Guardar",id="btn-edit",color="success",className="mt-2 me-2"),
                dbc.Button("Eliminar",id="btn-del",color="danger",className="mt-2")])]),
            DataTable(id="tbl-inv",page_size=10,columns=[{"name":n,"id":n} for n in ["id","nombre","precio","stock"]],
                      row_selectable="single",sort_action="native"),
            dbc.Button("Refrescar",id="btn-refresh",className="mt-2"),
            html.Div(id="inv-toast")],fluid=True)),
        dcc.Tab(label="Ventas",value="ven",children=dbc.Container([
            dbc.Card([dbc.CardHeader("Registrar venta"), dbc.CardBody([
                dbc.Row([dbc.Col(dbc.Input(id="venta-idprod",type="number",placeholder="ID producto"),md=3),
                         dbc.Col(dbc.Input(id="venta-cant",type="number",placeholder="Cantidad"),md=3),
                         dbc.Col(dbc.Input(id="venta-precio",type="number",step="0.01",placeholder="Precio"),md=3),
                         dbc.Col(dbc.Input(id="venta-fecha",placeholder="YYYY-MM-DD"),md=3)],className="g-2"),
                dbc.Button("Vender",id="btn-vender",color="primary",className="mt-2"),
                html.Div(id="venta-toast")])]),
            DataTable(id="tbl-ventas",page_size=10,columns=[{"name":n,"id":n} for n in ["id","id_producto","cantidad","precio","fecha_venta"]]),
            dbc.Row([dbc.Col(dbc.Input(id="ventas-dia",placeholder="YYYY-MM-DD"),md=3),
                     dbc.Col(dbc.Button("Cargar ventas del día",id="btn-ventas-dia",className="mt-2"),md=3)])],fluid=True)),
        dcc.Tab(label="Reportes",value="rep",children=dbc.Container([
            dbc.Row([dbc.Col(dcc.Graph(id="graf-stock"),md=6),dbc.Col(dcc.Graph(id="graf-ventas-dia"),md=6)]),
            dbc.Button("Actualizar",id="btn-reportes",className="mt-2")],fluid=True))
    ])
])

@app.callback(Output("db-ok","children"), Input("tabs","value"))
def _db(_):
    try:
        with get_conn() as c: pass
        return "DB ✅"
    except Exception as e:
        return f"DB ❌ {e}"

@app.callback(Output("tbl-inv","data"), Output("inv-toast","children"),
              Input("btn-refresh","n_clicks"), Input("btn-add","n_clicks"),
              Input("btn-edit","n_clicks"), Input("btn-del","n_clicks"),
              State("add-nombre","value"), State("add-precio","value"), State("add-stock","value"),
              State("edit-id","value"), State("edit-nombre","value"),
              State("edit-precio","value"), State("edit-stock","value"), prevent_initial_call=True)
def inv(nr,na,ne,nd, an,ap,as_, eid,en,ep,es):
    trig=(callback_context.triggered[0]["prop_id"].split(".")[0] if callback_context.triggered else None)
    msg=html.Div()
    try:
        if trig=="btn-add" and an and ap is not None and as_ is not None:
            out=callproc_affect("prc_insertar_producto",(an,float(ap),int(as_))); nid=out[0]["id"] if out else None
            msg=toast(f"Agregado ID {nid}")
        elif trig=="btn-edit" and eid:
            if ep is not None: callproc_affect("prc_actualizar_precio_producto",(int(eid),float(ep)))
            if es is not None: callproc_affect("prc_actualizar_stock",(int(eid),int(es)))
            if en: 
                with get_conn() as conn:
                    cur=conn.cursor(); cur.execute("UPDATE productos SET nombre=%s WHERE id=%s",(en,int(eid))); conn.commit()
            msg=toast("Guardado","info")
        elif trig=="btn-del" and eid:
            callproc_affect("prc_eliminar_producto",(int(eid),)); msg=toast("Eliminado","danger")
    except Exception as e: msg=toast(f"Error: {e}","danger")
    rows=callproc_fetchall("prc_listar_productos"); return rows, msg

@app.callback(Output("edit-id","value"), Output("edit-nombre","value"),
              Output("edit-precio","value"), Output("edit-stock","value"),
              Input("tbl-inv","selected_rows"), State("tbl-inv","data"))
def sel(rows,data):
    if rows and data:
        r=data[rows[0]]; return r["id"], r["nombre"], float(r["precio"]), int(r["stock"])
    return None,None,None,None

@app.callback(Output("venta-toast","children"), Output("tbl-ventas","data"),
              Input("btn-vender","n_clicks"), Input("btn-ventas-dia","n_clicks"),
              State("venta-idprod","value"), State("venta-cant","value"),
              State("venta-precio","value"), State("venta-fecha","value"),
              State("ventas-dia","value"), prevent_initial_call=True)
def ventas(nv,nd,idp,cant,precio,fecha_txt,fecha_dia):
    trig=(callback_context.triggered[0]["prop_id"].split(".")[0] if callback_context.triggered else None)
    msg=html.Div(); rows=[]
    try:
        if trig=="btn-vender":
            out=callproc_affect("prc_insertar_venta",(int(idp),int(cant),float(precio),fecha_txt)); nid=out[0]["id"] if out else None
            msg=toast(f"Venta ID {nid}"); fecha_dia=date.today().isoformat(); rows=callproc_fetchall("prc_ventas_dia",(fecha_dia,))
        elif trig=="btn-ventas-dia":
            fecha=fecha_dia or date.today().isoformat(); rows=callproc_fetchall("prc_ventas_dia",(fecha,)); msg=toast(f"Ventas de {fecha}","info")
    except Exception as e: msg=toast(f"Error: {e}","danger")
    return msg, rows

@app.callback(Output("graf-stock","figure"), Output("graf-ventas-dia","figure"),
              Input("btn-reportes","n_clicks"), prevent_initial_call=False)
def reps(n):
    try:
        inv=fetch_df("SELECT * FROM v_valor_inventario ORDER BY valor_inventario DESC")
        vd=fetch_df("SELECT * FROM v_ventas_por_dia ORDER BY fecha")
    except Exception: import pandas as pd; inv=pd.DataFrame({"nombre":[],"valor_inventario":[]}); vd=pd.DataFrame({"fecha":[],"ingresos":[]})
    return ({"data":[{"type":"bar","x":inv.get("nombre",[]),"y":inv.get("valor_inventario",[])}],"layout":{"title":"Valor inventario"}},
            {"data":[{"type":"scatter","mode":"lines+markers","x":vd.get("fecha",[]),"y":vd.get("ingresos",[])}],"layout":{"title":"Ingresos por día"}})

if __name__=="__main__":
    print(f"App conectando a {DB_HOST}:{DB_PORT} db={DB_NAME} user={DB_USER}")
    app.run_server(host="127.0.0.1",port=8050,debug=True)
