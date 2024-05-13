unit frmTimeKeeper;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, System.ImageList, FMX.ImgList, System.Actions, FMX.ActnList,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Objects, FMX.StdCtrls,
  FMX.ListView, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation,
  FMX.TabControl, FMX.Layouts, dmSCM, System.Character,
  System.IOUtils, Data.DB, FireDAC.Stan.Param, FMX.EditBox, FMX.SpinBox,
  ProgramSetting, FMX.Styles.Objects;

type

  TDefaultFont = class(TInterfacedObject, IFMXSystemFontService)
  public
    function GetDefaultFontFamilyName: string;
    function GetDefaultFontSize: Single;
  end;

  TTimeKeeper = class(TForm)
    ActionList1: TActionList;
    actnConnect: TAction;
    actnDisconnect: TAction;
    actnPostTime: TAction;
    actnRefresh: TAction;
    actnSCMOptions: TAction;
    AniIndicator1: TAniIndicator;
    BindingsList1: TBindingsList;
    bsEntrant: TBindSourceDB;
    bsEvent: TBindSourceDB;
    bsHeat: TBindSourceDB;
    bsLane: TBindSourceDB;
    bsSession: TBindSourceDB;
    bsSwimClub: TBindSourceDB;
    btn00: TButton;
    btn01: TButton;
    btn02: TButton;
    btn03: TButton;
    btn04: TButton;
    btn05: TButton;
    btn06: TButton;
    btn07: TButton;
    btn08: TButton;
    btn09: TButton;
    btnConnect: TButton;
    btnDisconnect: TButton;
    btnPoint: TButton;
    btnRefresh: TButton;
    btnClear: TButton;
    chkbLockToLane: TCheckBox;
    chkbSessionVisibility: TCheckBox;
    chkbUseOsAuthentication: TCheckBox;
    cmbSessionList: TComboBox;
    cmbSwimClubList: TComboBox;
    edtPassword: TEdit;
    edtServerName: TEdit;
    edtUser: TEdit;
    GridPanelLayout1: TGridPanelLayout;
    Label1: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    lblTitleRaceTime: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    layConnectButtons: TLayout;
    layEntrantList: TLayout;
    layEntrantName: TLayout;
    layEntrantRaceTime: TLayout;
    layEventHeat: TLayout;
    layEventHeatTitleBar: TLayout;
    layFooter: TLayout;
    layLoginToServer: TLayout;
    layPersonalBest: TLayout;
    layRaceTime: TLayout;
    layRaceTimeDetail: TLayout;
    layRaceTimeEditBox: TLayout;
    layRaceTimeEnterTime: TLayout;
    layRaceTimeText: TLayout;
    layRaceTimeTitleBar: TLayout;
    laySelectSession: TLayout;
    layTitleRaceTime: TLayout;
    layTabs: TLayout;
    layTimeToBeat: TLayout;
    lblAniIndicatorStatus: TLabel;
    lblConnectionStatus: TLabel;
    lblEntrantName: TLabel;
    lblEvent: TLabel;
    lblHeat: TLabel;
    lblPersonalBest: TLabel;
    lblRaceTime: TLabel;
    lblSelectSession: TLabel;
    lblSelectSwimClub: TLabel;
    lblTimeToBeat: TLabel;
    LinkListControlToField1: TLinkListControlToField;
    LinkListControlToField2: TLinkListControlToField;
    LinkListControlToField3: TLinkListControlToField;
    LinkListControlToField4: TLinkListControlToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    LinkPropertyToFieldText8: TLinkPropertyToField;
    ListViewEvent: TListView;
    ListViewHeat: TListView;
    ListViewLane: TListView;
    ScaledLayout1: TScaledLayout;
    SizeGrip1: TSizeGrip;
    spinboxLockToLane: TSpinBox;
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
    TabControl1: TTabControl;
    tabEntrantRaceTime: TTabItem;
    tabEventHeat: TTabItem;
    tabLoginSession: TTabItem;
    Timer1: TTimer;
    txt03: TLabel;
    Label3: TLabel;
    LinkListControlToField5: TLinkListControlToField;
    btnBackSpace: TButton;
    imgBackSpaceCntrl: TImageControl;
    txtRaceTime: TLabel;
    btnPost: TButton;
    btnGetTime: TButton;
    ImageControl2: TImageControl;
    spinbNumOfDecimalPlaces: TSpinBox;
    Layout1: TLayout;
    Label4: TLabel;
    Rectangle1: TRectangle;
    btnClearTime: TButton;
    layRace_Time: TLayout;
    layEntrantStats: TLayout;
    procedure actnConnectExecute(Sender: TObject);
    procedure actnConnectUpdate(Sender: TObject);
    procedure actnDisconnectExecute(Sender: TObject);
    procedure actnDisconnectUpdate(Sender: TObject);
    procedure actnPostTimeExecute(Sender: TObject);
    procedure actnPostTimeUpdate(Sender: TObject);
    procedure actnRefreshExecute(Sender: TObject);
    procedure actnRefreshUpdate(Sender: TObject);
    procedure btnBackSpaceClick(Sender: TObject);
    procedure btnNumClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnClearTimeClick(Sender: TObject);
    procedure btnGetTimeClick(Sender: TObject);
    procedure btnPointClick(Sender: TObject);
    procedure chkbSessionVisibilityChange(Sender: TObject);
    procedure cmbSessionListChange(Sender: TObject);
    procedure cmbSwimClubListChange(Sender: TObject);
    procedure edtRaceTimeEnter(Sender: TObject);
    procedure edtRaceTimeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListViewEventChange(Sender: TObject);
    procedure ListViewHeatChange(Sender: TObject);
    procedure ListViewLaneChange(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private const
    CONNECTIONTIMEOUT = 48;
    procedure StripTimeChars(var s: string);
    function GetDisplayRaceTimeALT(aRawString: string): string;

  var
    fConnectionCountdown: Integer;
    fLoginTimeOut: Integer;
    fNumOfLanes: Integer;

    procedure btnBKSClickTerminate(Sender: TObject);
    procedure ConnectOnTerminate(Sender: TObject);
    function GetSCMVerInfo(): string;

    procedure LoadFromSettings; // JSON Program Settings
    procedure LoadSettings; // JSON Program Settings
    procedure PostRaceTime;
    procedure ClearRaceTime;
    procedure SaveToSettings; // JSON Program Settings
    procedure Update_Layout;
    procedure Update_SessionVisibility;
    procedure Update_TabSheetCaptions;
    procedure Update_EntrantStat;
    function GetDisplayRaceTime(aRawString: string): string;
    function GetRawRaceTime(RaceTimeStr: string): string;
    procedure StickToLane;

  public
    { Public declarations }
    procedure Refresh_Entrant;
    procedure Refresh_Lane;
  end;

var
  TimeKeeper: TTimeKeeper;

implementation

{$R *.fmx}

uses
{$IFDEF MSWINDOWS}
  // needed for call to winapi MessageBeep & Beep
  Winapi.Windows,
  // needed to show virtual keyboard in windows 10 32/64bit
  // Shellapi,
{$ENDIF}
  // FOR scmLoadOptions
  // System.IniFiles,
  // FOR Floor
  System.Math, ExeInfo, SCMSimpleConnect, SCMUtility;

procedure TTimeKeeper.actnConnectExecute(Sender: TObject);
var
  Thread: TThread;
  sc: TSimpleConnect;
begin
  if (Assigned(SCM) and (SCM.scmConnection.Connected = false)) then
  begin
    lblAniIndicatorStatus.Text := 'Connecting';
    fConnectionCountdown := fLoginTimeOut;
    AniIndicator1.Visible := true; // progress timer
    AniIndicator1.Enabled := true; // start spinning
    lblAniIndicatorStatus.Visible := true; // a label with countdown
    Timer1.Enabled := true; // start the countdown
    actnConnect.Visible := false;
    application.ProcessMessages;

    Thread := TThread.CreateAnonymousThread(
      procedure
      begin
        // can only be assigned if not connected
        SCM.scmConnection.Params.Values['LoginTimeOut'] :=
          IntToStr(fLoginTimeOut);

        sc := TSimpleConnect.CreateWithConnection(Self, SCM.scmConnection);
        sc.DBName := 'SwimClubMeet'; // DEFAULT
        sc.SimpleMakeTemporyConnection(edtServerName.Text, edtUser.Text,
          edtPassword.Text, chkbUseOsAuthentication.IsChecked);
        Timer1.Enabled := false;
        sc.Free
      end);
    Thread.OnTerminate := ConnectOnTerminate;
    Thread.Start;
  end;

end;

procedure TTimeKeeper.actnConnectUpdate(Sender: TObject);
begin
  // verbose code - stop unecessary repaints ...
  if Assigned(SCM) then
  begin
    if SCM.scmConnection.Connected and actnConnect.Visible then
      actnConnect.Visible := false;
    if not SCM.scmConnection.Connected and not actnConnect.Visible then
      actnConnect.Visible := true;
  end
  else // D E F A U L T  I N I T  . Data module not created.
  begin
    if not actnConnect.Visible then
      actnConnect.Visible := true;
  end;
end;

procedure TTimeKeeper.actnDisconnectExecute(Sender: TObject);
begin
  // IF DATA-MODULE EXISTS ... break the current connection.
  if Assigned(SCM) then
  begin
    SCM.DeActivateTable;
    SCM.scmConnection.Connected := false;
    lblConnectionStatus.Text := 'No connection.';
  end;
  AniIndicator1.Visible := false;
  lblAniIndicatorStatus.Visible := false;
  AniIndicator1.Enabled := false;
  SaveToSettings; // As this was a OK connection - store parameters.
  tabEventHeat.Text := 'Event-Heat';
  tabEntrantRaceTime.Text := 'Entrant-RaceTime';
  UpdateAction(actnDisconnect);
  UpdateAction(actnConnect);
  Update_Layout;
end;

procedure TTimeKeeper.actnDisconnectUpdate(Sender: TObject);
begin
  // verbose code - stop unecessary repaints ...
  if Assigned(SCM) then
  begin
    if SCM.scmConnection.Connected and not actnDisconnect.Visible then
      actnDisconnect.Visible := true;
    if not SCM.scmConnection.Connected and actnDisconnect.Visible then
      actnDisconnect.Visible := false;
  end
  else // D E F A U L T  I N I T  . Data module not created.
  begin
    if actnDisconnect.Visible then
      actnDisconnect.Visible := false;
  end;
end;

procedure TTimeKeeper.actnPostTimeExecute(Sender: TObject);
begin
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    // Test if the heat is closed or raced or session is closed .
    if ((SCM.qryHeat.FieldByName('HeatStatusID').AsInteger <> 1) or
      (SCM.qrySession.FieldByName('SessionStatusID').AsInteger <> 1)) then
    begin
{$IFDEF MSWINDOWS}
      MessageBeep(MB_ICONERROR);
{$ENDIF}
      lblConnectionStatus.Text :=
        'Failed to PostTime because the session/heat is locked/closed.';
    end
    else
    begin
      PostRaceTime; // Extract TDateTime, post and display status message.
      bsEntrant.DataSet.Refresh; // display changes in lblRaceTime.
    end;
  end
end;

procedure TTimeKeeper.actnPostTimeUpdate(Sender: TObject);
begin
  // connected to SwimClubMeet
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    // is the heat open? Is the session unlocked?
    if ((SCM.qryHeat.FieldByName('HeatStatusID').AsInteger = 1) and
      (SCM.qrySession.FieldByName('SessionStatusID').AsInteger = 1)) then
    // Is there a swimmer assigned to the lane?
    begin
      if (not SCM.qryEntrant.IsEmpty) then
        btnBackSpace.Enabled := true
      else
        btnBackSpace.Enabled := false;
    end
    // session is locked or heat is raced or closed ...
    else
      btnBackSpace.Enabled := false;
  end
  // database isn't connected
  else
    btnBackSpace.Enabled := false;
end;

procedure TTimeKeeper.actnRefreshExecute(Sender: TObject);
var
  EventID, HeatID: Integer;
begin
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    // disable listviews
    SCM.qryEvent.DisableControls;
    SCM.qryHeat.DisableControls;
    // store the current database record identities
    EventID := SCM.qryHeat.FieldByName('EventID').AsInteger;
    HeatID := SCM.qryHeat.FieldByName('HeatID').AsInteger;
    // run the queries
    SCM.qryEvent.Refresh;
    lblConnectionStatus.Text := 'SCM Refreshed.';
    // restore database record indexes
    SCM.LocateEventID(EventID);
    SCM.LocateHeatID(HeatID);
    // performs full ReQuery of lane table.
    Refresh_Lane;
  end;
  SCM.qryEvent.EnableControls;
  SCM.qryHeat.EnableControls;
end;

procedure TTimeKeeper.actnRefreshUpdate(Sender: TObject);
begin
  if (Assigned(SCM) and SCM.IsActive) then
    actnRefresh.Enabled := true
  else
    actnRefresh.Enabled := false;
end;

procedure TTimeKeeper.btnNumClick(Sender: TObject);
var
  s: string;
begin
  s := txtRaceTime.Text;
  s := s + TButton(Sender).Text;
  StripTimeChars(s);
  s := GetDisplayRaceTime(s);
  txtRaceTime.Text := s;
end;

procedure TTimeKeeper.btnBackSpaceClick(Sender: TObject);
var
  s: string;
begin
  s := txtRaceTime.Text;
  s := s + TButton(Sender).Text;
  StripTimeChars(s);
  Delete(s, Length(s), 1);
  s := GetDisplayRaceTime(s);
  txtRaceTime.Text := s;
end;

procedure TTimeKeeper.btnBKSClickTerminate(Sender: TObject);
begin
  txtRaceTime.SetFocus;
  txtRaceTime.Repaint;
end;

procedure TTimeKeeper.btnClearClick(Sender: TObject);
begin
  txtRaceTime.Text := '';
end;

procedure TTimeKeeper.btnClearTimeClick(Sender: TObject);
begin
  // Check for connection
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    if ((SCM.qryHeat.FieldByName('HeatStatusID').AsInteger <> 1) or
      (SCM.qrySession.FieldByName('SessionStatusID').AsInteger <> 1)) then
    begin
{$IFDEF MSWINDOWS}
      MessageBeep(MB_ICONERROR);
{$ENDIF}
      lblConnectionStatus.Text :=
        'Failed to Clear Time because the session/heat is locked/closed.';
    end
    else
      ClearRaceTime; // routine will post and display a status message
    Refresh_Lane;
  end
end;

procedure TTimeKeeper.btnGetTimeClick(Sender: TObject);
var
  s: string;
begin
  if bsLane.DataSet.FieldByName('MemberID').IsNull then
    txtRaceTime.Text := ''
  else
  begin
    s := bsEntrant.DataSet.FieldByName('RaceTimeStr').AsString;
    s := GetRawRaceTime(s);
    s := GetDisplayRaceTime(s);
    txtRaceTime.Text := s;
  end;
end;

procedure TTimeKeeper.btnPointClick(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_DECIMAL;
  KeyChar := '.';
  if txtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.chkbSessionVisibilityChange(Sender: TObject);
begin
  if (Assigned(SCM) and SCM.scmConnection.Connected) then
    Update_SessionVisibility();
end;

procedure TTimeKeeper.ClearRaceTime;
begin
  lblConnectionStatus.Text := '';
  if not Assigned(SCM) then
    exit;
  if not SCM.IsActive then
    exit;
  // session cannot be locked.
  if not(SCM.qrySession.FieldByName('SessionStatusID').AsInteger = 1) then
    exit;
  // only opened or raced heats can be cleared ...
  if (SCM.qryHeat.FieldByName('HeatStatusID').AsInteger = 3) then
    exit;
  // Is there an ENTRANT.
  if SCM.qryLane.FieldByName('MemberID').IsNull then
    exit;
  if not SCM.qryEntrant.FieldByName('EntrantID').IsNull then
  begin
    try
      begin
        SCM.qryEntrant.DisableControls;
        SCM.qryEntrant.Edit;
        SCM.qryEntrant.FieldByName('RaceTime').Clear;
        SCM.qryEntrant.Post;
        SCM.qryEntrant.EnableControls;
        Refresh_Entrant;
{$IFDEF MSWINDOWS}
        MessageBeep(MB_ICONINFORMATION);
{$ENDIF}
        lblConnectionStatus.Text :=
          'INFO: The RaceTime was successfully cleared.';
      end
    except
      on E: Exception do
      begin
        // bad conversion
{$IFDEF MSWINDOWS}
        MessageBeep(MB_ICONERROR);
{$ENDIF}
        lblConnectionStatus.Text :=
          'ERROR: Unable to clear time to the SCM database!'
      end;
    end;
  end;
end;

procedure TTimeKeeper.cmbSessionListChange(Sender: TObject);
begin
  if Assigned(SCM) and SCM.scmConnection.Connected then
  begin
    if SCM.IsActive then
    begin
      bsEvent.DataSet.First;
      bsHeat.DataSet.First;
    end;
    Update_TabSheetCaptions;
  end;
end;

procedure TTimeKeeper.cmbSwimClubListChange(Sender: TObject);
begin
  if Assigned(SCM) and SCM.scmConnection.Connected then
  begin
    if SCM.IsActive then
    begin
      bsSession.DataSet.First;
      bsEvent.DataSet.First;
      bsHeat.DataSet.First;
    end;
    Update_TabSheetCaptions;
  end;
end;

procedure TTimeKeeper.ConnectOnTerminate(Sender: TObject);
begin

  lblAniIndicatorStatus.Visible := false;
  AniIndicator1.Enabled := false;
  AniIndicator1.Visible := false;

  if TThread(Sender).FatalException <> nil then
  begin
    // something went wrong
    // Exit;
  end;

  if not Assigned(SCM) then
    exit;

  // C O N N E C T E D  .
  if (SCM.scmConnection.Connected) then
  begin
    SCM.ActivateTable;
    // ALL TABLES SUCCESSFULLY MADE ACTIVE ...
    if (SCM.IsActive = true) then
    begin
      // Set the visibility of closed sessions.
      Update_SessionVisibility;
      // I N I T   L A N E   L I S T .
      Refresh_Lane;
    end;
    // STATUS BAR CAPTION.
    lblConnectionStatus.Text := 'Connected to SwimClubMeet. ';
    lblConnectionStatus.Text := lblConnectionStatus.Text + GetSCMVerInfo();
    lblConnectionStatus.Text := lblConnectionStatus.Text + sLineBreak +
      bsSwimClub.DataSet.FieldByName('Caption').AsString;

    fNumOfLanes := bsSwimClub.DataSet.FieldByName('NumOfLanes').AsInteger;
    if (fNumOfLanes > 0) then
      spinboxLockToLane.Max := fNumOfLanes;
  end;

  // VERY SICK OF BIND COMPONETS BREAKING!
  if Assigned(SCM) and SCM.IsActive then
  begin
    if not Assigned(bsSwimClub.DataSet) then
      bsSwimClub.DataSet := SCM.tblSwimClub;
    if not Assigned(bsSession.DataSet) then
      bsSession.DataSet := SCM.qrySession;
    if not Assigned(bsEvent.DataSet) then
      bsEvent.DataSet := SCM.qryEvent;
    if not Assigned(bsHeat.DataSet) then
      bsHeat.DataSet := SCM.qryHeat;
    if not Assigned(bsEntrant.DataSet) then
      bsEntrant.DataSet := SCM.qryEntrant;
    if not Assigned(bsLane.DataSet) then
      bsLane.DataSet := SCM.qryLane;
  end;

  if not SCM.scmConnection.Connected then
  begin
    // Attempt to connect failed.
    lblConnectionStatus.Text :=
      'A connection couldn''t be made. (Check you input values.)';
  end;

  // Disconnect button vivibility
  UpdateAction(actnDisconnect);
  // Connect button vivibility
  UpdateAction(actnConnect);
  // Display of layout panels (holding TListView grids).
  Update_Layout;


end;

procedure TTimeKeeper.edtRaceTimeEnter(Sender: TObject);
begin
  // selectall behavious is different in FMX
  // this works ...

  TThread.CreateAnonymousThread(
    procedure()
    begin
      TThread.Synchronize(nil,
        procedure()
        begin
          // edtRaceTime.SelectAll();

        end);
    end).Start;


  // THIS shows the OLD windows 10 virtual keyboard. NOT THE TOUCH KEYBOARD
  // var
  // sWindowsDir: string;
  // sWindowsSysDir: string;
  // {$IFDEF MSWINDOWS}
  // sWindowsSysDir := GetEnvironmentVariable('SYSTEMROOT');
  // ShellExecute(HWND(Handle), 'open', PChar(sWindowsSysDir +  '\SysNative\OSK.EXE'), nil, nil, SW_Show);
  // sWindowsDir := GetEnvironmentVariable('WINDIR');
  // if FileExists(sWindowsSysDir + '\OSK.exe') then
  // ShellExecute(HWND(Handle), 'open', PChar(sWindowsDir +  '\SysNative\OSK.EXE'), nil, nil, SW_Show)
  // else
  // ShellExecute(HWND(Handle), 'open', PChar(sWindowsDir +  '\SysNative\OSK.EXE'), nil, nil, SW_Show);
  // end;
  // {$ENDIF}

end;

procedure TTimeKeeper.edtRaceTimeKeyDown(Sender: TObject; var Key: Word;
var KeyChar: Char; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    // test for DONE.
    // if edtRaceTime.ReturnKeyType = TReturnKeyType.Done then
    // Post the time to the database.
    // actnPostTimeExecute(self);
  end;
end;

procedure TTimeKeeper.FormCreate(Sender: TObject);
begin
  // Initialization of params.
  application.ShowHint := true;
  AniIndicator1.Visible := false;
  AniIndicator1.Enabled := false;
  btnDisconnect.Visible := false;
  Timer1.Enabled := false;
  lblAniIndicatorStatus.Visible := false;
  cmbSessionList.Items.Clear;
  cmbSwimClubList.Items.Clear;
  chkbSessionVisibility.IsChecked := true;
  fLoginTimeOut := CONNECTIONTIMEOUT;
  fConnectionCountdown := fLoginTimeOut;
  chkbLockToLane.IsChecked := false;
  txtRaceTime.Text := '';
  fNumOfLanes := 8;

  // A Class that uses JSON to read and write application configuration
  if Settings = nil then
    Settings := TPrgSetting.Create;

  // C R E A T E   T H E   D A T A M O D U L E .
  if NOT Assigned(SCM) then
    SCM := TSCM.Create(Self);
  if SCM.scmConnection.Connected then
    SCM.scmConnection.Connected := false;

  // READ APPLICATION   C O N F I G U R A T I O N   PARAMS.
  // JSON connection settings. Windows location :
  // %SYSTEMDRIVE\%%USER%\%USERNAME%\AppData\Roaming\Artanemus\SwimClubMeet
  LoadSettings;

  // TAB_SHEET : DEFAULT: Login-Session
  TabControl1.TabIndex := 0;

  Update_Layout;

  // Connection status - located in footer bar.
  lblConnectionStatus.Text := 'NOT CONNECTED';


end;

procedure TTimeKeeper.FormDestroy(Sender: TObject);
begin
  if Assigned(SCM) then
  begin
    if SCM.scmConnection.Connected then
    begin
      SaveToSettings;
      SCM.scmConnection.Connected := false;
    end;
    SCM.Free;
  end;
end;

function TTimeKeeper.GetDisplayRaceTime(aRawString: string): string;
var
  nodp: Integer; // Number of decimal places.
  len, i: Integer; // length of raw string.
  hours, minutes, seconds, hundredths, s: string;
begin
  if (aRawString = '') then // string is empty.
  begin
    result := '';
    exit;
  end;

  nodp := Round(spinbNumOfDecimalPlaces.Value);
  len := Length(aRawString);

  if (nodp > 0) then
  begin
    if (len > nodp) then
      hundredths := Copy(aRawString, len - nodp + 1, nodp)
    else
    begin
      // len equal nodp or less : only hundredths to display
      result := '.' + Copy(aRawString, 1, len);
      exit;
    end;
  end
  else
    hundredths := ''; // decimal place not being used.

  i := len - nodp; // number of chars after hundredths are removed.
  if (i = 1) or (i = 2) then
  begin
    if i = 1 then
      seconds := Copy(aRawString, 1, 1);
    if i = 2 then
      seconds := Copy(aRawString, 1, 2);
    result := seconds + '.' + hundredths;
    exit;
  end
  else
    seconds := Copy(aRawString, len - nodp - 1, 2);

  // number of chars after hundredths and seconds are removed.
  i := len - nodp;
  if (i = 3) OR (i = 4) then
  begin
    if i = 3 then
      minutes := Copy(aRawString, 1, 1);
    if i = 4 then
      minutes := Copy(aRawString, 1, 2);
    if (nodp = 0) then
      result := minutes + ':' + seconds
    else
      result := minutes + ':' + seconds + '.' + hundredths;
    exit;
  end
  else
    minutes := Copy(aRawString, len - nodp - 3, 2);

  // number of chars after hundredths, seconds and minute are removed.
  i := len - nodp;
  if (i = 5) OR (i = 6) then
  begin
    if i = 5 then
      hours := Copy(aRawString, 1, 1);
    if i = 6 then
      hours := Copy(aRawString, 1, 2);
    if (nodp = 0) then
      result := hours + ':' + minutes + ':' + seconds
    else
      result := hours + ':' + minutes + ':' + seconds + '.' + hundredths;
    exit;
  end;
  // no chars for hours - just return ...
  if (nodp = 0) then
    result := minutes + ':' + seconds
  else
    result := minutes + ':' + seconds + '.' + hundredths;
end;

function TTimeKeeper.GetDisplayRaceTimeALT(aRawString: string): string;
var
  nodp, len, i: Integer;
  hours, minutes, seconds, hundredths: string;

  function FormatTime(h, m, s, hund: string): string;
  begin
    if hund <> '' then
      hund := '.' + hund;
    if h = '' then
      result := Format('%s:%s%s', [m, s, hund])
    else
      result := Format('%s:%s:%s%s', [h, m, s, hund]);
  end;

begin
  if aRawString = '' then
    exit('');

  nodp := Round(spinbNumOfDecimalPlaces.Value);
  len := Length(aRawString);

  if nodp > 0 then
  begin
    if len > nodp then
      hundredths := Copy(aRawString, len - nodp + 1, nodp)
    else
      exit(Copy(aRawString, 1, len));
  end
  else
    hundredths := '';

  i := len - nodp;
  if i in [1, 2] then
  begin
    seconds := Copy(aRawString, 1, i);
    exit(FormatTime('', '', seconds, hundredths));
  end
  else
    seconds := Copy(aRawString, len - nodp - 1, 2);

  i := len - nodp - 2;
  if i in [1, 2] then
  begin
    minutes := Copy(aRawString, 1, i);
    exit(FormatTime('', minutes, seconds, hundredths));
  end
  else
    minutes := Copy(aRawString, len - nodp - 3, 2);

  i := len - nodp - 4;
  if i in [1, 2] then
  begin
    hours := Copy(aRawString, 1, i);
    exit(FormatTime(hours, minutes, seconds, hundredths));
  end;

  result := FormatTime('', minutes, seconds, hundredths);
end;

function TTimeKeeper.GetRawRaceTime(RaceTimeStr: string): string;
var
  s: string;
  nodp: Integer;
begin
  // takes RaceTimeStr given by dbo.Entrant and strips down
  // to raw numbers.
  s := RaceTimeStr;

  // three decimal places are used in the RaceTimeStr string
  nodp := Round(spinbNumOfDecimalPlaces.Value);
  if nodp = 0 then
    Delete(s, Length(s) - 2, 3); // remove all decimal place chars.
  if nodp = 1 then
    Delete(s, Length(s) - 1, 2); // last two chars'
  if nodp = 2 then
    Delete(s, Length(s), 1); // single character.

  StripTimeChars(s);

  result := s;
end;

function TTimeKeeper.GetSCMVerInfo(): string;
{$IF defined(MSWINDOWS)}
var
  myExeInfo: TExeInfo;
{$ENDIF}
begin
  result := '';
  // if connected - display the application version
  // and the SwimClubMeet database version.
  if Assigned(SCM) then
    if SCM.scmConnection.Connected then
      result := 'DB v' + SCM.GetDBVerInfo;
{$IF defined(MSWINDOWS)}
  // get the application version number
  myExeInfo := TExeInfo.Create(Self);
  result := 'App v' + myExeInfo.FileVersion + ' - ' + result;
  myExeInfo.Free;
{$ENDIF}
end;

procedure TTimeKeeper.ListViewEventChange(Sender: TObject);
begin
  Update_TabSheetCaptions;
end;

procedure TTimeKeeper.ListViewHeatChange(Sender: TObject);
begin
  Update_TabSheetCaptions;
end;

procedure TTimeKeeper.ListViewLaneChange(Sender: TObject);
begin
  Update_EntrantStat; // Empty lanes don't show entrant stats.
  // S T A T U S   L I N E   E V E N T   D E S C R I P T I O  N  .
  // Distance Stroke, NOM and ENT count ....
  lblConnectionStatus.Text := bsEvent.DataSet.FieldByName
    ('ListDetailStr').AsString;
end;

procedure TTimeKeeper.LoadFromSettings;
begin
  edtServerName.Text := Settings.Server;
  edtUser.Text := Settings.User;
  edtPassword.Text := Settings.Password;
  chkbUseOsAuthentication.IsChecked := Settings.OSAuthent;
  chkbSessionVisibility.IsChecked := Settings.SessionVisibility;
  chkbLockToLane.IsChecked := Settings.LockToLane;
  fLoginTimeOut := Settings.LoginTimeOut;
  spinboxLockToLane.Value := Settings.LockToLaneNumber;
end;

procedure TTimeKeeper.LoadSettings;
begin
  if Settings = nil then
    Settings := TPrgSetting.Create;

  if not FileExists(Settings.GetDefaultSettingsFilename()) then
  begin
    ForceDirectories(Settings.GetSettingsFolder());
    Settings.SaveToFile();
  end;

  Settings.LoadFromFile();
  LoadFromSettings();
end;

procedure TTimeKeeper.PostRaceTime;
var
  s, s1, s2: String;
  i, pos, len: Integer;
  dt: TDateTime;
  Hour, Min, Sec, MSec: Word;

begin
  lblConnectionStatus.Text := '';
  if Assigned(SCM) and SCM.IsActive then
  begin
    // only opened heats can be cleared ...
    if ((SCM.qryHeat.FieldByName('HeatStatusID').AsInteger = 1) and
      (SCM.qrySession.FieldByName('SessionStatusID').AsInteger = 1)) then
    begin
      // Are there ENTRANTS?
      if (not SCM.qryEntrant.IsEmpty) then
      begin
        // init PARAMS
        Hour := 0;
        Min := 0;
        Sec := 0;
        MSec := 0;
        s1 := '';
        s2 := 'ERROR: Invalid RaceTime. Please check input.';
        // USER INPUT DATA
        s := txtRaceTime.Text;
        // strip unwanted characters.
        // String[] index is base one .... IsDigit is base one.
        i := 1;
        while i <= s.Length do
        begin
          if s[i].IsDigit or (s[i] = '.') then
            s1 := s1 + s[i];
          inc(i);
        end;

        // if we find valid numerical data - next we extract character
        // by character each part - working backwards along the string.
        if (not s1.IsEmpty) then
        begin
          // is there a decimal point
          // Delphi IndexOf is base zero - returns -1 if not found.
          pos := s1.IndexOf('.');
          if (pos <> -1) then
          begin
            // found decimal point
            // grab everything prior to the decimal point
            // substring index is base zero
            len := String(s1.SubString(0, pos)).Length;
            if (len > 0) then
              Sec := Word(StrToInt(s1.SubString(pos - 1, 1)));
            if (len > 1) then
              Sec := Sec + Word(StrToInt(s1.SubString(pos - 2, 1)) * 10);
            if (len > 2) then
              Min := Word(StrToInt(s1.SubString(pos - 3, 1)));
            if (len > 3) then
              Min := Min + Word(StrToInt(s1.SubString(pos - 4, 1)) * 10);
            // grab everything after the decimal point
            len := s1.Length - (pos + 1);
            if (len > 0) then
              MSec := Word(StrToInt(s1.SubString(pos + 1, 1)) * 100);
            if (len > 1) then
              MSec := MSec + Word(StrToInt(s1.SubString(pos + 2, 1)) * 10);
            if (len > 2) then
              MSec := MSec + Word(StrToInt(s1.SubString(pos + 3, 1)) * 1);
          end
          else
          begin
            // no decimal point
            len := s1.Length;
            if (len > 0) then
              Sec := Word(StrToInt(s1.SubString(len - 1, 1)));
            if (len > 1) then
              Sec := Sec + Word(StrToInt(s1.SubString(len - 2, 1)) * 10);
            if (len > 2) then
              Min := Word(StrToInt(s1.SubString(len - 3, 1)));
            if (len > 3) then
              Min := Min + Word(StrToInt(s1.SubString(len - 4, 1)) * 10);
          end;

          // ---------------------------------------------------------
          // Build the DateTime and POST
          // ---------------------------------------------------------
          try
            begin
              dt := EncodeTime(Hour, Min, Sec, MSec);
              SCM.qryEntrant.DisableControls;
              SCM.qryEntrant.Edit;
              SCM.qryEntrant.FieldByName('RaceTime').AsDateTime := dt;
              SCM.qryEntrant.Post;
              SCM.qryEntrant.EnableControls;

              // CLEAR TEXT - FOR USER FEEDBACK
              // txtRaceTime.Text := '';

              // updates the label lblRaceTime
              // this will indicate to the use that the value
              // was successfully into the database ...
//              Refresh_Entrant;
{$IFDEF MSWINDOWS}
              MessageBeep(MB_ICONINFORMATION);
{$ENDIF}
              lblConnectionStatus.Text :=
                'INFO: The RaceTime was successfully posted.';

            end
          except
            on E: Exception do
            begin
              // bad conversion
{$IFDEF MSWINDOWS}
              MessageBeep(MB_ICONERROR);
{$ENDIF}
              lblConnectionStatus.Text :=
                'ERROR: Unable to post to the SCM database!'
            end;
          end;

        end
        else // s1 is empty
        begin
          // bad conversion
{$IFDEF MSWINDOWS}
          MessageBeep(MB_ICONERROR);
{$ENDIF}
          lblConnectionStatus.Text :=
            'ERROR: Invalid RaceTime. Please check input.';
        end;

      end; // END : 'Are there entrants?'
    end
  end;
end;

procedure TTimeKeeper.Refresh_Entrant;
var
  EntrantID, HeatID: Integer;
begin
  { Tidy up interface. No connection - selected entrant controls are hidden.
    Controls are hidden/revealed by design stack order else layout changes. }

  if (Assigned(SCM) and SCM.IsActive) then
  begin
    { Note:
      Each time qryLane is closed, then re-assigned parameters, prepared
      and finally reopened ... FlagLane is set true.
      This ONLY occurs at ...
      procedure TSCM.qryHeatAfterScroll(DataSet: TDataSet);

      This flag was created to OPTIMIZE listview updates.
      (closing and re-opening qryEntrant is a little slow).
    }
    if SCM.FlagLane then
    begin
      SCM.qryEntrant.DisableControls;
      // store the current database record indexes
      EntrantID := 0;
      if (not SCM.qryLane.IsEmpty) then
      begin
        // L O C K   T O   L A N E . F I N D   E N T R A N T .
        if (chkbLockToLane.IsChecked) then
        begin
          SCM.LocateLaneNum(Round(spinboxLockToLane.Value));
          EntrantID := SCM.qryLane.FieldByName('EntrantID').AsInteger;
        end
        else
         EntrantID := SCM.qryLane.FieldByName('EntrantID').AsInteger
      end;

      SCM.qryEntrant.Close;
      SCM.qryEntrant.Open;
      SCM.FlagLane := false;

      // C U E   T O   E N T R A N T .
      // EntrantID = 0 is OK, just no cueing ....
      HeatID := SCM.qryHeat.FieldByName('HeatID').AsInteger;
      SCM.LocateEntrantID(EntrantID, HeatID);

      SCM.qryEntrant.EnableControls;
    end
    else
      SCM.qryEntrant.Refresh;

    layEntrantStats.Visible := false;
    // Any heats for this event?
    if (not SCM.qryHeat.IsEmpty) then
    begin
      // Is there a swimmer assigned to the lane?
      if not (SCM.qryLane.FieldByName('MemberID').IsNull) then
        layEntrantStats.Visible := true;
    end;

  end;
end;

procedure TTimeKeeper.Refresh_Lane;
var
  LaneNum: Integer;
begin
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    SCM.qryEntrant.DisableControls;
    SCM.qryLane.DisableControls;
    if (not SCM.qryHeat.IsEmpty) then
    begin
      // store the current selected lane
      LaneNum := SCM.qryLane.FieldByName('LaneNum').AsInteger;
      // Re-constructs qryLane data
      SCM.qryHeatAfterScroll(SCM.qryHeat);
      SCM.LocateLaneNum(LaneNum);
    end
    else
    begin
      // Clear the list
      ListViewLane.Items.Clear;
    end;
    SCM.qryLane.EnableControls;
    SCM.qryEntrant.EnableControls;
  end;
  // NOTE: qryEntrant is parented to qryLane but need re-painting.
  Refresh_Entrant;
end;

procedure TTimeKeeper.StickToLane;
var
  EntrantID, HeatID: integer;
begin
  if not chkbLockToLane.IsChecked then exit;
  if not Assigned(SCM) then exit;
  if SCM.qryHeat.IsEmpty then exit;
  if SCM.qryLane.IsEmpty then exit;

  // L O C K   T O   L A N E . C U E   T O   E N T R A N T .
  SCM.qryLane.DisableControls;
  SCM.qryEntrant.DisableControls;
  SCM.LocateLaneNum(Round(spinboxLockToLane.Value));
  HeatID := SCM.qryHeat.FieldByName('HeatID').AsInteger;
  EntrantID := SCM.qryLane.FieldByName('EntrantID').AsInteger;
  SCM.LocateEntrantID(EntrantID, HeatID);
  SCM.qryEntrant.EnableControls;
  SCM.qryLane.EnableControls;

end;

procedure TTimeKeeper.StripTimeChars(var s: string);
begin
  // remove colons
  s := StringReplace(s, ':', '', [rfReplaceAll]);
  // remove colons
  s := StringReplace(s, '.', '', [rfReplaceAll]);
  // remove leading zeros
  while (Length(s) > 0) and (s[1] = '0') do
    Delete(s, 1, 1);
  // remove spaces
  s := Trim(s);
end;

procedure TTimeKeeper.SaveToSettings;
begin
  Settings.Server := edtServerName.Text;
  Settings.User := edtUser.Text;
  Settings.Password := edtPassword.Text;
  if chkbUseOsAuthentication.IsChecked then
    Settings.OSAuthent := true
  else
    Settings.OSAuthent := false;
  Settings.SessionVisibility := chkbSessionVisibility.IsChecked;
  Settings.LockToLane := chkbLockToLane.IsChecked;
  Settings.LoginTimeOut := fLoginTimeOut;
  Settings.LockToLaneNumber := Round(spinboxLockToLane.Value);
  Settings.SaveToFile();
end;

procedure TTimeKeeper.Update_EntrantStat;
begin
    layEntrantStats.Visible := false;
    // Any heats for this event?
    if (not SCM.qryHeat.IsEmpty) then
    begin
      // Is there a swimmer assigned to the lane?
      if not (SCM.qryLane.FieldByName('MemberID').IsNull) then
        layEntrantStats.Visible := true;
    end;
end;

procedure TTimeKeeper.Update_Layout;
begin
  if Assigned(SCM) then
  begin
    if SCM.scmConnection.Connected then
    begin
      // S H O W  the Event, Heat, Lane and Entrant lists
      if not layEventHeat.Visible then
        layEventHeat.Visible := true;
      if not layEntrantRaceTime.Visible then
        layEntrantRaceTime.Visible := true;
    end
    else
    begin
      // H I D E .
      if layEventHeat.Visible then
        layEventHeat.Visible := false;
      if layEntrantRaceTime.Visible then
        layEntrantRaceTime.Visible := false;
    end;
  end
  else
  begin
    // D E F A U L T   I N I T  - H I D E .
    if layEventHeat.Visible then
      layEventHeat.Visible := false;
    if layEntrantRaceTime.Visible then
      layEntrantRaceTime.Visible := false;
  end;
end;

procedure TTimeKeeper.Update_SessionVisibility;
begin
  if Assigned(SCM) and SCM.qrySession.Active then
  begin
    SCM.qrySession.DisableControls;
    // remove all the strings held in the combobox
    // note cmbSessionList.Clear doesn't work here.
    cmbSessionList.Items.Clear;
    SCM.qrySession.Close;
    // ASSIGN PARAM to display or hide CLOSED sessions
    SCM.qrySession.ParamByName('HIDECLOSED').AsBoolean :=
      chkbSessionVisibility.IsChecked;
    SCM.qrySession.Prepare;
    SCM.qrySession.Open;
    SCM.qrySession.EnableControls
  end

  // the datamodule exists but qrySession isn't connected..
  else if (Assigned(SCM)) then
  begin
    // qrySession ISN'T ACTIVE ....
    // update state of qryLane PARAM
    SCM.qrySession.ParamByName('HIDECLOSED').AsBoolean :=
      chkbSessionVisibility.IsChecked;
  end;

end;

procedure TTimeKeeper.Update_TabSheetCaptions;
begin
  if Assigned(SCM) and SCM.scmConnection.Connected then
  begin
    // T A B   S H E E T  C A P T I O N .
    // E V E N T   . .   H E A T .
    if bsEvent.DataSet.IsEmpty then
      tabEventHeat.Text := 'Empty'
    else
    begin
      tabEventHeat.Text := 'Event.' + bsEvent.DataSet.FieldByName
        ('EventNum').AsString;
      if not bsHeat.DataSet.IsEmpty then
        tabEventHeat.Text := tabEventHeat.Text + '-';
      if not bsHeat.DataSet.IsEmpty and not bsHeat.DataSet.FieldByName
        ('HeatNum').IsNull then
        tabEventHeat.Text := tabEventHeat.Text + 'Heat.' +
          bsHeat.DataSet.FieldByName('HeatNum').AsString;
    end;

    // S T A T U S   L I N E .
    if (bsHeat.DataSet.FieldByName('HeatStatusID').AsInteger <> 1) then
      lblConnectionStatus.Text := 'INFO: The heat is raced or closed.'
    else
      // E V E N T   D E S C R I P T I O  N  .
      // Distance Stroke, NOM and ENT count ....
      lblConnectionStatus.Text := bsEvent.DataSet.FieldByName
        ('ListDetailStr').AsString;
  end
  else
  begin
    lblConnectionStatus.Text := '';
    tabEventHeat.Text := 'Event-Heat';
    tabEntrantRaceTime.Text := 'Entrant-RaceTime';
  end;

end;

procedure TTimeKeeper.TabControl1Change(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0:
      lblConnectionStatus.Text := '';
    1:
      lblConnectionStatus.Text := '';
    2:
      begin
        lblConnectionStatus.Text := '';
        StickToLane;
        Update_EntrantStat;  // empty heats don't show Entrant Stats
      end;
  end;
end;

procedure TTimeKeeper.Timer1Timer(Sender: TObject);
begin

  fConnectionCountdown := fConnectionCountdown - 1;
  lblAniIndicatorStatus.Text := 'Connecting ' + IntToStr(fConnectionCountdown);

end;

{ TDefaultFont }

function TDefaultFont.GetDefaultFontFamilyName: string;
begin
  result := 'Tahoma';
end;

function TDefaultFont.GetDefaultFontSize: Single;
begin
  result := 16.0; // Set the default font size here
end;

initialization

TFont.FontService := TDefaultFont.Create;

end.
