program lab1;
var
	a,
	b,
	s
		: real;
begin
	write('a -> ');
	readln(a);
	write('b -> ');
	readln(b);

	s := a * b;
	writeln('s -> ', s:10:3);
end.