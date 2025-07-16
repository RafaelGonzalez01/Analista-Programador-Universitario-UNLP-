program p1ej5;

type
	celular = record
		codigo: integer;
		precio: real;
		marca: string;
		stockDisp: integer;
		stockMin: integer;
		desc: string;
		nombre:string;
	end;
	
	archivo_celular = file of celular;
	
	archivo_texto = Text;

//procedmientos
procedure convertirCelular (var arch:archivo_texto; var c:celular); //retorna un unico registro de delular
begin
	readln(arch,c.codigo,c.precio,c.marca);
	readln(arch,c.stockDisp,c.stockMin,c.desc);
	readln(arch,c.nombre);
end;

procedure imprimirCelular(c:celular);
begin
	writeln(c.codigo,c.precio,c.marca,c.stockDisp,c.stockMin,c.desc,c.nombre);
end;

procedure leerCelular(var c:celular);
begin
	writeln('ingrese el codigo: ');
	read(c.codigo);
	writeln('ingrese el precio: ');
	read(c.precio);
	writeln('ingrese la marca: ');
	readln(c.marca);
	writeln('ingrese el stock disponible: ');
	readln(c.stockDisp);
	writeln('ingrese el stock minimo: ');
	readln(c.stockMin);
	writeln('ingrese la descripcion: ');
	readln(c.desc);
	writeln('ingrese el nombre: ');
	readln(c.nombre);
end;

procedure conversionBinario (var archivoT: archivo_texto; var archivoC:archivo_celular);
var x:string;
c:celular;
begin
	writeln('Ingrese el nombre del archivo binario');
	readln(x);
	assign(archivoC,x);
	rewrite(archivoC);
	//creacion completa, ahora carga
	
	reset(archivoT);
	while (not eof(archivoT)) do begin
		convertirCelular(archivoT,c);
		write(archivoC,c);
	end;
	close(archivoT);
end;

procedure stock_min(var archivoT:archivo_texto);
var
	c:celular;
begin
	reset(archivoT);
	while(not EOF(archivoT)) do begin
		readln(archivoT,c.codigo,c.precio,c.marca);
		readln(archivoT,c.stockDisp,c.stockMin,c.desc);
		readln(archivoT,c.nombre);
		if (c.stockDisp < c.stockMin) then
			imprimirCelular(c);
	close(archivoT);
	end;
end;

procedure cadena(var archivoT:archivo_texto);
var
	c:celular;
	x:string;
begin
	reset(archivoT);
	writeln('ingrese la descripcion de los celulares a encontrar: ');
	readln(x);
	while(not EOF(archivoT)) do begin
		readln(archivoT,c.codigo,c.precio,c.marca);
		readln(archivoT,c.stockDisp,c.stockMin,c.desc);
		readln(archivoT,c.nombre);
		if (x = c.desc) then
			imprimirCelular(c);
	close(archivoT);
	end;
end;

procedure conversionTexto(var archivoC:archivo_celular; var archivoT:archivo_Texto);
var
	c:celular;
begin
	reset(archivoC);
	reset(archivoT);
	while (not EOF(archivoC)) do begin
	end;//completar
end;

procedure agregarTexto(var archivoT:archivo_texto);
var
	c:celular;
begin
	reset(archivoT);
	leerCelular(c);
	seek(archivoT,fileSize(archivoT));
	write(archivoT,c.codigo,c.precio,c.marca);
	write(archivoT,c.stockDisp,c.stockMin,c.desc);
	write(archivoT,c.nombre);
	close(archivoT);
end;

procedure menu(var indice:integer);
begin
	writeln('ingrese 1: convertir archivo de texto a binario, ingrese 2: mostrar celulares por debajo del stock minimo');
	writeln('ingrese 3: encontrar celulares por descripcion');
		readln(indice);
end;

//prorama principal
var
	archivoT:archivo_texto;
	archivoC:archivo_celular;
	indice:integer;
begin
	assign(archivoT,'celulares.txt');
	menu(indice);
	if (indice = 1) then
		conversionBinario(archivoT,archivoC)//implementsr ocn menú
		else if (indice = 2) then
			stock_min(archivoT)
			else if (indice = 3) then
				cadena(archivoT);
end.
