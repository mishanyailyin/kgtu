function str2int(str: string): integer;
var
	code, 
	int
			: integer;
begin
	val(str, int, code);
	if code = 0 then
	str2int := int;
end;

type Subject = class
  private
    _name: String;
    _count: Integer;
    _sum: Integer;
  public
    constructor Create(name: String); begin
      Self._name := name;
    end;
    
    property name: String read _name;
    property count: Integer read _count;
    property sum: Integer read _sum;
    
    procedure addScore(score: Integer); begin
      Self._count += 1;
      Self._sum += score;
    end;
    
    function getMiddle(): Real; begin
      result := _sum / _count 
    end;
end;

type Subjects = class
  private
    map: Dictionary<String, Subject>;
  public
    constructor Create(); begin
      map := new Dictionary<string, Subject>;
    end;
    function add(name: String): Subject; begin
      if not Self.map.containsKey(name) then
        Self.map.add(name, new Subject(name));
      result := Self.map.get(name);
    end;
    function get(name: String): Subject; begin
      result := Self.map.get(name);
    end;
end;

function validGroup(group: String): boolean; begin
  var
    groups: array of String = ('17-BT-1', '17-BT-2');
  begin
    result := groups.find(str -> str = group) <> nil
  end;
end;
type Student = class
  private
    _name: String;
    _count: Integer;
    _sum: Integer;
    _group: String;
    _groups: array of String = ('17-BT-1', '17-BT-2');
    _bad: boolean;
  public
    constructor Create(name: String; group: String); begin
      Self._name := name;
      Self._group := group;
    end;
    
    property name: String read _name;
    property count: Integer read _count;
    property sum: Integer read _sum;
    property group: String read _group;
    property bad: boolean read _bad write _bad;
    
    procedure addScore(score: Integer); begin
      Self._count += 1;
      Self._sum += score;
      if (score = 2) or (score = 1) then
        Self._bad := true
    end;
    
    function getMiddle(): Real; begin
      result := _sum / _count 
    end;
end;

type Students = class
  private
    map: Dictionary<String, Student>;
  public
    constructor Create(); begin
      map := new Dictionary<string, Student>;
    end;
    function add(name: String; group: String): Student; begin
      if not Self.map.containsKey(name) then
        Self.map.add(name, new Student(name, group));
      result := Self.map.get(name);
    end;
    function get(name: String): Student; begin
      result := Self.map.get(name);
    end;
end;

procedure parseString(str: string; studs: Students; subjs: Subjects);
var
	splited: array of string;
	_student: Student;
begin
	splited := str.split(' ');
	if validGroup(splited[4]) then begin
	  _student := studs.add(splited[0], splited[4]);
	  
	  _student.addScore(str2int(splited[1]));
    _student.addScore(str2int(splited[2]));
    _student.addScore(str2int(splited[3]));
    
    subjs.get('Информатика').addScore(str2int(splited[1]));
    subjs.get('Физика').addScore(str2int(splited[2]));
    subjs.get('История').addScore(str2int(splited[3]));
	end else begin
	  writeln('Нет такой группы -> ', str);
	end;
end;

procedure parseFile(fileName: string; studs: Students; subjs: Subjects);
var
	_file: Text;
	str: string;
begin
	assign(_file, fileName);
	reset(_file);
	repeat
		readln(_file, str);
		writeln(str);
		parseString(str, studs, subjs);
	until eof(_file);
end;

procedure printStudentsMiddle(studs: Students); begin
  var
    arr: array of Student;
   begin
    setLength(arr, studs.map.Count);
    for var i: integer := 0 to studs.map.Count - 1 do begin
        arr[i] := studs.map.Values.ElementAt(i);
      end;
    end;
    writeln('Список лучших учеников (по среднему баллу):');
    arr.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
    arr.ForEach(it -> writeln(it.name, ' ', it.getMiddle():3:2));
end;

procedure printStudentsMax(studs: Students); begin
  var
    arr: array of Student;
   begin
    setLength(arr, studs.map.Count);
    for var i: integer := 0 to studs.map.Count - 1 do begin
        arr[i] := studs.map.Values.ElementAt(i);
      end;
    end;
    writeln('Список лучших учеников (по сумме баллов):');
    arr.Sort((o1, o2) -> -1 * o1.sum.CompareTo(o2.sum));
    arr.ForEach(it -> writeln(it.name, ' ', it.sum));
end;

procedure printBadStudents(studs: Students); begin
  var
    arr: array of Student;
   begin
    setLength(arr, studs.map.Count);
    for var i: integer := 0 to studs.map.Count - 1 do begin
        arr[i] := studs.map.Values.ElementAt(i);
      end;
    end;
    writeln('Список двоешников:');
    arr.ForEach(it -> if it.bad then writeln(it.name));
end;

procedure pringSubjects(subjs: Subjects); begin
  var
    arr: array of Subject;
   begin
    setLength(arr, subjs.map.Count);
    for var i: integer := 0 to subjs.map.Count - 1 do begin
        arr[i] := subjs.map.Values.ElementAt(i);
      end;
    end;
    writeln('Список лучших предметов (по среднему баллу учеников):');
    arr.Sort((o1, o2) -> -1 * o1.getMiddle().CompareTo(o2.getMiddle()));
    arr.ForEach(it -> writeln(it.name, ' ', it.getMiddle():3:2));
end;

var
  studs := new Students();
  subjs := new Subjects();
  
begin
  subjs.add('Информатика');
  subjs.add('Физика');
  subjs.add('История');
  
  parseFile('input.txt', studs, subjs);
  
  writeln;
  printStudentsMax(studs);
  writeln;
  printStudentsMiddle(studs);
  writeln;
  printBadStudents(studs);
  writeln;
  pringSubjects(subjs);
end.