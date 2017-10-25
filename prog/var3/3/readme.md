<div style="page-break-after:always; page-break-inside: avoid;">

## Лабораторная работа №3

### Разработка разветвляющей программы

Цель работы: получение практических навыков при алгоритмизации и программировании разветвляющихся процессов обработки данных (использования структур выбора в программах)

### Задание

Модифицировать полученную при выполнении предыдущей работы программу таким образом, чтобы при решении задачи на компьютере обеспечивалась при необходимости проверка вводимых исходных данных на допустимость - соответствие области определения, а также (в соответствии с предыдущим  вариантом задачи)

</div><div style="page-break-after:always; page-break-inside: avoid;">

### Текст программы:

```pascal
program lab3;
var
	x1,
	y1,
	x2,
	y2,
	result
		: real;

begin
	write('x1 -> ');
	readln(x1);
	write('y1 -> ');
	readln(y1);

	write('x2 -> ');
	readln(x2);
	write('y2 -> ');
	readln(y2);

	if(x1 = x2) and (y1 = y2) then begin
			writeln('--ОШИБКА--');
			writeln('[x1 : y1] не должен быть равен [x2 : y2]');
			writeln('---------');
			exit;
	end;

	if (x1*y2-x2*y1) = 0 then
		writeln('Проходит через начало координат')
	else
		writeln('Не проходит через начало координат');
	result := sqrt(sqr(x2-x1) + sqr(y2-y1));
	writeln('длина прямой -> ', result:10:3);
end.
```

</div><div style="page-break-after:always; page-break-inside: avoid;">

### Окно вывода:

```pascal
x1 -> 1
y1 -> 2
x2 -> 3
y2 -> 4
Не проходит через начало координат
Длина прямой ->      2.828
```

</div><div style="page-break-inside: avoid;">

### Блок-схема программы:

```flow
st=>start: Начало
ed=>end: Конец

i=>inputoutput: Введи: x1, y1, x2, y2
oT=>inputoutput: Проходит через начало координат
oF=>inputoutput: Не проходит через начало координат
validate=>condition: (x1=x2) AND (y1=y2)
cond=>condition: (x1*y2-x2*y1) = 0

st->i->validate
validate(no)->ed
validate(yes)->cond
cond(no)->oF->ed
cond(yes)->oT->ed
```

</div>