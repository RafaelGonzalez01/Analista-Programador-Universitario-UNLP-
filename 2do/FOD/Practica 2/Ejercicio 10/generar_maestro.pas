program generar_maestro;

type
  mesa = record
    cod_prov: integer;
    cod_loc: integer;
    num: integer;
    cant: integer;
  end;

  maestro = file of mesa;

var
  m: maestro;
  reg: mesa;
  i, prov, loc, mesa_num: integer;

begin
  assign(m, 'maestro');
  rewrite(m); // crea el archivo maestro

  mesa_num := 1;

  // 3 provincias (1..3), 2 localidades (1..2) por cada una → 6 combinaciones
  // Cargar 5 mesas por combinación: 6 × 5 = 30 registros
  for prov := 1 to 3 do
    for loc := 1 to 2 do
      for i := 1 to 5 do
      begin
        reg.cod_prov := prov;
        reg.cod_loc := loc;
        reg.num := mesa_num;
        reg.cant := 100 + mesa_num; // cantidad simulada
        write(m, reg);
        mesa_num := mesa_num + 1;
      end;

  close(m);
  writeln('Archivo maestro.dat creado con éxito, con 30 registros ordenados.');
end.

