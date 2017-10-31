```flow
st=>start: Начало
ed=>end: Конец

arrInput=>subroutine: Ввод массива целых чисел
arrOutput=>subroutine: Вывод массива целых чисел

a1=>operation: xMax:=abs(arr[1])
loop=>condition: 2 to n
cond=>condition: abs(arr[i]) > xMax
a2=>operation: xMax:=arr[i]
a3=>operation: m:=i
o=>inputoutput: Номер наибольшего 
чиста по абсолютному 
значению элемента=m

st->arrInput(right)->arrOutput->a1->loop
loop(yes)->cond
cond(yes)->a2(right)->a3(right)->loop
cond(no, bottom)->o->ed
```

