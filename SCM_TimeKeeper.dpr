program SCM_TimeKeeper;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTimeKeeper in 'frmTimeKeeper.pas' {TimeKeeper},
  dmSCM in 'dmSCM.pas' {SCM: TDataModule},
  exeinfo in '..\SCM_SHARED\exeinfo.pas',
  SCMSimpleConnect in '..\SCM_SHARED\SCMSimpleConnect.pas',
  SCMUtility in '..\SCM_SHARED\SCMUtility.pas',
  ProgramSetting in 'ProgramSetting.pas',
  XSuperJSON in '..\x-superobject\XSuperJSON.pas',
  XSuperObject in '..\x-superobject\XSuperObject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTimeKeeper, TimeKeeper);
  Application.Run;
end.
