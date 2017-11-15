uses FileUtils;
uses StudentU;
uses SubjectU;

var
  students: List<Student> = new List<Student>();
  subjects: List<Subject> = new List<Subject>();
  subjectsCounter: Integer = 0;

procedure printSubjects(subjects: List<Subject>);
begin
  writeln();
  writeln('Список предметов, отсортированный по сумме баллов: ');
  subjects.Sort((o1, o2) -> -1 * o1.sum.CompareTo(o2.sum));
  subjects.foreach((it: Subject)->begin it.print() end);
end;

procedure printStudentsMiddle(students: List<Student>);
begin
  writeln();
  writeln('Список студентов, отсортированных по среднему баллу: ');
  students.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
  students.Foreach(it -> begin it.print(); end);
end;

procedure printStudentsBad(students: List<Student>);
begin
  writeln();
  writeln('Список двоечников: ');
  students.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
  var isBad := true;
  students.Foreach(
  it -> begin
    if it.isBad() then begin
    it.print();
    isBad := false;
    end;
  end);
  if isBad then
    writeln('Список пуст.');
end;

begin
  writeln('Программа расчета успеваемости студентов');
  readFile('subjects.txt', (next: String)->begin
      subjects.add(new Subject(next));
      subjectsCounter := subjectsCounter + 1;
  end);
  readFile('students.txt', (next: String)->begin
      var subjectMarks: List<Integer> = new List<Integer>();
      var arr := next.split();
      var name := arr[0];
      for var i := 1 to subjectsCounter do 
      begin
        var mark := arr[i].toInteger;
        subjectMarks.add(mark);
        subjects.Item[i - 1].addMark(mark);
      end;
      students.add(new Student(name, subjectMarks, arr[arr.length - 1]));
   end);
  
  printSubjects(subjects);
  printStudentsMiddle(students);
  printStudentsBad(students);
end.