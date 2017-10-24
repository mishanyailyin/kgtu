program lab9;

var
	answer: string;

begin
	{ Укажите имя стандартной процедуры чтения данных в Турбо-Паскале }
	write('answer -> ');
	readln(answer);

	if (answer = 'read') or (answer = 'read()') or (answer = 'readln') or (answer = 'readln()') then
		writeln('true')
	else
		writeln('false');
end.