program Parcial;

type
	
	prestamo=record
		numero:integer;
		isbn:integer;
		codigo:integer;
	end;
	
	arbol=^nodo;
	nodo=record
		dato:prestamo;
		HI:arbol;
		HD:arbol;
	end;
	
	data=record
		codigo:integer;
		cant:integer;
	end;
	
	lista=^nodol;
	nodol=record
		dato:data;
		sig:lista;
	end;
	
procedure PuntoA (var a:arbol; var l:lista);

	procedure LeerPrestamo (var p:prestamo);
	begin
		with (p) do
		begin
			codigo:=random(6);
			write('Codigo de socio: ',codigo);
			{readln(codigo);}
			writeln;
			if (codigo <> 0) then
			begin
				numero:=random(5)+1;
				write('Numero de prestamo: ',numero);
				{readln(numero);}
				writeln;
				isbn:=random(10)+1;
				write('ISBN del libro: ',isbn);
				{readln(ISBN);}
				writeln;
				write('---------------------------------');
				writeln;
			end;
		end;
	end;
	
	procedure CargarArbol (var a:arbol; p:prestamo);
	begin
		if (a=nil) then
		begin
			new(a); 
			a^.dato:=p;
			a^.HI:=nil;
			a^.HD:=nil;
		end
		else
			if (a^.dato.isbn >= p.isbn) then
				CargarArbol(a^.HI,p)
			else
				CargarArbol(a^.HD,p);
	end;
	
	procedure CargarLista (var l:lista; p:prestamo);
	var
		nue:lista;
	begin
		new(nue); 
		nue^.dato.codigo:=p.codigo; 
		nue^.dato.cant:=0;
		nue^.sig:=l;
		l:=nue;
	end;
	
var
	act:integer;
	p:prestamo;
begin
	Randomize;
	LeerPrestamo(p);
	while (p.codigo <> 0) do
	begin
		act:=p.codigo;
		CargarLista(l,p);
		while (l<>nil) and (act=p.codigo) do
		begin
			CargarArbol(a,p);
			l^.dato.cant:= l^.dato.cant+1;
			LeerPrestamo(p);
		end;
	end;
end;

function PuntoB (a:arbol; x:integer):integer;
begin
	if (a=nil) then
		PuntoB:=0
	else
	begin	
		if (x < a^.dato.isbn) then
			PuntoB:=PuntoB(a^.HI,x)
		else
			if (x > a^.dato.isbn) then
				PuntoB:=PuntoB(a^.HD,x)
			else
				PuntoB:=PuntoB(a^.HI,x) + 1;
	end;
end;

function PuntoC (l:lista;x:integer):integer;
begin
	if (l<>nil) then
	begin
		if (l^.dato.cant > x) then
			PuntoC:=PuntoC(l^.sig,x)+1
		else
			PuntoC:=PuntoC(l^.sig,x);
	end
	else
		PuntoC:=0;
end;


var
	a:arbol;
	l:lista;
	x:integer;
Begin
	a:=nil;
	l:=nil;
	PuntoA(a,l);
	writeln;
	write('ISBN que desea buscar: ');
	readln(x);
	writeln;
	write('El libro ',x, ' se presto ', PuntoB(a,x),' veces.');
	writeln;
	write('A partir de que cantidad de prestamos desea buscar?: ');
	readln(x);
	write('Hay un total de ',PuntoC(l,x),' socios con mas de ',x,' prestamos.');
	
End.
