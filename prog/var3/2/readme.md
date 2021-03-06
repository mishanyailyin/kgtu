<div style="page-break-after:always; page-break-inside: avoid;">

## Лабораторная работа №2

### **Разработка линейной программы**

Цель работы: получение первичных навыков программирования (разработки простейших программ линейной структуры).

### Задание

Составить и отладить программу, обеспечивающую решение задачи, формулировка которой приведена ниже (вариант указывается преподавателем). При тестировании программы организовать минимум трехкратное исполнение её для разных исходных данных.

</div><div style="page-break-after:always; page-break-inside: avoid;">

### Текст программы:

```pascal
program lab2;
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

	result := sqrt(sqr(x2-x1) + sqr(y2-y1));
	writeln('Результат -> ', result:10:3);
end.
```

</div><div style="page-break-after:always; page-break-inside: avoid;">

### Окно вывода:

```pascal
x1 -> 1
y1 -> 10
x2 -> 10
y2 -> 1
Результат ->     12.728
```

</div><div style="page-break-inside: avoid;">

### Блок-схема программы:

```flow
st=>start: Начало
ed=>end: Конец

i=>inputoutput: Введи: x1, y1, x2, y2
o=>inputoutput: Вывод: result
calc=>operation: result = sqrt(sqr(x2-x1) + sqr(y2-y1))

st->i->calc->o->ed
```

</div>