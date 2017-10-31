```flow
st=>start: Начало
ed=>end: Конец

i=>inputoutput: Введите значение A, C, B0, Bk
a1=>operation: b := b0
a2=>operation: h := (bk-b0)/16
loop=>condition: B<=Bk
c1=>condition: (a=0) AND (b=0)
a3=>operation: R := C/sqrt(sqr(A)+sqr(B))
c2=>condition: A=0
c3=>condition: B=0
o1=>inputoutput: Деление на 0 невозможно
o2=>inputoutput: Прямая параллельна оси X
o3=>inputoutput: Прямая параллельна оси Y
o4=>inputoutput: Прямая не параллельна ни одной оси
a4=>operation: b:=b+h

st->i->a1->a2->loop
loop(yes)->c1
c1(yes)->o1->a4
c1(no)->a3(right)->c2->a4
c2(yes)->o2->a4
c2(no)->c3->a4
c3(yes)->o3->a4
c3(no)->o4->a4
a4(left)->loop
loop(no, left)->ed
```

