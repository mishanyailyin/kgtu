uses FileUtils;

begin
  writeln('��������� �������� ����� ���������');
  readConsole('subjects.txt', (f: Text; next: String)->begin f.writeln(next) end);
end.