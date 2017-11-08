uses FileUtils;

var
  subjectCounter: Integer = 0;
  format := 'ФИО ';
  i: Integer;
  groups: List<String> = new List<String>();

begin
  writeln('Программа создание файла студентов');
  readFile('subjects.txt', (next: String)-> begin subjectCounter += 1 end);
  readFile('groups.txt', (next: String)->begin groups.add(next) end);
  
  for i := 1 to subjectCounter do 
  begin
    format += '5 ';
  end;
  format += 'Группа';
  writeln(format);
 
  readConsole('students.txt', (f: Text; next: String)->begin
    var arr := next.split();
    if arr.length = subjectCounter + 2 then
      if groups.contains(arr[1 + subjectCounter]) then
        f.writeln(next)
      else writeln('Нет такой группы')
    else writeln('Не верный формат записи');
  end);
end.