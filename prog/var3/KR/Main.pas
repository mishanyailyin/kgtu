uses Utils;
uses Types;
uses PM;
uses Interactors;

begin
  var fileOfGroups: file of GroupType;
  assign(fileOfGroups, fileOfGroupsName);
  reset(fileOfGroups);
  
  var fileOfSubjects: file of SubjectType;
  assign(fileOfSubjects, fileOfSubjectsName);
  reset(fileOfSubjects);
  
  var fileOfStudents: file of StudentType;
  assign(fileOfStudents, fileOfStudentsName);
  reset(fileOfStudents);
  
  
end.