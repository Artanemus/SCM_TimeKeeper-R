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
  System.IOUtils, Data.DB, FireDAC.Stan.Param;

type
  TTimeKeeper = class(TForm)
    ScaledLayout1: TScaledLayout;
    layTabs: TLayout;
    TabControl1: TTabControl;
    tabLoginSession: TTabItem;
    layLoginToServer: TLayout;
    layConnectButtons: TLayout;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Label7: TLabel;
    edtServer: TEdit;
    Label8: TLabel;
    edtUser: TEdit;
    Label12: TLabel;
    edtPassword: TEdit;
    chkOsAuthent: TCheckBox;
    Label18: TLabel;
    laySelectSession: TLayout;
    lblSelectSession: TLabel;
    cmbSessionList: TComboBox;
    tabEventHeat: TTabItem;
    layEventHeat: TLayout;
    ListViewEvent: TListView;
    ListViewHeat: TListView;
    layEventHeatTitleBar: TLayout;
    lblEvent: TLabel;
    lblHeat: TLabel;
    tabEntrantRaceTime: TTabItem;
    layEntrantRaceTime: TLayout;
    layRaceTime: TLayout;
    layRaceTimeTitleBar: TLayout;
    Label3: TLabel;
    layRaceTimeDetail: TLayout;
    layRaceTimeEnterTime: TLayout;
    layRaceTimeEditBox: TLayout;
    edtRaceTime: TEdit;
    layRaceTimeText: TLayout;
    layHeatNumber: TLayout;
    lblHeatNumber: TLabel;
    Label2: TLabel;
    layLane: TLayout;
    lblLaneNumber: TLabel;
    txt01: TLabel;
    layEntrantName: TLayout;
    lblEntrantName: TLabel;
    layPersonalBest: TLayout;
    txt03: TLabel;
    lblPersonalBest: TLabel;
    layStoredRaceTime: TLayout;
    Label5: TLabel;
    lblRaceTime: TLabel;
    layTimeToBeat: TLayout;
    Label9: TLabel;
    lblTimeToBeat: TLabel;
    layEntrantList: TLayout;
    ListViewLane: TListView;
    layEntrantListTitleBar: TLayout;
    lblEntrantsHeatNum: TLabel;
    layFooter: TLayout;
    SizeGrip1: TSizeGrip;
    lblConnectionStatus: TLabel;
    layTopBar: TLayout;
    layTitle: TLayout;
    lblSessionTitle: TLabel;
    lblSwimClubTitle: TLabel;
    laySummary: TLayout;
    lblSelectedEntrant: TLabel;
    lblSelectedEvent: TLabel;
    layCenteredButtons: TLayout;
    imgStopWatch: TImage;
    btnOptions: TButton;
    btnRefresh: TButton;
    StyleBook2: TStyleBook;
    BS_tblSwimClub: TBindSourceDB;
    BS_qrySession: TBindSourceDB;
    BS_qryEvent: TBindSourceDB;
    BS_qryHeat: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField2: TLinkListControlToField;
    LinkListControlToField3: TLinkListControlToField;
    LinkListControlToField4: TLinkListControlToField;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldClubName: TLinkPropertyToField;
    LinkPropertyToFieldSessionDate: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldLane: TLinkPropertyToField;
    LinkPropertyToFieldText6: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    LinkPropertyToFieldText7: TLinkPropertyToField;
    LinkPropertyToFieldText8: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    BS_qryEntrant: TBindSourceDB;
    ActionList1: TActionList;
    actnConnect: TAction;
    actnDisconnect: TAction;
    actnRefresh: TAction;
    actnPostTime: TAction;
    actnSCMOptions: TAction;
    BS_qryLane: TBindSourceDB;
    ImageList1: TImageList;
    AniIndicator1: TAniIndicator;
    lblAniIndicatorStatus: TLabel;
    Timer1: TTimer;
    GridPanelLayout1: TGridPanelLayout;
    btn07: TButton;
    btn08: TButton;
    btn09: TButton;
    btn04: TButton;
    btn05: TButton;
    btn06: TButton;
    btn01: TButton;
    btn02: TButton;
    btn03: TButton;
    btn00: TButton;
    btnPoint: TButton;
    btnRTN: TButton;
    btnBKS: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure actnConnectExecute(Sender: TObject);
    procedure actnConnectUpdate(Sender: TObject);
    procedure actnDisconnectExecute(Sender: TObject);
    procedure actnDisconnectUpdate(Sender: TObject);
    procedure actnRefreshExecute(Sender: TObject);
    procedure actnRefreshUpdate(Sender: TObject);
    procedure actnPostTimeExecute(Sender: TObject);
    procedure actnPostTimeUpdate(Sender: TObject);
    procedure actnSCMOptionsExecute(Sender: TObject);
    procedure actnSCMOptionsUpdate(Sender: TObject);
    procedure ListViewHeatChange(Sender: TObject);
    procedure ListViewEventChange(Sender: TObject);
    procedure ListViewLaneChange(Sender: TObject);
    procedure cmbSessionListChange(Sender: TObject);
    procedure imgStopWatchClick(Sender: TObject);
    procedure ListViewHeatDblClick(Sender: TObject);
    procedure edtRaceTimeEnter(Sender: TObject);
    procedure edtRaceTimeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure btn07Click(Sender: TObject);
    procedure btn08Click(Sender: TObject);
    procedure btn09Click(Sender: TObject);
    procedure btn04Click(Sender: TObject);
    procedure btn05Click(Sender: TObject);
    procedure btn06Click(Sender: TObject);
    procedure btn01Click(Sender: TObject);
    procedure btn02Click(Sender: TObject);
    procedure btn03Click(Sender: TObject);
    procedure btn00Click(Sender: TObject);
    procedure btnPointClick(Sender: TObject);
    procedure btnBKSClick(Sender: TObject);
    procedure LinkPropertyToFieldLaneAssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);
    procedure LinkPropertyToFieldText4AssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);

  private const
    SCMCONFIGFILENAME = 'SCMConfig.ini';
    CONNECTIONTIMEOUT = 48;

  private
    { Private declarations }
    fEnableStickyLane: Boolean;
    fEnableSuperGlue: Boolean;
    fEnableAutoReFresh: Boolean;
    fEnableStopwatchServerPost: Boolean;
    fHideClosedSessions: Boolean;
    fStickyLane: Integer;
    fEnableReturnKeyType: Boolean;
    fConnectionCountdown: Integer;

    procedure scmRaceTimePost;
    procedure ConnectOnTerminate(Sender: TObject);
    procedure btnBKSClickTerminate(Sender: TObject);

    procedure GetSCMVerInfo();

  public
    { Public declarations }
    procedure scmOptionsLoad;
    procedure scmRefreshEntrant_Detail;
    procedure scmRefreshLane;

    procedure scmUpdateTabSheetsImages;
    procedure scmUpdateHideClosedSessions;

    property StickyLane: Integer read fStickyLane;
    property EnableStopwatchServerPost: Boolean read fEnableStopwatchServerPost;
    property EnableStickyLane: Boolean read fEnableStickyLane;
    property EnableSuperGlue: Boolean read fEnableSuperGlue;
    property HideClosedsessions: Boolean read fHideClosedSessions;

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
  dlgSCMOptions, dlgSCMStopWatch,
  // FOR scmLoadOptions
  System.IniFiles,
  // FOR Floor
  System.Math, SCMExeInfo;

{$REGION 'ACTION MANAGER'}

procedure TTimeKeeper.actnConnectExecute(Sender: TObject);
var
  Thread: TThread;
begin
  if (Assigned(SCM) and (SCM.scmConnection.Connected = false)) then
  begin
    lblAniIndicatorStatus.Text := 'Connecting';
    fConnectionCountdown := CONNECTIONTIMEOUT;
    AniIndicator1.Visible := true; // progress timer
    AniIndicator1.Enabled := true; // start spinning
    lblAniIndicatorStatus.Visible := true; // a label with countdown
    // lock this button - so user won't start another thread!
    btnConnect.Enabled := false;
    Timer1.Enabled := true; // start the countdown

    application.ProcessMessages;

    Thread := TThread.CreateAnonymousThread(
      procedure
      begin
        try
          SCM.SimpleMakeTemporyFDConnection(edtServer.Text, edtUser.Text,
            edtPassword.Text, chkOsAuthent.IsChecked);
        finally
          Timer1.Enabled := false;
          lblAniIndicatorStatus.Visible := false;
          AniIndicator1.Enabled := false;
          AniIndicator1.Visible := false;
          btnConnect.Enabled := true;
        end;
      end);
    Thread.OnTerminate := ConnectOnTerminate;
    Thread.Start;
  end;

end;

procedure TTimeKeeper.actnConnectUpdate(Sender: TObject);
begin
  // toggle visibility of Connect button.
  if Assigned(SCM) then
    if SCM.scmConnection.Connected then
      actnConnect.Visible := false
    else
      actnConnect.Visible := true
  else
    actnConnect.Visible := true;
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
  // Hides..unhides visibility of icons in tabLoginSession
  scmUpdateTabSheetsImages;
  AniIndicator1.Visible := false;
  lblAniIndicatorStatus.Visible := false;
  AniIndicator1.Enabled := false;

end;

procedure TTimeKeeper.actnDisconnectUpdate(Sender: TObject);
begin
  // toggle visibility of Disconnect button.
  if Assigned(SCM) then
    if SCM.scmConnection.Connected then
      actnDisconnect.Visible := true
    else
      actnDisconnect.Visible := false
  else
    actnDisconnect.Visible := false;
end;

procedure TTimeKeeper.actnPostTimeExecute(Sender: TObject);
begin
  // Post RaceTime to the database
  // Check for connection
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    // if the heat is closed or raced - then
    // if the session is closed - then
    // the racetime can't be updated ...
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
      scmRaceTimePost; // routine will post and display a status message

    // Update the entrants details.
    // Get the server to ECHO the QUALIFIED STATUS.
    // ie. VISIBLE confirmation that it was POSTED.
    // append a '(Disqualified)' or '(Scratched)' to the
    // FName in the lane listview
    scmRefreshLane;
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
        btnRTN.Enabled := true
      else
        btnRTN.Enabled := false;
    end
    // session is locked or heat is raced or closed ...
    else
      btnRTN.Enabled := false;
  end
  // database isn't connected
  else
    btnRTN.Enabled := false;
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
    scmRefreshLane;
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

// MODAL FORMS IN FireMonkey
// This topic shows you how to create, configure and display a FireMonkey
// dialog box. It also shows how to handle its return value using a callback
// method, and how to free the memory allocated by your modal dialog box
// after it closes.

// 1. Define a class that takes the TProc__1 interface, and define a function
// to handle the closing of your dialog box:
// ---------------------------------------------------------------------------
// You cannot free the memory allocated for your modal dialog box form within
// the method than handles the closing of your modal dialog box form.
// To free your modal dialog box form, you must handle its (the modal dialog
// box form) OnClose event.
// WIT:
// Action = TCloseAction::caFree;

// ---------------------------------------------------------------------------

// 2. Then pass an instance of this class to ShowModal:
// ---------------------------------------------------------------------------

procedure TTimeKeeper.actnSCMOptionsExecute(Sender: TObject);
var
  dlg: TscmOptions;
begin
{$IFNDEF ANDROID}
  dlg := TscmOptions.Create(self);
  dlg.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      // ... Do something.

      // Always reload SCM options from the scmConfig.ini file.
      // There is no CANCEL for this modal form. What ever the user does,
      // the input values are accepted.
      scmOptionsLoad;
      // little status images used on the tabsheets
      scmUpdateTabSheetsImages;
      // Update the visibility of closed sessions in qrySession
      // by modifying it's param HIDECLOSED.
      // This uses value fHideClosedSessions and is best done after a fresh
      // read of the scmConfig.ini values.
      scmUpdateHideClosedSessions;
      // StickyLane stuff
      if (Assigned(SCM) and SCM.IsActive) then
      begin
        // Sticky Lane Enabled?
        if (EnableStickyLane) then
          // cue-to record position in table
          SCM.LocateLaneNum(StickyLane);
      end;
      // update the Enabled state of the ListView LANE
      actnSCMOptionsUpdate(self);
    end);

{$ELSE}
  { TODO : Create an android popup window for options? }
  // ANDROID platform doesn't do Modal Forms.
{$ENDIF}
  (*
    IMPORTANT NOTE : DIALOGUE IS DESTROYED IN TscmOption.FormClose
  *)
end;

procedure TTimeKeeper.actnSCMOptionsUpdate(Sender: TObject);
begin
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    if (fEnableStickyLane and fEnableSuperGlue) then
      ListViewLane.Enabled := false
    else
      ListViewLane.Enabled := true;
  end
  else
    ListViewLane.Enabled := true;
end;

procedure TTimeKeeper.btn00Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD0;
  KeyChar := '0';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn01Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD1;
  KeyChar := '1';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn02Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD2;
  KeyChar := '2';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn03Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD3;
  KeyChar := '3';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn04Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD4;
  KeyChar := '4';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn05Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD5;
  KeyChar := '5';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn06Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD6;
  KeyChar := '6';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn07Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD7;
  KeyChar := '7';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn08Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD8;
  KeyChar := '8';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btn09Click(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_NUMPAD9;
  KeyChar := '9';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.btnBKSClick(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
  Thread: TThread;
begin
  // Note: don't use VK_BACK; - Windows API only
  Key := vkBack; // System.UITypes - Universal, multi-platform.
  KeyChar := Char(vkBack); // KeyChar := #08;
  if edtRaceTime.IsFocused then
  begin
    // Note:
    // Backspace doesn't perform correctly unless we run a thread and
    // include the following termination procedure.
    Thread := TThread.CreateAnonymousThread(
      procedure
      begin
        try
          edtRaceTime.BeginUpdate;
          KeyDown(Key, KeyChar, ShiftState);
        finally
          edtRaceTime.EndUpdate;
        end;
      end);
    Thread.OnTerminate := btnBKSClickTerminate;
    Thread.Start;
  end;
end;

procedure TTimeKeeper.btnBKSClickTerminate(Sender: TObject);
begin
  edtRaceTime.SetFocus;
  edtRaceTime.Repaint;
end;

procedure TTimeKeeper.btnPointClick(Sender: TObject);
var
  Key: Word;
  KeyChar: Char;
  ShiftState: TShiftState;
begin
  Key := VK_DECIMAL;
  KeyChar := '.';
  if edtRaceTime.IsFocused then
    KeyDown(Key, KeyChar, ShiftState);
end;

procedure TTimeKeeper.cmbSessionListChange(Sender: TObject);
begin
  // clean the statusbar
  lblConnectionStatus.Text := '';
end;

procedure TTimeKeeper.ConnectOnTerminate(Sender: TObject);
begin
  if TThread(Sender).FatalException <> nil then
  begin
    // something went wrong
    // Exit;
  end;

  // Tidy-up display
  // lblAniIndicatorStatus.Visible := false;
  // AniIndicator1.Enabled := false;
  // AniIndicator1.Visible := false;

  // Make tables active
  if (SCM.scmConnection.Connected) then
  begin
    SCM.ActivateTable;
    // ALL TABLES SUCCESSFULLY MADE ACTIVE ...
    if (SCM.IsActive = true) then
    begin
      lblConnectionStatus.Text := 'Connected to SwimClubMeet.';
      // TODO: FIRST TIME INIT
      scmRefreshLane;
    end
    else
      lblConnectionStatus.Text :=
        'Connected to SwimClubMeet but not all tables are active!';
  end;

  // FINAL CHECKS
  if (Assigned(SCM) and (SCM.scmConnection.Connected = false)) then
  begin
    lblConnectionStatus.Text := 'No connection.';
  end;

  // Toggles visibility of icons in tabLoginSession.
  scmUpdateTabSheetsImages;
  // Label showing application and database version
  GetSCMVerInfo;

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
          edtRaceTime.SelectAll();

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
    if edtRaceTime.ReturnKeyType = TReturnKeyType.Done then
      // Post the time to the database.
      actnPostTimeExecute(self);
  end;
end;

procedure TTimeKeeper.FormCreate(Sender: TObject);
var
  Value, Section, Name: String;

begin
  // Initialization of params.
  application.ShowHint := true;
  Section := 'MSSQL_SwimClubMeet';
  AniIndicator1.Visible := false;
  AniIndicator1.Enabled := false;
  btnDisconnect.Visible := false;
  fConnectionCountdown := CONNECTIONTIMEOUT;
  Timer1.Enabled := false;
  lblAniIndicatorStatus.Visible := false;

  // note cmbSessionList.Clear doesn't work here.
  cmbSessionList.Items.Clear;

  // clean-up the top bar captions
  lblSwimClubTitle.Text := String.Empty;
  lblSessionTitle.Text := String.Empty;
  lblSelectedEvent.Text := String.Empty;
  lblSelectedEntrant.Text := String.Empty;

  // clean-up TabSheet3
  lblEntrantsHeatNum.Text := 'Entrants ...';

  // ON CREATION SETS - SCM->scmConnection->Active = false;
  SCM := TSCM.Create(self);

  // Read last successful connection params and load into controls
  Name := 'Server';
  SCM.SimpleLoadSettingString(Section, Name, Value);
  edtServer.Text := Value;
  Name := 'User';
  SCM.SimpleLoadSettingString(Section, Name, Value);
  edtUser.Text := Value;
  Name := 'Password';
  SCM.SimpleLoadSettingString(Section, Name, Value);
  edtPassword.Text := Value;
  Name := 'OsAuthent';
  SCM.SimpleLoadSettingString(Section, Name, Value);

  if ((UpperCase(Value) = 'YES') or (UpperCase(Value) = 'TRUE')) then
    chkOsAuthent.IsChecked := true
  else
    chkOsAuthent.IsChecked := false;

  // Connection status - located in footer bar.
  lblConnectionStatus.Text := '';

  // Login-Session
  TabControl1.TabIndex := 0;
  // read all the sticky tacky stuff
  scmOptionsLoad;
  // update the images to use in each tabsheet
  scmUpdateTabSheetsImages;
  // Update the visibility of closed sessions in qrySession
  // by modifying it's param HIDECLOSED.
  // This uses value fHideClosedSessions and is best done after a fresh
  // read of the scmConfig.ini values.
  scmUpdateHideClosedSessions;
  // TIDY ALL TLISTVIEW DISPLAYS - (fixes TViewListLane)
  // on startup SCM will be set to disconnected.
  if Assigned(SCM) then
    SCM.DeActivateTable;

  // Hide controls used by entrant details
  scmRefreshEntrant_Detail;
end;

procedure TTimeKeeper.FormDestroy(Sender: TObject);
begin
  // IF DATA-MODULE EXISTS ... break the current connection.
  if Assigned(SCM) then
  begin
    SCM.DeActivateTable;
    SCM.scmConnection.Connected := false;
  end;
  // CLEAN MEMORY
  SCM.Free;
end;

procedure TTimeKeeper.GetSCMVerInfo;
{$IF defined(MSWINDOWS)}
var
  myExeInfo: TExeInfo;
{$ENDIF}
begin
  // if connected - display the application version
  // and the SwimClubMeet database version.
  if Assigned(SCM) then
    if SCM.scmConnection.Connected then
      Label1.Text := 'DB v' + SCM.GetDBVerInfo
    else
      Label1.Text := '';

{$IF defined(MSWINDOWS)}
  // get the application version number
  myExeInfo := TExeInfo.Create(self);
  Label1.Text := 'App v' + myExeInfo.FileVersion + ' - ' +
    Label1.Text;
  myExeInfo.Free;

{$ENDIF}
end;

procedure TTimeKeeper.imgStopWatchClick(Sender: TObject);
var
  dlg: TscmStopWatch;
begin
{$IFNDEF ANDROID}
  dlg := TscmStopWatch.Create(self);
  dlg.ShowModal(
    procedure(ModalResult: TModalResult)
    begin
      // Do something.
      if (ModalResult = mrOk) then
      begin
        if (EnableStopwatchServerPost) then
        begin
          // CLEAR ANY TEXT
          edtRaceTime.Text := '';
          if (Assigned(SCM) and SCM.IsActive) then
          begin
            // POST RACETIME
            SCM.qryEntrant.DisableControls;
            SCM.qryEntrant.Edit;
            SCM.qryEntrant.FieldByName('RaceTime').AsDateTime := dlg.RaceTime;
            SCM.qryEntrant.Post;
            SCM.qryEntrant.EnableControls;

            // updates the label lblRaceTime
            // this will indicate to the use that the value
            // was successfully into the database ...
            scmRefreshLane;
            lblConnectionStatus.Text :=
              'INFO: The RaceTime was successfully posted.';
          end
          else
          begin
            lblConnectionStatus.Text :=
              'ERROR: The RaceTime wasn''t posted. No Connection.';
          end;
        end
        else
          // default : send RaceTime to edtTime
          edtRaceTime.Text := FormatDateTime('nn:ss.zzz', dlg.RaceTime);
      end;
    end);

{$ELSE}
  { TODO : Create an android popup window for options? }
  // ANDROID platform doesn't do Modal Forms.
{$ENDIF}
  (*
    IMPORTANT NOTE DIALOGUE IS DESTROYED IN TscmStopWatch.FormClose
  *)
end;

procedure TTimeKeeper.LinkPropertyToFieldLaneAssignedValue(Sender: TObject;
AssignValueRec: TBindingAssignValueRec; const Value: TValue);
var
  v: string;
begin
  // if there is no entrant then lane number is blank
  // use the lane number given in qryLane
  v := Value.AsString;
  if (v.IsEmpty) then
  begin
    if (Assigned(SCM) and SCM.IsActive) then
      lblLaneNumber.Text := SCM.qryLane.FieldByName('LaneNum').AsString
    else
      lblEntrantsHeatNum.Text := '';
  end;
end;

procedure TTimeKeeper.LinkPropertyToFieldText4AssignedValue(Sender: TObject;
AssignValueRec: TBindingAssignValueRec; const Value: TValue);
var
  v: string;
begin
  // If there are no heats ... the Value points to an empty string.
  // Assign a corrected caption above the ListView Entrants.
  // NOTE: Custom Binding Default is "Entrants.. " + %s
  v := Value.AsString;
  if (v.IsEmpty) then
    lblEntrantsHeatNum.Text := 'Entrants ...'
end;

procedure TTimeKeeper.ListViewEventChange(Sender: TObject);
begin
  // clean the statusbar
  lblConnectionStatus.Text := '';
end;

procedure TTimeKeeper.ListViewHeatChange(Sender: TObject);
begin
  if (SCM.qryHeat.FieldByName('HeatStatusID').AsInteger <> 1) then
    lblConnectionStatus.Text :=
      'INFO: The heat is raced or closed. Posting is disabled.'
  else
    lblConnectionStatus.Text := '';
  if SCM.qryLane.IsEmpty then
    ListViewLane.Items.Clear;
  // CLEAR TEXT
  edtRaceTime.Text := '';

end;

procedure TTimeKeeper.ListViewHeatDblClick(Sender: TObject);
begin
  // move to tabsheet 2 (LANE-ENTRANT)
  TabControl1.TabIndex := 2;
end;

procedure TTimeKeeper.ListViewLaneChange(Sender: TObject);
begin
  // NOTE:
  // qryEntrant is parented to qryLane
  // qryEntrant will be empty if the qryLane.EntrantID is NULL
  scmRefreshEntrant_Detail;
  // ASSERT the button state
  actnPostTimeUpdate(self);
  // clean the statusbar
  lblConnectionStatus.Text := '';
  application.ProcessMessages;
  // Is there a swimmer assigned to the lane?
  if not(SCM.qryLane.FieldByName('EntrantID').IsNull) then
  begin
    if edtRaceTime.CanFocus then
      edtRaceTime.SetFocus;
  end;
end;

{$ENDREGION}
{$REGION 'User Declarations' }

procedure TTimeKeeper.scmOptionsLoad;
var
  ini: TIniFile;
  Section: String;
begin
  { TODO : Add MarshallOptions in section. Include Marshal options in scmConfig.ini }
  Section := 'TimeKeeperOptions';
  ini := TIniFile.Create(TPath.GetDocumentsPath + PathDelim +
    SCMCONFIGFILENAME);
  try
    fEnableStickyLane := ini.ReadBool(Section, 'EnableStickyLane', false);
    fStickyLane := ini.ReadInteger(Section, 'StickyLane', 1);
    fEnableSuperGlue := ini.ReadBool(Section, 'EnableSuperGlue', false);
    fEnableAutoReFresh := ini.ReadBool(Section, 'EnableAutoReFresh', false);
    fEnableStopwatchServerPost := ini.ReadBool(Section,
      'EnableStopwatchServerPost', false);
    fHideClosedSessions := ini.ReadBool(Section, 'HideClosedSessions', true);
    fEnableReturnKeyType := ini.ReadBool(Section, 'EnableReturnKeyType', true);

    if fEnableReturnKeyType then
      edtRaceTime.ReturnKeyType := TReturnKeyType.Done
    else
      edtRaceTime.ReturnKeyType := TReturnKeyType.Default;

  finally
    ini.Free;
  end;

end;


procedure TTimeKeeper.scmRaceTimePost;
var
  s, s1, s2: String;
  i, pos, len: Integer;
  dt: TDateTime;
  Hour, Min, Sec, MSec: Word;

begin
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
        s := edtRaceTime.Text;
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
              edtRaceTime.Text := '';

              // updates the label lblRaceTime
              // this will indicate to the use that the value
              // was successfully into the database ...
              scmRefreshEntrant_Detail;
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
                'Error: Unable to post to the SCM database!'
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
            'Error: Invalid RaceTime. Please check input.';
        end;

      end; // END : 'Are there entrants?'
    end
  end;
end;

procedure TTimeKeeper.scmRefreshEntrant_Detail;
var
  EntrantID, HeatID: Integer;
begin
  // Tidy up interface. No connection - selected entrant controls are hidden.
  // Controls are hidden/revealed by design stack order else layout changes.
  //
  layStoredRaceTime.Visible := false;
  layPersonalBest.Visible := false;
  layTimeToBeat.Visible := false;
  layEntrantName.Visible := false;
  layLane.Visible := false;
  layHeatNumber.Visible := false;
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    SCM.qryEntrant.DisableControls;
    // store the current database record indexes
    EntrantID := SCM.qryLane.FieldByName('EntrantID').AsInteger;
    HeatID := SCM.qryLane.FieldByName('HeatID').AsInteger;

    // Any heats for this event?
    if (not SCM.qryHeat.IsEmpty) then
    begin
      // Is there a swimmer assigned to the lane?
      if not(SCM.qryLane.FieldByName('EntrantID').IsNull) then
      begin
        // SWIMMER IN LANE - SHOW ALL ENTRANT DETAILS
        layHeatNumber.Visible := true;
        layLane.Visible := true;
        layEntrantName.Visible := true;
        layTimeToBeat.Visible := true;
        layPersonalBest.Visible := true;
        layStoredRaceTime.Visible := true;
      end
      else
      begin
        // SHOW HEAT AND LANE
        // Selected controls remain hidden.
        layHeatNumber.Visible := true;
        layLane.Visible := true;
      end;
    end;
    //
    // Note: The Refresh method does not work for all TDataSet descendants.
    // In particular, TQuery components do not support the Refresh method if
    // the query is not "live".
    // To refresh a static TQuery, close and reopen the dataset.
    //
    // Each time qryLane is closed, then re-assigned parameters, prepared
    // and finally reopened ... FlagLane is set true.
    // This ONLY occurs at ...
    // procedure TSCM.qryHeatAfterScroll(DataSet: TDataSet);
    //
    // NOTE: This flag was created to OPTIMIZE listview updates.
    // (closing and re-opening qryEntrant is a little slow).
    if SCM.FlagLane then
    begin
      // qryLane was trashed :: full requery required
      SCM.qryEntrant.Close;
      SCM.qryEntrant.Open;
      // reset the flag
      SCM.FlagLane := false;
    end;

    // stick to a single swimming lane.
    if (fEnableStickyLane) then
    begin
      SCM.LocateLaneNum(fStickyLane);
      // update the entrant param
      EntrantID := SCM.qryLane.FieldByName('EntrantID').AsInteger;
      // SAFE: ZERO values.
      SCM.LocateEntrantID(EntrantID, HeatID);
    end
    else
    begin
      // SAFE: ZERO values.
      SCM.LocateEntrantID(EntrantID, HeatID);
    end;
    SCM.qryEntrant.EnableControls;
  end;
end;

procedure TTimeKeeper.scmRefreshLane;
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
  scmRefreshEntrant_Detail;
end;

// procedure TTimeKeeper.scmRefreshEntrantRaceTime;
//
// begin
// if (Assigned(SCM) and SCM.IsActive) then
// begin
// scmRefreshEntrant_Detail;
// end;
// end;

procedure TTimeKeeper.scmUpdateHideClosedSessions;
begin
  if Assigned(SCM) and SCM.qrySession.Active then
  begin
    SCM.qrySession.DisableControls;
    // remove all the strings held in the combobox
    // note cmbSessionList.Clear doesn't work here.
    cmbSessionList.Items.Clear;
    SCM.qrySession.Close;
    // ASSIGN PARAM to display or hide CLOSED sessions
    SCM.qrySession.ParamByName('HIDECLOSED').AsBoolean := fHideClosedSessions;
    SCM.qrySession.Prepare;
    SCM.qrySession.Open;
    SCM.qrySession.EnableControls
  end

  // the datamodule exists but qrySession isn't connected..
  else if (Assigned(SCM)) then
  begin
    // qrySession ISN'T ACTIVE ....
    // update state of qryLane PARAM
    SCM.qrySession.ParamByName('HIDECLOSED').AsBoolean := fHideClosedSessions;
  end;

end;

procedure TTimeKeeper.scmUpdateTabSheetsImages;
begin
  // Update image indicators in the tabsheets.
  if (Assigned(SCM) and SCM.IsActive) then
  begin
    if (fEnableStickyLane) then
    begin
      if (fEnableSuperGlue) then
        // small red pin on tabsheet
        tabEntrantRaceTime.ImageIndex := 1
      else
        // small white pin on tabsheet
        tabEntrantRaceTime.ImageIndex := 0
    end;

    if (fHideClosedSessions) then
      tabLoginSession.ImageIndex := 3
    else
      tabLoginSession.ImageIndex := 2;

    if (fEnableAutoReFresh) then
      tabEventHeat.ImageIndex := 4
    else
      tabEventHeat.ImageIndex := -1;
  end
  // Not connect - hide all
  else
  begin
    tabEntrantRaceTime.ImageIndex := -1;
    tabLoginSession.ImageIndex := -1;
    tabEventHeat.ImageIndex := -1;
  end;
end;

{$ENDREGION}

procedure TTimeKeeper.TabControl1Change(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0:
      lblConnectionStatus.Text := '';

    // each time EVENT..HEAT tabsheet is selected ... refresh data
    1:
      if (fEnableAutoReFresh) then
        actnRefreshExecute(self);
    // Sticky Lane Enabled?
    2:
      begin
        lblConnectionStatus.Text := '';
        scmRefreshLane;
      end;
  end;
end;

procedure TTimeKeeper.Timer1Timer(Sender: TObject);
begin

  fConnectionCountdown := fConnectionCountdown - 1;
  lblAniIndicatorStatus.Text := 'Connecting ' + IntToStr(fConnectionCountdown);

end;

end.
