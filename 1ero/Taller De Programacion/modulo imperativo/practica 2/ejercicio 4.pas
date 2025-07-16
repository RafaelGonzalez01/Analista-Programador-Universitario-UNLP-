program practica_2_4;


function binario (num:integer): integer;


begin

if (num <> 0) then 
begin
	if(num mod 2 = 0) then 
		binario:= binario(num div 2) * 10
	else
		binario:= binario(num div 2) *10 + 1;
end
else binario:=0;

end;

var

num:integer;

begin

writeln('escriba el numero:');
read(num);

writeln(binario(num));



end.







		
	
	
