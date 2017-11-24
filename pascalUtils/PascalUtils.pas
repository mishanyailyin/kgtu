// Collections

function listOf<T>(params args: array of T): List<T> := new List<T>(args); 
function arrayOf<T>(params args: array of T): array of T := args; 

function isEmpty(self: sequence of object): Boolean := self.Count <= 0;
function isNotEmpty(self: sequence of object): Boolean := self.Count > 0;

function kForEach<T>(self: sequence of T; action: T -> ()): sequence of T;
extensionmethod;
begin
  self.ForEach(action);
  result := self;
end;
function kForEachIndexed<T>(self: sequence of T; action: (T,Integer) -> ()): sequence of T;
extensionmethod;
begin
  self.ForEach(action);
  result := self;
end;

function filter<T>(self: sequence of T; predicate: T -> Boolean): sequence of T := self.Where(predicate);
function filterIndexed<T>(self: sequence of T; predicate: (T, Integer) -> Boolean): sequence of T := self.Where(predicate);

begin
  listOf(1, 2, 3 ).Count
end.