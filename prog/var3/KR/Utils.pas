unit Utils;
uses Types;
// Collections

procedure print<T>(self: T); 
extensionmethod;
begin
  print(self);
end;

function listOf<T>(params args: array of T): List<T> := new List<T>(args); 

function arrayOf<T>(params args: array of T): array of T := args; 

function isEmpty(self: sequence of object): Boolean; 
extensionmethod;
begin
  result := self.Count <= 0;
end;

function isNotEmpty(self: sequence of object): Boolean;
extensionmethod;
begin
  result := self.Count >= 0;
end;

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

function filter<T>(self: sequence of T; predicate: T-> Boolean): sequence of T;
extensionmethod;
begin
  result := self.Where(predicate);
end;

function filterIndexed<T>(self: sequence of T; predicate: (T, Integer) -> Boolean): sequence of T;
extensionmethod;
begin
  result := self.Where(predicate);
end;

function findIndex<T>(self: sequence of T; predicate: T-> Boolean): Integer;
extensionmethod;
begin
  var list := self.ToList();
  for var i := 0 to list.Count do
    if predicate(list.Item[i]) then
      result := i;
  result := -1;
end;

function map<T1, T2>(self: sequence of T1; transform: T1-> T2): sequence of T2;
extensionmethod;
var
  map := new List<T2>();
begin
  foreach it: T1 in Self do
    map.Add(transform(it));
  result := map;
end;

function average(self: sequence of Integer): Real;
extensionmethod;
begin
  result := self.ToList().average();
end;

function toSequence(self: Arr): sequence of Integer;
extensionmethod;
begin
  var list := new List<Integer>();
  for var i:= Low(self) to High(self) do
    list.Add(self[i]);
end;

end.