unit Interactors;

uses Utils;
uses Types;
uses PM;

type
  StudentInteractor = class
    function create(students: sequence of StudentType; groups: sequence of GroupType; validGroup: String): TablePM;
    begin
      var validGroupIndex: Integer;
      var data: TablePM = new TablePM();
      validGroupIndex := groups.findIndex(it -> it.name = validGroup);
      students.filter(it -> it.group = validGroupIndex).mForEach(it -> data.value.add(it.name, it.marks.toSequence().average()));
      result := data;
    end;
  end;

type
  SubjectInteractor = class
    function create(students: sequence of StudentType; subjects: sequence of SubjectType; groups: sequence of GroupType; validGroup: String): TablePM;
    begin
      var validGroupIndex: Integer;
      var data: TablePM = new TablePM();
      var subjectsAverage := new List<Real>();
      validGroupIndex := groups.findIndex(it -> it.name = validGroup);
      students.filter(it -> it.group = validGroupIndex).mForEach(it -> begin it.marks.toSequence().mForEachIndexed((mark, index) -> begin subjectsAverage.Item[index] := subjectsAverage.Item[index] + mark end); end);
      students.mForEachIndexed((it, index) -> begin data.value.add(it.name, subjectsAverage.Item[index]) end);
      result := data;
    end;
  end;

const
  fileOfGroupsName: String = 'data/groups.dat';
  fileOfSubjectsName: String = 'data/subjecs.dat';
  fileOfStudentsName: String = 'data/students.dat';

type
  FileInteractor = class
  private 
    fileOfGroups: file of GroupType;
    fileOfSubjects: file of SubjectType;
    fileOfStudents: file of StudentType;
    function getFile<T>(mFile: file of T; fileName: String; mReset: Boolean): file of T;
    begin
      assign(mFile, fileName);
      if mReset then rewrite(mFile)
      else reset(mFile);
      result := mFile;
    end;
  
  public 
    function getFileOfGroups(reset: Boolean): file of GroupType;
    begin
      result := getFIle(fileOfGroups, fileOfGroupsName, reset);
    end;
    
    function getFileOfSubjects(reset: Boolean): file of SubjectType;
    begin
      result := getFIle(fileOfSubjects, fileOfSubjectsName, reset);
    end;
    
    function getFileOfStudents(reset: Boolean): file of StudentType;
    begin
      result := getFIle(fileOfStudents, fileOfStudentsName, reset);
    end;
  
  end;

end.