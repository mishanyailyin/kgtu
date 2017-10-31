```flow
st=>start: Начало
ed=>end: Конец

split=>subroutine: Разбор строки на массив arr
valid=>condition: arr.length = 5
name=>operation: name := arr[0].toString
subject0=>operation: subject0 := arr[1].toInteger
subject1=>operation: subject1 := arr[2].toInteger
subject2=>operation: subject2 := arr[3].toInteger
group=>operation: group := arr[4].toString
createStudent=>subroutine: Создать студента 
и добавить его в лист
saveSubject0=>subroutine: Добавить оценку 
студента к subject0
saveSubject1=>subroutine: Добавить оценку 
студента к subject1
saveSubject2=>subroutine: Добавить оценку 
студента к subject2

st->split->valid
valid(no)->ed
valid(yes)->name->subject0->subject1->subject2->group->createStudent->saveSubject0->saveSubject1->saveSubject2->ed
```

