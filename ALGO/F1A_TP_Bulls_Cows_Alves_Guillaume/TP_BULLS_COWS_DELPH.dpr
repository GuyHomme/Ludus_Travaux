program TP_BULLS_COWS_DELPH;

uses
  Vcl.Forms,
  TP_BULLS_COWS_PAS in 'TP_BULLS_COWS_PAS.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
