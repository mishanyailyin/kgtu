program lab6;
const
	length = 8;
var
	max,
	i
		: integer;
	arr
		: array[1..length] of integer;
begin
	write('максимум -> ');
	readln(max);

	write('| ');
	for i := 1 to length do begin
		arr[i] := random(max);
		write(arr[i], ' | ');
	end;
end.