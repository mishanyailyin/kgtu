program lab7;

var
	max,
	size,
	find,
	x,
	y
		: integer;
	matrix: array[1..256, 1..256] of integer;
	validCols: array[1..256] of boolean;
begin
	write('size -> ');
	readln(size);
	if(size > 256) then begin
			writeln('--ERROR--');
			writeln('size должен быть меньше чем 256');
			writeln('---------');
			exit;
	end;

	write('max -> ');
	readln(max);
	if(max > 32767) then begin
			writeln('--ERROR--');
			writeln('max должен быть меньше чем 32767');
			writeln('---------');
			exit;
	end;

	write('find -> ');
	readln(find);
	if(find > 32767) then begin
			writeln('--ERROR--');
			writeln('find должен быть меньше чем 32767');
			writeln('---------');
			exit;
	end;


	for x := 1 to size do
		for y := 1 to size do
			matrix[x][y] := random(max);
	
	for x := 1 to size do begin
		for y := 1 to size do begin
			write(matrix[y][x]:5, ' ');
			if(matrix[x][y] = find) then
				validCols[x] := true;
		end;
		writeln();
	end;

	for x := 1 to size do
		writeln(x, ' -> ', validCols[x])
end.