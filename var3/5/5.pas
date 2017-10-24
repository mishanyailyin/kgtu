program lab5;
var
	x1,
	y1,
	x2,
	y2
		: real;

function calcCoordDistance(x1, y1, x2, y2: real): real; begin
	calcCoordDistance := sqrt(
		sqr(x2-x1) + sqr(y2-y1)
	);
end;

begin
	write('x1 -> ');
	readln(x1);
	write('y1 -> ');
	readln(y1);

	write('x2 -> ');
	readln(x2);
	write('y2 -> ');
	readln(y2);

	writeln('result -> ', calcCoordDistance(x1, y1, x2, y2):10:3);
end.