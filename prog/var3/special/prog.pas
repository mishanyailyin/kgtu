type
  Student = class
  private 
    _name: String;
    _subject0: Integer;
    _subject1: Integer;
    _subject2: Integer;
    _group: String;
  public 
    constructor(name: String; subject0: Integer; subject1: Integer; subject2: Integer; group: String);
    begin
      self._name := name;
      self._subject0 := subject0;
      self._subject1 := subject1;
      self._subject2 := subject2;
      self._group := group;
    end;
    
    property name: String read _name;
    property subject0: Integer read _subject0;
    property subject1: Integer read _subject1;
    property subject2: Integer read _subject2;
    property group: String read _group;
    
    function getMiddle(): Real;
    begin
      getMiddle := (subject0 + subject1 + subject2) / 3
    end;
    
    function getSum(): Integer;
    begin
      getSum := subject0 + subject1 + subject2
    end;
    
    function isBad(): Boolean;
    begin
      isBad := (subject0 <= 2) Or (subject1 <= 2) OR (subject2 <= 2)
    end;
    
    procedure print();
    begin
      writeln(name, ' ', group, ' ', getMiddle():3:2)
    end;
    
    procedure printSum();
    begin
      writeln(name, ' ', group, ' ', getSum())
    end;
  end;

type
  Subject = class
  private 
    _name: String;
    _count: Integer = 1;
    _sum: Integer = 0;
  public 
    constructor(name: String);
    begin
      self._name := name;
    end;
    
    property name: String read _name;
    property sum: Integer read _sum;
    property count: Integer read _count;
    
    procedure addMark(mark: Integer);
    begin
      self._sum += mark;
      self._count += 1;
    end;
    
    function getMiddle(): Real;
    begin
      getMiddle := sum / count;
    end;
    
    procedure print();
    begin
      writeln(name, ' ', getMiddle():3:2);
    end;
  end;

var
  subjects := new List<Subject>(3);
  students := new List<Student>();

procedure readConsole(onRead: function(str: String));
var
  flag := false;
  str: String;
begin
  writeln('Когда закончите ввод напишите "exit".');
  repeat
    readln(str);
    if str = 'exit' then flag := true
    else onRead(str)
  until flag;
end;

procedure readFile(fname: String; onRead: function(str: String))         ;
var
  str: String;
  f: Text;
begin
  assign(f, fname);
  reset(f);
  while not f.Eof do 
  begin
    readln(f, str);
    onRead(str);
  end;
end;

procedure parseString(str: String);
var
  name: String;
  subject0: Integer;
  subject1: Integer;
  subject2: Integer;
  group: String;
  arr: array of String;
begin
  arr := str.Split();
  if arr.Length = 5 then begin
    name := arr[0].ToString;
    subject0 := arr[1].ToInteger;
    subject1 := arr[2].ToInteger;
    subject2 := arr[3].ToInteger;
    group := arr[4].ToString;
    
    students.add(new Student(name, subject0, subject1, subject2, group));
    subjects.Item[0].addMark(subject0);
    subjects.Item[1].addMark(subject1);
    subjects.Item[2].addMark(subject2);
  end
end;

begin
  for var i := 0 to 2 do 
  begin
    write('Введите название предмета: ');
    subjects.Add(new Subject(readString()));
  end;
  writeln('Формат ввода "ИМЯ 5 5 5 ГРУППА"');
  
  var f := new Text();
  AssignFile(f, 'consoleRead.txt');
  rewrite(f);
  readConsole(
  (str: String) ->begin
    f.Writeln(str);
  end);
  f.Flush();
  f.Close();
  readFile('consoleRead.txt', parseString);
  
  writeln();
  writeln('Список учеников по сумме баллов:');
  if students.Count > 0 then begin
    students.Sort((o1, o2) -> -1 * o1.getSum().CompareTo(o2.getSum()));
    students.Foreach(it -> begin it.printSum(); end);
  end else
    writeln('Список пуст.');
  writeln();
  
  writeln('Список учеников по среднему баллу:');
  if students.Count > 0 then begin
    students.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
    students.Foreach(it -> begin it.print(); end);
  end else
    writeln('Список пуст.');
  writeln();
  
  writeln('Список двоешников:');
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
  writeln();
  
  writeln('Спиcок предметов:');
  if subjects.Count > 0 then begin
    subjects.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
    subjects.Foreach(it -> begin it.print(); end);
  end else
    writeln('Список пуст.');
  writeln();
end.