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
    
    function toString(): String; override;
    begin
      toString := name + ' ' + subject0 + ' ' + subject1 + ' ' + subject2 + ' ' + group;
    end;
  end;

type
  Subject = class
  private 
    _name: String;
    _count: Integer = 0;
    _sum: Integer = 0;
  public 
    constructor(name: String);
    begin
      self._name := name;
    end;
    
    property name: String read _name;
    
    procedure addMark(mark: Integer);
    begin
      self._sum += mark;
      self._count += 1;
    end;
    
    function getMiddle(): Real;
    begin
      getMiddle := self._sum / self._count;
    end;
    
    function toString(): String; override;
    begin
      toString := name + ' ' + getMiddle().ToString;
    end;
  end;

var
  subjects := new List<Subject>(3);
  students := new List<Student>();

procedure readConsole(onRead: function(str: String)) ;
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
  end else
    writeln('Входная строка имела неверный формат.');
end;

begin
  for var i := 0 to 2 do 
  begin
    write('Введите название предмета: ');
    subjects.Add(new Subject(readString()));
  end;
  writeln('Формат ввода "ИМЯ 5 5 5 ГРУППА"');
  readConsole(parseString);
  
  writeln('Спиок предметов:');
  subjects.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
  subjects.Foreach(it -> writeln(it));
end.