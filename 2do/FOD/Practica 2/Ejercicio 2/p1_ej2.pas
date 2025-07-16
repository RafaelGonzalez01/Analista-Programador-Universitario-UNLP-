program p2_ej1;
const
	valor_alto = 9999;
type
	empleado = record
		codigo: integer;
		nombre: string;
		monto: real;
	end;
	
	archivo_empleados = file of empleado;
	
	archivo_maestro = file of empleado;

procedure Leer(var archivoE:archivo_empleados; var aux:empleado);
begin
	if(not EOF(archivoE)) then
		read(archivoE,aux)
	else 
		aux.codigo:=valor_alto;
end;

procedure crear_maestro(var archivoE: archivo_empleados; var archivoM: archivo_maestro);
var
	auxE,auxM: empleado;
	total:real;
begin
	reset(archivoE);
	rewrite(archivoM);
	leer(archivoE,auxE);
	while (auxE.codigo <> valor_alto) do begin
		total:=0;
		auxM := auxE;
		while (auxE.codigo = auxM.codigo) do begin
			total:= total + auxE.monto;
			leer(archivoE,auxE);
		end;
		auxM.monto:= total;
		write(archivoM,auxM);
	end;
	close(archivoE);
	close(archivoM);
end;
	
var
	archivoE: archivo_empleados;
	archivoM: archivo_maestro;
begin
	assign(archivoE,'empleados1');
	assign(archivoM,'maestro1');
end.
