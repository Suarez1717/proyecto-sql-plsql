CREATE OR REPLACE PROCEDURE cur_buscar_usuario(p_texto IN VARCHAR2, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT * FROM usuarios
    WHERE UPPER(nombre) LIKE '%'||UPPER(p_texto)||'%'
       OR UPPER(rol)    LIKE '%'||UPPER(p_texto)||'%';
END;
/
