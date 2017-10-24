program lab10;

const
	length = 256;
var
	i,
	month
		: integer;
	keys: array[1..length] of string;
	sales: array[1..length] of longint;

function str2int(str: string): integer;
var
	code, 
	int
			: integer;
begin
	val(str, int, code);
	if code = 0 then
	str2int := int;
end;

function addKey(value: string): integer;
var
	i: integer = 1;
begin
	for i := 1 to length do begin
		if (keys[i] = '') or (keys[i] = value) then begin
			keys[i] := value;
			break;
		end;
	end;
	addKey := i;
end;

procedure parseFile(fileName: string);
var
	_file: file of char;
	_char: char;
	_string: string = '';
	counter: integer = 0;
	i: integer;
	sale: boolean = false;
begin
	assign(_file, 'file.txt');
	reset(_file);
	repeat
		read(_file, _char);
		if (_char = ' ') or (_char = chr(13)) then begin
			if counter = 0 then
				i := addKey(_string);
			if (counter = 1) and (str2int(_string) = month) then
				sale := true;
			if (counter = 2) and sale then
				sales[i] := sales[i] + str2int(_string); 
			_string := '';
			counter := counter + 1;
			if counter = 3 then begin
				counter := 0;
				sale := false;
			end;
		end else if _char <> chr(10) then
			_string := _string + _char;
	until eof(_file);

	if sale then
		sales[i] := sales[i] + str2int(_string);
	_string := '';
end;

begin
	write('месяц -> ');
	readln(month);
	parseFile('file.txt');
	for i := 1 to length do begin
		if keys[i] = '' then
			break;
		writeln(keys[i], ' -> ', sales[i]);
	end;	
end.