program lab4;
var
	x1,
	y1
		: real;

	x2,
	y2,
	y2From,
	y2To
		: real;

	step
		: real;

	result
		: boolean;
	_string: string;

begin
	write('x1 -> ');
	readln(x1);
	write('y1 -> ');
	readln(y1);

	write('x2 -> ');
	readln(x2);
	write('y2From -> ');
	readln(y2From);
	write('y2To -> ');
	readln(y2To);
	if(y2From > y2To) then begin
			writeln('--ERROR--');
			writeln('y2From должен быть больше чем y2To');
			writeln('---------');
			exit;
	end;

	step := (y2To - y2From) / 16;

	writeln('| ','----y2----',' | ','--проходит через начало координат?--',' |');

	y2 := y2From;
	while (y2 <= y2To) do begin
		result := (x1*y2-x2*y1) = 0;
		if result then
			_string := 'проходит через начало координат'
		else
			_string := 'не проходит через начало координатt';
		writeln('| ',y2:10:3,' | ',_string:37,' |');
		y2 += step;
	end;

	writeln('| ','----------',' | ','-------------------------------------',' |');
end.