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
	end else 
		begin
		write('введите координаты точки x y: ');
		readln(x, y);
		
		writeln('┌──────┬───────────────────────────┬───────────────┐');
		writeln('│Радиус│Расстояние от точки до окр.│Положение точки│');
		writeln('├──────┴───────────────────────────┼───────────────┤');
		
	        step := (radiusTo - radiusFrom) / 16;
		radius := radiusFrom;
		
		while (radius <= radiusTo) do 
			begin
			write('│'. radius:10:3,     '│');
			
			result := abs(sqrt(sqr(x)+sqr(y)) - radius);
			
			write('result:10:3, ' | ');
			
			if result > 0 then 
				writeln('За окружностью│')
			else if result = 0 then
				writeln('На окружности│')
			else
				writeln('Внутри окружности');
			radius += step;
		end;
	end;
end.
