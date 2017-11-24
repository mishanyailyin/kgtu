unit Types;

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
    marks: array[0..4] of 0..9;
    group: Integer;
  end;

const
  fileOfGroupsName: String = 'data/groups.dat';
  fileOfSubjectsName: String = 'data/subjecs.dat';
  fileOfStudentsName: String = 'data/students.dat';

end.