unit FileUtils;

procedure handleFileError(f: Text; err: String);
begin
  writeln(err);
  halt;
end;

procedure readConsole(fileName: String; onNext: function(f: text; next: String));
var
  flag := true; 
  next: String;
  f: Text;
begin
  writeln('Когда закончите ввод напишите "exit"');
  f := new Text();
  assign(f, filename);
  rewrite(f);
  while flag do 
  begin
    next := readString();
    flag := flag AND (next <> 'exit');
    if flag then
      onNext(f, next);
  end;
  f.Flush();
end;

procedure readFile(fileName: String; onNext: function(next: String));
var
  f: Text;
begin
  if FileExists(fileName) then begin
    f := new Text();
    assign(f, filename);
    reset(f);
    if not f.Eof then
      while not f.Eof do
        onNext(f.ReadString())
    else begin
      handleFileError(f, 'Заполните файл: ' + filename);  
      f.Close();
    end;
  end else handleFileError(f, 'Создайте файл: ' + filename);
  f.Close();
end;

end.