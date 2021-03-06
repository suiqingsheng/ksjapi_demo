unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TKSJDemoDelphi = class(TForm)
    Panel1: TPanel;
    DeviceComboBox: TComboBox;
    DeviceCount: TLabel;
    ExposureSpinEdit: TSpinEdit;
    GainSpinEdit: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PCloStartEdit: TEdit;
    PRowStartEdit: TEdit;
    PCloSizeEdit: TEdit;
    PRowSizeEdit: TEdit;
    SetPreview: TButton;
    cbPreview: TCheckBox;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CCloStartEdit: TEdit;
    CRowStartEdit: TEdit;
    CCloSizeEdit: TEdit;
    CRowSizeEdit: TEdit;
    SetCapture: TButton;
    Label1: TLabel;
    TimeSpinEdit: TSpinEdit;
    btnCaptureBmp: TButton;
    InvertCheckBox: TCheckBox;
    EnableCheckBox: TCheckBox;
    Label2: TLabel;
    Label13: TLabel;
    TimeoutComboBox: TComboBox;
    Label14: TLabel;
    TriggerModeComboBox: TComboBox;
    Label15: TLabel;
    TriggerMethodComboBox: TComboBox;
    Label16: TLabel;
    TriggerDelaySpinEdit: TSpinEdit;
    Label17: TLabel;
    RecoverCheckBox: TCheckBox;
    Rate: TEdit;
    WBComboBox: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    WBPComboBox: TComboBox;
    Label20: TLabel;
    PhiSpinEdit: TSpinEdit;
    Label21: TLabel;
    REdit: TEdit;
    GEdit: TEdit;
    Label22: TLabel;
    BEdit: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    CCMComboBox: TComboBox;
    CCMPComboBox: TComboBox;
    Label25: TLabel;
    Gain: TGroupBox;
    Gain02Edit: TEdit;
    Gain01Edit: TEdit;
    Gain00Edit: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Gain12Edit: TEdit;
    Label29: TLabel;
    Gain11Edit: TEdit;
    Label30: TLabel;
    Gain10Edit: TEdit;
    Label31: TLabel;
    Gain22Edit: TEdit;
    Label32: TLabel;
    Gain21Edit: TEdit;
    Label33: TLabel;
    Gain20Edit: TEdit;
    Label34: TLabel;
    SetRGBButton: TButton;
    SetGain: TButton;
    procedure btnCaptureBmpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbPreviewClick(Sender: TObject);
    procedure SetPreviewClick(Sender: TObject);
    procedure SetCaptureClick(Sender: TObject);
    procedure ExposureSpinEditChange(Sender: TObject);
    procedure GainSpinEditChange(Sender: TObject);
    procedure DeviceComboBoxChange(Sender: TObject);
    procedure TimeSpinEditChange(Sender: TObject);
    procedure RecoverCheckBoxClick(Sender: TObject);
    procedure InvertCheckBoxClick(Sender: TObject);
    procedure TimeoutComboBoxChange(Sender: TObject);
    procedure TriggerModeComboBoxChange(Sender: TObject);
    procedure TriggerMethodComboBoxChange(Sender: TObject);
    procedure TriggerDelaySpinEditChange(Sender: TObject);
    procedure RateChange(Sender: TObject);
    procedure EnableCheckBoxClick(Sender: TObject);
    procedure UpdateInterface();
    procedure WBComboBoxChange(Sender: TObject);
    procedure WBPComboBoxChange(Sender: TObject);
    procedure PhiSpinEditChange(Sender: TObject);
    procedure SetRGBButtonClick(Sender: TObject);
    procedure SetGainClick(Sender: TObject);
    procedure CCMComboBoxChange(Sender: TObject);
    procedure CCMPComboBoxChange(Sender: TObject);
    procedure UpdateCcmControls();

  private
    { Private declarations }
    m_nDeviceCurSel: Integer;
    fMatrix : array[0..2] of Single;
  public
    { Public declarations }

  end;

var
  KSJDemoDelphi: TKSJDemoDelphi;


const
g_nTimeOut:array[0..5] of Integer = (8000, -1, 500, 1000, 2000, 5000);
g_szTimeOut:array[0..5] of string= ('Default 8S','Infinite','500mS','1S','2S','5S');
g_szTriggerMode:array[0..3] of string= ('Internal','External','Software','Fixed Frame Rate');
g_szTriggerMethod:array[0..3] of string= ('Falling Edge','Rising Edge','High Level','Low Level');
g_szWBMode:array[0..8] of string = ('Disable','Software Presettings','Software Auto Once','Software Auto Continuous','Software Manual','Hardware Presettings','Hardware Auto Once','Hardware Auto Continuous','Hardware Manual');
g_szCCMPresettings:array[0..2] of string= ('Color Temperature 5000K','Color Temperature 6500K','Color Temperature 2800K');
g_szCCMMode:array[0..4] of string= ('Disable','Software Presettings','Software Manual','Hardware Presettings','Hardware Manual');
implementation

uses KSJCode, KSJApiB, KSJApiC;

{$R *.dfm}

// 采集一帧bmp格式的图像
procedure TKSJDemoDelphi.btnCaptureBmpClick(Sender: TObject);
var
nRet, nWidth, nHeight, nBitCount , X, Y: Integer;
pData : PByte;
szFileName : PChar;
pszErrorInfo : PChar;
BitMap : TBitmap;
R, G, B: Byte;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;

pszErrorInfo := AllocMem( 256 );
nRet := KSJ_CaptureGetSizeEx( m_nDeviceCurSel, @nWidth, @nHeight, @nBitCount );
KSJ_GetErrorInfo( nRet, pszErrorInfo  );
if ( nRet <> RET_SUCCESS ) then  MessageBox(0, pszErrorInfo, 'CatchBEST', MB_OK);
pData := AllocMem( nWidth * nHeight * ( nBitCount shr 3 ) );

nRet := KSJ_CaptureRgbData( m_nDeviceCurSel, pData );
KSJ_GetErrorInfo( nRet, pszErrorInfo  );
szFileName := 'Catpture.bmp';
nRet := KSJ_HelperSaveToBmp( pData, nWidth, nHeight, nBitCount, szFileName );
KSJ_GetErrorInfo( nRet, pszErrorInfo  );
if ( nRet <> RET_SUCCESS ) then  MessageBox(0, pszErrorInfo, 'CatchBEST', MB_OK);

BitMap := TBitmap.Create;
BitMap.Width := nWidth;
BitMap.Height := nHeight;
if( nBitCount = 8) then
begin
BitMap.PixelFormat := pf8bit;
for Y := nHeight - 1 downto 0 do
begin
  for X := 0 to nWidth - 1 do
  begin
    B :=  pData^;
    Bitmap.Canvas.Pixels[X, Y] :=  B Shl 16 or B  shl 8 or B;
    Inc(pData);
  end;
end;
end
else
begin
BitMap.PixelFormat := pf24bit;
for Y := nHeight - 1 downto 0 do
begin
  for X := 0 to nWidth - 1 do
  begin
    B :=  pData^;
    Inc(pData);
    G :=  pData^;
    Inc(pData);
    R :=  pData^;
    Bitmap.Canvas.Pixels[X, Y] := B Shl 16 or G  shl 8 or R;
    Inc(pData);
  end;
end;
end;

Dec(pData, nWidth * nHeight * ( nBitCount shr 3 ));

Bitmap.SaveToFile('TBitmap.bmp');

FreeMem( pData );
FreeMem( pszErrorInfo );
FreeAndNil( BitMap );
end;

// 初始化
procedure TKSJDemoDelphi.FormCreate(Sender: TObject);
var
nRet, nDeviceCount, i : Integer;
DeviceType : KSJ_DEVICETYPE;
nIndex     : Integer;
wFwVersion : Word;
strInfo : string;

begin
nRet := KSJ_Init();
if ( nRet <> RET_SUCCESS ) then  MessageBox(0, 'Initial Error.', 'CatchBEST', MB_OK);
m_nDeviceCurSel := 0;
nDeviceCount := KSJ_DeviceGetCount();

for i:=0 to nDeviceCount - 1 do
begin
    KSJ_DeviceGetInformation( i, @DeviceType, @nIndex, @wFwVersion );
    strInfo := Format( 'Type: %02d, Index: 0x%04x, FwVer: 0x%04x', [Integer(DeviceType), nIndex, wFwVersion] );
    DeviceComboBox.Items.Add(strInfo);
end;

for i:=0 to 4 do
begin
    TimeoutComboBox.Items.Add(g_szTimeOut[i]);
end;

for i:=0 to 3 do
begin
    TriggerModeComboBox.Items.Add(g_szTriggerMode[i]);
end;

for i:=0 to 3 do
begin
    TriggerMethodComboBox.Items.Add(g_szTriggerMethod[i]);
end;

for i:=0 to 8 do
begin
    WBComboBox.Items.Add(g_szWBMode[i]);
end;

for i:=0 to 2 do
begin
    WBPComboBox.Items.Add(g_szCCMPresettings[i]);
end;

for i:=0 to 4 do
begin
    CCMComboBox.Items.Add(g_szCCMMode[i]);
end;

for i:=0 to 2 do
begin
    CCMPComboBox.Items.Add(g_szCCMPresettings[i]);
end;

DeviceComboBox.ItemIndex := m_nDeviceCurSel;
UpdateInterface();

end;

procedure TKSJDemoDelphi.UpdateInterface();
var
nMin, nMax, nCur : Integer;
nColumnStart, nRowStart,  nColumnSize, nRowSize, nMode : Integer;
asColumn, asRow : PKSJ_ADDRESSMODE;
bRecover , bEnable, bInvert: Boolean;
TriggerMode : KSJ_TRIGGERMODE;
TriggerMethod : KSJ_TRIGGERMETHOD;
fFixedFrameRate : Single;
WbMode: KSJ_WB_MODE;
ColorTemprature : KSJ_COLOR_TEMPRATURE;
nPhi : Integer;
CcmMode : KSJ_CCM_MODE;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;

KSJ_GetParamRange( m_nDeviceCurSel, KSJ_RED, @nMin, @nMax );
KSJ_GetParam( m_nDeviceCurSel, KSJ_RED, @nCur );
GainSpinEdit.MaxValue := nMax;
GainSpinEdit.MinValue := nMin;
GainSpinEdit.Value := nCur;

KSJ_GetParamRange( m_nDeviceCurSel, KSJ_EXPOSURE_LINES, @nMin, @nMax );
KSJ_GetParam( m_nDeviceCurSel, KSJ_EXPOSURE_LINES, @nCur );
ExposureSpinEdit.MaxValue := nMax;
ExposureSpinEdit.MinValue := nMin;
ExposureSpinEdit.Value := nCur;

KSJ_GetParamRange( m_nDeviceCurSel, KSJ_EXPOSURE, @nMin, @nMax );
KSJ_GetParam( m_nDeviceCurSel, KSJ_EXPOSURE, @nCur );
TimeSpinEdit.MaxValue := nMax;
TimeSpinEdit.MinValue := nMin;
TimeSpinEdit.Value := nCur;

KSJ_PreviewGetFieldOfView( m_nDeviceCurSel, @nColumnStart, @nRowStart, @nColumnSize, @nRowSize, @asColumn, @asRow );
PCloStartEdit.Text := inttostr(nColumnStart);
PRowStartEdit.Text := inttostr(nRowStart);
PCloSizeEdit.Text := inttostr(nColumnSize);
PRowSizeEdit.Text := inttostr(nRowSize);

KSJ_CaptureGetFieldOfView( m_nDeviceCurSel, @nColumnStart, @nRowStart, @nColumnSize, @nRowSize, @asColumn, @asRow );
CCloStartEdit.Text := inttostr(nColumnStart);
CRowStartEdit.Text := inttostr(nRowStart);
CCloSizeEdit.Text := inttostr(nColumnSize);
CRowSizeEdit.Text := inttostr(nRowSize);

KSJ_CaptureSetTimeOut( m_nDeviceCurSel, g_nTimeOut[0]);
TimeoutComboBox.ItemIndex := 0;
KSJ_CaptureGetRecover(m_nDeviceCurSel, @bRecover);
RecoverCheckBox.Checked := bRecover;
KSJ_TriggerModeGet(m_nDeviceCurSel, @TriggerMode);
TriggerModeComboBox.ItemIndex := integer(TriggerMode);
KSJ_TriggerMethodGet(m_nDeviceCurSel, @TriggerMethod);
TriggerMethodComboBox.ItemIndex := integer(TriggerMethod);

KSJ_TriggerDelayGetRange( m_nDeviceCurSel, @nMin, @nMax );
KSJ_TriggerDelayGet( m_nDeviceCurSel, @nCur );
TriggerDelaySpinEdit.MaxValue := nMax;
TriggerDelaySpinEdit.MinValue := nMin;
TriggerDelaySpinEdit.Value := nCur;

KSJ_GetFixedFrameRate(m_nDeviceCurSel, @bEnable, @fFixedFrameRate );
Rate.Text := floatToStr(fFixedFrameRate);
KSJ_FlashControlGet(m_nDeviceCurSel, @bEnable, @bInvert, @nMode);
InvertCheckBox.Checked := bInvert;
EnableCheckBox.Checked := bEnable;

KSJ_WhiteBalanceGet(m_nDeviceCurSel, @WbMode);
WBComboBox.ItemIndex := integer(WbMode);
KSJ_WhiteBalancePresettingGet(m_nDeviceCurSel, @ColorTemprature);
WBPComboBox.ItemIndex := integer(ColorTemprature);
KSJ_WhiteBalanceAutoGet(m_nDeviceCurSel, @nPhi);
PhiSpinEdit.MaxValue := 255;
PhiSpinEdit.MinValue := -255;
PhiSpinEdit.Value := nPhi;

KSJ_WhiteBalanceMatrixGet(m_nDeviceCurSel, fMatrix);
REdit.Text := floatToStr(fMatrix[0]);
GEdit.Text := floatToStr(fMatrix[1]);
BEdit.Text := floatToStr(fMatrix[2]);

KSJ_ColorCorrectionGet(m_nDeviceCurSel, @CcmMode);
CCMComboBox.ItemIndex := integer(CcmMode);
KSJ_ColorCorrectionPresettingGet(m_nDeviceCurSel, @ColorTemprature);
CCMPComboBox.ItemIndex := integer(ColorTemprature);
UpdateCcmControls();

end;

procedure TKSJDemoDelphi.UpdateCcmControls();
var fCcmMatrix : arrays;
begin
KSJ_ColorCorrectionMatrixGet(m_nDeviceCurSel, fCcmMatrix);
Gain00Edit.Text := floatToStr(fCcmMatrix[0][0]);
Gain01Edit.Text := floatToStr(fCcmMatrix[0][1]);
Gain02Edit.Text := floatToStr(fCcmMatrix[0][2]);
Gain10Edit.Text := floatToStr(fCcmMatrix[1][0]);
Gain11Edit.Text := floatToStr(fCcmMatrix[1][1]);
Gain12Edit.Text := floatToStr(fCcmMatrix[1][2]);
Gain20Edit.Text := floatToStr(fCcmMatrix[2][0]);
Gain21Edit.Text := floatToStr(fCcmMatrix[2][1]);
Gain22Edit.Text := floatToStr(fCcmMatrix[2][2]);
end;

// 反初始化
procedure TKSJDemoDelphi.FormClose(Sender: TObject; var Action: TCloseAction);
var
nRet: Integer;
begin
nRet := KSJ_UnInit();
if ( nRet <> RET_SUCCESS ) then  MessageBox(0, 'UnInitial Error.', 'CatchBEST', MB_OK);

end;

// 启动、停止预览视频流
procedure TKSJDemoDelphi.cbPreviewClick(Sender: TObject);
var bStart : Boolean;
begin

if m_nDeviceCurSel=-1 then
begin
  Exit;
end;

bStart := cbPreview.Checked;
KSJ_PreviewSetPos ( m_nDeviceCurSel,  Panel1.handle, 0, 0, Panel1.Width, Panel1.Height );
KSJ_PreviewStartEx( m_nDeviceCurSel, bStart , true);
end;

procedure TKSJDemoDelphi.SetPreviewClick(Sender: TObject);
var nColumnStart, nRowStart,  nColumnSize, nRowSize : Integer;
var asColumn, asRow : PKSJ_ADDRESSMODE;
begin

if m_nDeviceCurSel=-1 then
begin
  Exit;
end;

nColumnStart := strtoint(PCloStartEdit.Text);
nRowStart := strtoint(PRowStartEdit.Text);
nColumnSize := strtoint(PCloSizeEdit.Text);
nRowSize := strtoint(PRowSizeEdit.Text);
KSJ_PreviewSetFieldOfView( m_nDeviceCurSel, nColumnStart, nRowStart, nColumnSize, nRowSize, KSJ_SKIPNONE, KSJ_SKIPNONE );
KSJ_PreviewGetFieldOfView( m_nDeviceCurSel, @nColumnStart, @nRowStart, @nColumnSize, @nRowSize, @asColumn, @asRow );
PCloStartEdit.Text := inttostr(nColumnStart);
PRowStartEdit.Text := inttostr(nRowStart);
PCloSizeEdit.Text := inttostr(nColumnSize);
PRowSizeEdit.Text := inttostr(nRowSize);
end;


procedure TKSJDemoDelphi.SetCaptureClick(Sender: TObject);
var nColumnStart, nRowStart,  nColumnSize, nRowSize : Integer;
var asColumn, asRow : PKSJ_ADDRESSMODE;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
nColumnStart := strtoint(CCloStartEdit.Text);
nRowStart := strtoint(CRowStartEdit.Text);
nColumnSize := strtoint(CCloSizeEdit.Text);
nRowSize := strtoint(CRowSizeEdit.Text);
KSJ_CaptureSetFieldOfView( m_nDeviceCurSel, nColumnStart, nRowStart, nColumnSize, nRowSize, KSJ_SKIPNONE, KSJ_SKIPNONE );
KSJ_CaptureGetFieldOfView( m_nDeviceCurSel, @nColumnStart, @nRowStart, @nColumnSize, @nRowSize, @asColumn, @asRow );
CCloStartEdit.Text := inttostr(nColumnStart);
CRowStartEdit.Text := inttostr(nRowStart);
CCloSizeEdit.Text := inttostr(nColumnSize);
CRowSizeEdit.Text := inttostr(nRowSize);
end;

procedure TKSJDemoDelphi.ExposureSpinEditChange(Sender: TObject);
var nCur : Integer;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
nCur := ExposureSpinEdit.Value;
KSJ_SetParam( m_nDeviceCurSel, KSJ_EXPOSURE_LINES, nCur );
end;

procedure TKSJDemoDelphi.GainSpinEditChange(Sender: TObject);
var nCur : Integer;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;

nCur := GainSpinEdit.Value;
KSJ_SetParam( m_nDeviceCurSel, KSJ_RED, nCur );
KSJ_SetParam( m_nDeviceCurSel, KSJ_GREEN, nCur );
KSJ_SetParam( m_nDeviceCurSel, KSJ_BLUE, nCur );
end;

procedure TKSJDemoDelphi.DeviceComboBoxChange(Sender: TObject);
begin
m_nDeviceCurSel := DeviceComboBox.ItemIndex;
UpdateInterface();
end;

procedure TKSJDemoDelphi.TimeSpinEditChange(Sender: TObject);
var nCur : Integer;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
nCur := TimeSpinEdit.Value;
KSJ_SetParam( m_nDeviceCurSel, KSJ_EXPOSURE, nCur );
end;

procedure TKSJDemoDelphi.RecoverCheckBoxClick(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_CaptureSetRecover(m_nDeviceCurSel, RecoverCheckBox.Checked);
end;

procedure TKSJDemoDelphi.InvertCheckBoxClick(Sender: TObject);
var bEnable, bInvert: Boolean;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
bEnable :=  EnableCheckBox.Checked;
bInvert :=  InvertCheckBox.Checked;
KSJ_FlashControlSet( m_nDeviceCurSel, bEnable,  bInvert, 0);
end;

procedure TKSJDemoDelphi.TimeoutComboBoxChange(Sender: TObject);
const g_nTimeOut:array[0..5] of Integer = (8000, -1, 500, 1000, 2000, 5000);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_CaptureSetTimeOut(m_nDeviceCurSel, g_nTimeOut[TimeoutComboBox.ItemIndex]);
end;

procedure TKSJDemoDelphi.TriggerModeComboBoxChange(Sender: TObject);
const g_szTriggerMode:array[0..3] of string= ('Internal','External','Software','Fixed Frame Rate');
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_TriggerModeSet(m_nDeviceCurSel, KSJ_TRIGGERMODE(TriggerModeComboBox.ItemIndex));
end;

procedure TKSJDemoDelphi.TriggerMethodComboBoxChange(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_TriggerMethodSet(m_nDeviceCurSel, KSJ_TRIGGERMETHOD(TriggerMethodComboBox.ItemIndex));
end;

procedure TKSJDemoDelphi.TriggerDelaySpinEditChange(Sender: TObject);
var nCur : Integer;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
nCur := TriggerDelaySpinEdit.Value;
KSJ_TriggerDelaySet(m_nDeviceCurSel, nCur);
end;

procedure TKSJDemoDelphi.RateChange(Sender: TObject);
var fFrameRate : Single;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
  fFrameRate := strToFloat(Rate.Text);
  KSJ_SetFixedFrameRate(m_nDeviceCurSel, true, fFrameRate);
end;

procedure TKSJDemoDelphi.EnableCheckBoxClick(Sender: TObject);
var bEnable, bInvert: Boolean;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
bEnable :=  EnableCheckBox.Checked;
bInvert :=  InvertCheckBox.Checked;
KSJ_FlashControlSet( m_nDeviceCurSel, bEnable,  bInvert, 0);
end;

procedure WBACALLBACK( fBackMatrix :array of Single; lpContext : Integer ); stdcall;
begin
KSJDemoDelphi.REdit.Text := floatToStr(fBackMatrix[0]);
KSJDemoDelphi.GEdit.Text := floatToStr(fBackMatrix[1]);
KSJDemoDelphi.BEdit.Text := floatToStr(fBackMatrix[2]);
end;


procedure TKSJDemoDelphi.WBComboBoxChange(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_WhiteBalanceSet(m_nDeviceCurSel, KSJ_WB_MODE(WBComboBox.ItemIndex));
KSJ_WhiteBalanceAutoSetCallBack(m_nDeviceCurSel, WBACALLBACK, 0);
end;

procedure TKSJDemoDelphi.WBPComboBoxChange(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_WhiteBalancePresettingSet(m_nDeviceCurSel, KSJ_COLOR_TEMPRATURE(WBPComboBox.ItemIndex));
end;

procedure TKSJDemoDelphi.PhiSpinEditChange(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_WhiteBalanceAutoSet(m_nDeviceCurSel, PhiSpinEdit.Value);
end;


procedure TKSJDemoDelphi.SetRGBButtonClick(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
  fMatrix[0] := strToFloat(REdit.Text);
  fMatrix[1] := strToFloat(GEdit.Text);
  fMatrix[2] := strToFloat(BEdit.Text);
  KSJ_WhiteBalanceMatrixSet(m_nDeviceCurSel, fMatrix);
end;

procedure TKSJDemoDelphi.SetGainClick(Sender: TObject);
var fCcmMatrix : arrays;
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
   fCcmMatrix[0][0] := strToFloat(Gain00Edit.Text);
   fCcmMatrix[0][1] := strToFloat(Gain01Edit.Text);
   fCcmMatrix[0][2] := strToFloat(Gain02Edit.Text);
   fCcmMatrix[1][0] := strToFloat(Gain10Edit.Text);
   fCcmMatrix[1][1] := strToFloat(Gain11Edit.Text);
   fCcmMatrix[1][2] := strToFloat(Gain12Edit.Text);
   fCcmMatrix[2][0] := strToFloat(Gain20Edit.Text);
   fCcmMatrix[2][1] := strToFloat(Gain21Edit.Text);
   fCcmMatrix[2][2] := strToFloat(Gain22Edit.Text);
   KSJ_ColorCorrectionMatrixSet(m_nDeviceCurSel, fCcmMatrix);
end;

procedure TKSJDemoDelphi.CCMComboBoxChange(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_ColorCorrectionSet(m_nDeviceCurSel, KSJ_CCM_MODE(CCMComboBox.ItemIndex));
end;

procedure TKSJDemoDelphi.CCMPComboBoxChange(Sender: TObject);
begin
if m_nDeviceCurSel=-1 then
begin
  Exit;
end;
KSJ_ColorCorrectionPresettingSet(m_nDeviceCurSel, KSJ_COLOR_TEMPRATURE(CCMPComboBox.ItemIndex));
UpdateCcmControls();
end;

end.

