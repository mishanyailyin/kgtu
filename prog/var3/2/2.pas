program lab2;
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

	result := sqrt(sqr(x2-x1) + sqr(y2-y1));
	writeln('Результат -> ', result:10:3);
end.