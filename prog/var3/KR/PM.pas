unit PM;

type
  TablePM = class
    value: Dictionary<String, Real>;
    constructor Create(); begin
     self.value := new Dictionary<String, Real>();
    end;
  end;

end.