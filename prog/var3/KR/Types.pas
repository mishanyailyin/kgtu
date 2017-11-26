unit Types;

type Arr = array [0..4] of integer;

type
  GroupType = record
  public 
    name: String[32];
    constructor Create(name: String);
    begin
      self.name := name;
    end;
  end;

type
  SubjectType = record
  public 
    name: String[32];
    constructor Create(name: String);
    begin
      self.name := name;
    end;
  end;

type
  StudentType = record
  public 
    name: String[32];
    marks: Arr;
    group: Integer;
  end;

end.