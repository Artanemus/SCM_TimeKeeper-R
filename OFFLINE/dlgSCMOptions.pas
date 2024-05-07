unit dlgSCMOptions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.Controls.Presentation,
  FMX.Layouts, dmSCM;

type
  TscmOptions = class(TForm)
    Layout2: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    chkEnableStickyLane: TCheckBox;
    Layout6: TLayout;
    Label2: TLabel;
    spinbtnStickyLane: TSpinBox;
    Layout7: TLayout;
    chkUseSuperGlue: TCheckBox;
    Layout1: TLayout;
    chkEnableAutoRefresh: TCheckBox;
    Layout8: TLayout;
    Line1: TLine;
    Layout10: TLayout;
    chkEnableStopwatchServerPost: TCheckBox;
    Layout9: TLayout;
    chkHideClosedSessions: TCheckBox;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    btnClose: TButton;
    StyleBook2: TStyleBook;
    Layout11: TLayout;
    chkEnableReturnKeyType: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  scmOptions: TscmOptions;

implementation

{$R *.fmx}

uses
  System.IniFiles, System.IOUtils, System.Math;

procedure TscmOptions.btnCloseClick(Sender: TObject);
var
  ini: TIniFile;
  Section: String;
begin
  Section := 'TimeKeeperOptions';
  ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + 'SCMConfig.ini');
  try
    ini.WriteBool(Section, 'EnableStickyLane', chkEnableStickyLane.IsChecked);
    // Double value to integer ...
    ini.WriteInteger(Section, 'StickyLane', Floor(spinbtnStickyLane.Value));
    ini.WriteBool(Section, 'EnableSuperGlue', chkUseSuperGlue.IsChecked);
    ini.WriteBool(Section, 'EnableAutoReFresh', chkEnableAutoRefresh.IsChecked);
    ini.WriteBool(Section, 'EnableStopwatchServerPost',
      chkEnableStopwatchServerPost.IsChecked);
    ini.WriteBool(Section, 'EnableReturnKeyType',
      chkEnableReturnKeyType.IsChecked);
    ini.WriteBool(Section, 'HideClosedSessions',
      chkHideClosedSessions.IsChecked);

  finally
    ini.Free;
  end;

  ModalResult := mrOk;
  Close();
end;

procedure TscmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TscmOptions.FormCreate(Sender: TObject);
var
  ini: TIniFile;
  Section: String;
  NumOfLanes: integer;

begin
  Section := 'TimeKeeperOptions';
  ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + 'SCMConfig.ini');

  try
    begin
      chkEnableStickyLane.IsChecked :=
        ini.ReadBool(Section, 'EnableStickyLane', false);
      spinbtnStickyLane.Value := ini.ReadInteger(Section, 'StickyLane', 1);
      chkUseSuperGlue.IsChecked := ini.ReadBool(Section,
        'EnableSuperGlue', false);
      chkEnableAutoRefresh.IsChecked :=
        ini.ReadBool(Section, 'EnableAutoReFresh', false);
      chkEnableStopwatchServerPost.IsChecked :=
        ini.ReadBool(Section, 'EnableStopwatchServerPost', false);
      chkEnableReturnKeyType.IsChecked :=
        ini.ReadBool(Section, 'EnableReturnKeyType', false);
      chkHideClosedSessions.IsChecked :=
        ini.ReadBool(Section, 'HideClosedSessions', true);
    end
  finally
    ini.Free;
  end;

  // Does StickyLane exceeds the max number of lanes for the pool
  if (Assigned(SCM) and SCM.IsActive) then
    try
      begin
        NumOfLanes := SCM.tblSwimClub.FieldByName('NumOfLanes').AsInteger;
        if (spinbtnStickyLane.Value > NumOfLanes) then
          spinbtnStickyLane.Value := NumOfLanes;
      end
    except
      on E: Exception do
        // PARAM not found ... do something ...
        spinbtnStickyLane.Value := 8;
    end;

end;

end.
