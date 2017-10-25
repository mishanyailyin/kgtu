```flow
st=>start: Начало
ed=>end: Конец

consoleInput=>inputoutput: Введите запись, 
формата ФИО 5 5 5 ГРУППА
consoleInputLoop=>condition: Введеная запись 
равна 'exit'?
consoleAction=>subroutine: Запись в файл 
введенной записи

fileReadLoop=>condition: Пустая строка?
parseString=>subroutine: Чтение строки 
из файла
fileReadParseString=>subroutine: Разбор строки 
в массив строк

parseStringStudent=>subroutine: Сохранить информацию 
о студенте из массива
parseStringSubject=>subroutine: Сохранить информацию 
о предмете из массива

sortStudentsMax=>subroutine: Сортировка студентов, 
по сумме баллов
sortOutputStudentsMax=>inputoutput: Вывод студентов
sortStudentsMid=>subroutine: Сортировка студентов, 
по среднему баллу
sortOutputStudentsMid=>inputoutput: Вывод студентов
sortSubjectsMid=>subroutine: Сортировка предметов, 
по среднему баллу
sortOutputSubjectsMid=>inputoutput: Вывод предметов

st(right)->consoleInput->consoleInputLoop
consoleInputLoop(no, right)->consoleAction(right)->consoleInput
consoleInputLoop(yes, bottom)->parseString->fileReadLoop
fileReadLoop(no)->fileReadParseString->parseStringStudent->parseStringSubject(right)->parseString
fileReadLoop(yes)->sortStudentsMax->sortOutputStudentsMax->sortStudentsMid->sortOutputStudentsMid->sortSubjectsMid->sortOutputSubjectsMid->ed
```

