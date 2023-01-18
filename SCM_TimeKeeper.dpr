program SCM_TimeKeeper;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTimeKeeper in 'frmTimeKeeper.pas' {TimeKeeper},
  dmSCM in 'dmSCM.pas' {SCM: TDataModule},
  dlgSCMOptions in 'dlgSCMOptions.pas' {scmOptions},
  dlgSCMStopWatch in 'dlgSCMStopWatch.pas' {scmStopWatch};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTimeKeeper, TimeKeeper);
  Application.Run;
end.
