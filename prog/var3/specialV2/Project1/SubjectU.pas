unit SubjectU;

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
    property sum: Integer read _sum;
    property count: Integer read _count;
    
    procedure addMark(mark: Integer);
    begin
      self._sum += mark;
      self._count += 1;
    end;
    
    function getMiddle(): Real;
    begin
      if count <> 0 then getMiddle := sum / count
      else getMiddle := 0;
    end;
    
    procedure print();
    begin
      writeln(name:16, ' ', sum:3);
    end;
  end;


end.
