uses FileUtils;

begin
  writeln('��������� �������� ����� �����');
  readConsole('groups.txt', (f: Text; next: String)->begin f.writeln(next) end);
end.