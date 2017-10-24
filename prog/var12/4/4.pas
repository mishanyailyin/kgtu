program lab4;
var
	radiusFrom,
	radiusTo,
	radius,
	step,
	x,
	y,
	result
		: real;
begin
	write('введите радиус окружности ОТ и ДО: ');
	readln(radiusFrom, radiusTo);
	if (radiusFrom <= 0) or (radiusTo <= 0) then begin
		writeln('радиус должен быть больше нуля');
	end else if radiusFrom >= radiusTo then begin
		writeln('радиусОТ должен быть больше радиусаДО');
	end else begin
		write('введите координаты точки x y: ');
		readln(x, y);

		step := (radiusTo - radiusFrom) / 16;
		radius := radiusFrom;
		while (radius <= radiusTo) do begin
			result := abs(sqrt(sqr(x)+sqr(y)) - radius);
			write('расстояние от точки, до окружности равно: ', result:10:3, ' | ');
			if result > 0 then
				writeln('точка находится за окружностью')
			else if result = 0 then
				writeln('точка находится на окружности')
			else
				writeln('точка находится внутри окружности');
			radius += step;
		end;
	end;
end.