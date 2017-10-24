program lab3;
var
	x1,
	y1,
	x2,
	y2,
	result
		: real;

begin
	write('x1 -> ');
	readln(x1);
	write('y1 -> ');
	readln(y1);

	write('x2 -> ');
	readln(x2);
	write('y2 -> ');
	readln(y2);

	if(x1 = x2) and (y1 = y2) then begin
			writeln('--ERROR--');
			writeln('[x1 : y1] donchen bit ne raven [x2 : y2]');
			writeln('---------');
			exit;
	end;

	if (x1*y2-x2*y1) = 0 then
		writeln('proxodit 4erez nacahlo coordinat')
	else
		writeln('ne proxodit 4erez nachalo coordinat');
	result := sqrt(sqr(x2-x1) + sqr(y2-y1));
	writeln('dlina premoi -> ', result:10:3);
end.