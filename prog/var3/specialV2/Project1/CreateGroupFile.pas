uses FileUtils;

begin
  writeln('Программа создание файла групп');
  readConsole('groups.txt', (f: Text; next: String)->begin f.writeln(next) end);
end.