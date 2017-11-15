unit StudentU;

type
  Student = class
  private 
    _name: String;
    _subjects: List<Integer>;
    _group: String;
  public 
    constructor(name: String; subjects: List<Integer>; group: String);
    begin
      self._name := name;
      self._subjects := subjects;
      self._group := group;
    end;
    
    property name: String read _name;
    property subjects: List<Integer> read _subjects;
    property group: String read _group;
    
    function getSum(): Integer;
    begin
      var sum: Integer = 0;
      subjects.foreach((it: Integer)->begin sum := sum + it end);
      getSum := sum;
    end;
    
    function getMiddle(): Real;
    begin
      getMiddle := getSum() / (subjects.capacity - 1);
    end;
    
    function isBad(): Boolean;
    begin
      var flag: Boolean = false;
      subjects.foreach((it: Integer)->begin
        if it <= 2 then
          flag := true;
      end);
      isBad := flag;
    end;
    
    procedure print();
    begin
      writeln(name:16, ' ', group:16, ' ', getMiddle():4:2)
    end;
    
    procedure printSum();
    begin
      writeln(name:16, ' ', group:16, ' ', getSum():3)
    end;
  end;


end.
