```flow
st=>start: Начало
ed=>end: Конец

i=>inputoutput: Введите A, B, C
cond1=>condition: (a=0) AND (b=0)
a1=>operation: f:=true
a2=>operation: f:=false
a3=>operation: R:=C/sqrt(A*A+B*B)
cond2=>condition: f=true
o1=>inputoutput: Расстояние=r
o2=>inputoutput: Введены неверные данные

st->i->a1->cond1
cond1(yes)->a2->cond2
cond1(no)->a3->cond2
cond2(yes)->o1->ed
cond2(no)->o2->ed
```

