uses FileUtils;

begin
  writeln('Программа создание файла предметов');
  readConsole('subjects.txt', (f: Text; next: String)->begin f.writeln(next) end);
end.