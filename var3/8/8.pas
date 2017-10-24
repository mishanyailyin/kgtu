program lab8;

var
	_file: file of char;
	_string: char;
	counter: integer = 1;
begin
	assign(_file, 'file.txt');
	reset(_file);
	while not eof(_file) do begin
		read(_file, _string);
		if(_string = ' ') then
			counter := counter + 1;
	end;
	writeln('Counted -> ', counter);
end.