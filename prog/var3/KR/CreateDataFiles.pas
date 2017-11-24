uses Utils;
uses Types;

function createStudent(mName: String): StudentType; 
var a :StudentType = (name: mName; marks: (random(3, 5), random(3, 5), random(3, 5), random(3, 5), random(3, 5)); group: random(1, 2));
begin  
  result := a;
end;

begin
  var fileOfGroups: file of GroupType;
  assign(fileOfGroups, fileOfGroupsName);
  rewrite(fileOfGroups);
  
  arrayOf('17-��-1', '17-��-2')
   .map(it -> new GroupType(it))
   .forEach(it -> fileOfGroups.Write(it));
  fileOfGroups.Close();
  
  var fileOfSubjects: file of SubjectType;
  assign(fileOfSubjects, fileOfSubjectsName);
  rewrite(fileOfSubjects);
  
  arrayOf('�����������', '������� ����', '�������', '������', '���������� ����')
   .map(it -> new SubjectType(it))
   .forEach(it -> fileOfSubjects.Write(it));
  fileOfSubjects.Close();
  
  var fileOfStudents: file of StudentType;
  assign(fileOfStudents, fileOfStudentsName);
  rewrite(fileOfStudents);
  arrayOf('���� �. �.', '���� �. �.', '����� �. �', '��������� �. �.', '�������� �. �.')
  .map(it -> createStudent(it))
  .forEach(it -> fileOfStudents.Write(it));
  fileOfStudents.Close();
end.