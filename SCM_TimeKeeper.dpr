program SCM_TimeKeeper;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTimeKeeper in 'frmTimeKeeper.pas' {TimeKeeper},
  dmSCM in 'dmSCM.pas' {SCM: TDataModule},
  dlgSCMOptions in 'dlgSCMOptions.pas' {scmOptions},
  dlgSCMStopWatch in 'dlgSCMStopWatch.pas' {scmStopWatch},
  exeinfo in '..\SCM_SHARED\exeinfo.pas',
  SCMSimpleConnect in '..\SCM_SHARED\SCMSimpleConnect.pas',
  SCMUtility in '..\SCM_SHARED\SCMUtility.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTimeKeeper, TimeKeeper);
  Application.Run;
end.
