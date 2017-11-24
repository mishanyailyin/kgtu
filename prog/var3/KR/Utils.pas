unit Utils;
// Collections

function listOf<T>(params args: array of T): List<T> := new List<T>(args); 

function arrayOf<T>(params args: array of T): array of T := args; 

function isEmpty(self: sequence of object): Boolean := self.Count <= 0;

function isNotEmpty(self: sequence of object): Boolean := self.Count > 0;

function mForEach<T>(self: sequence of T; action: T -> ()): sequence of T;
extensionmethod;
begin
  self.ForEach(action);
  result := self;
end;

function mForEachIndexed<T>(self: sequence of T; action: (T,Integer) -> ()): sequence of T;
extensionmethod;
begin
  self.ForEach(action);
  result := self;
end;

function filter<T>(self: sequence of T; predicate: T-> Boolean): sequence of T := self.Where(predicate);

function filterIndexed<T>(self: sequence of T; predicate: (T, Integer) -> Boolean): sequence of T := self.Where(predicate);

function map<T1, T2>(self: sequence of T1; transform: T1 -> T2): sequence of T2;
extensionmethod;
var map := new List<T2>(); 
begin
  foreach it: T1 in Self do
    map.Add(transform(it));
  result := map;
end;
end.