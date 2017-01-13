Attribute VB_Name = "KSJAPIBase"
Option Explicit



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'���Ӽѹ�ҵ����豸���Ͷ���
Enum KSJ_DEVICETYPE
    KSJ_UC130C_MRNN = 0
    KSJ_UC130M_MRNN
    KSJ_UC200C_MRNN
    KSJ_UC320C_MRNN
    KSJ_UC130C_MRYN
    KSJ_UC130M_MRYN
    KSJ_UC200C_MRYN
    KSJ_UC320C_MRYN
    KSJ_UC500C_MRNN
    KSJ_UC500M_MRNN
    KSJ_UC500C_MRYN
    KSJ_UC500M_MRYN
    KSJ_UC320C_OCR
    KSJ_UC900C_MRNN
    KSJ_UC1000C_MRNN
    KSJ_UC900C_MRYN
    KSJ_UC1000C_MRYN
    KSJ_UC130C_MRYY
    KSJ_UC130M_MRYY
    KSJ_UD140C_SRNN
    KSJ_UD140M_SRNN
    KSJ_UC36C_MGNN
    KSJ_UC36M_MGNN
    KSJ_UC36C_MGYN
    KSJ_UC36M_MGYN
    KSJ_UC900C_MRYY
    KSJ_UC1000C_MRYY
    KSJ_UC1400C_MRYY
    KSJ_UC36C_MGYY
    KSJ_UC36M_MGYY
    KSJ_UC320C_MRYY
    KSJ_UC500C_MRYY
    KSJ_UC500M_MRYY
    KSJ_MUC130C_MRYN
    KSJ_MUC130M_MRYN
    KSJ_MUC320C_MRYN
    KSJ_MUC36C_MGYY
    KSJ_MUC36M_MGYY
    KSJ_MUC130C_MRYY
    KSJ_MUC130M_MRYY
    KSJ_MUC320C_MRYY
    KSJ_MUC500C_MRYY
    KSJ_MUC500M_MRYY
    KSJ_MUC900C_MRYY
    KSJ_MUC1000C_MRYY
    KSJ_MUC1400C_MRYY
    KSJ_UD205C_SGYY
    KSJ_UD205M_SGYY
    KSJ_UD274C_SGYY
    KSJ_UD274M_SGYY
    KSJ_UD285C_SGYY
    KSJ_UD285M_SGYY
    KSJ_MU3C500C_MRYY
    KSJ_MU3C500M_MRYY
    KSJ_MU3C1000C_MRYY
    KSJ_MU3C1400C_MRYY
    KSJ_MU3V130C_CGYY
    KSJ_MU3V130M_CGYY
End Enum

'Enable or Disable Log output
Public Declare Function KSJ_LogSet Lib "KSJAPI.dll" (ByVal bEnable As Boolean, ByVal szFolder As String) As Long

'Get Log Status
Public Declare Function KSJ_LogGet Lib "KSJAPI.dll" (ByRef bEnable As Boolean, ByRef szFolder As String) As Long

'Get KSJApi.dll Version, call any time
Public Declare Function KSJ_GetVersion Lib "KSJAPI.dll" (ByRef pnMaj1 As Integer, ByRef pnMaj2 As Integer, ByRef pnMin1 As Integer, ByRef pnMin2 As Integer) As Long

'��ô������ϸ��Ϣ���������κ�ʱ�����
Public Declare Function KSJ_GetErrorInfo Lib "KSJAPI.dll" (ByVal nErrorNo As Long, ByVal pszErrorInfo As String) As Long

'��ʼ��KSJApi��̬��
Public Declare Function KSJ_Init Lib "KSJAPI.dll" () As Long

'����ʼ��KSJApi��̬��
Public Declare Function KSJ_UnInit Lib "KSJAPI.dll" () As Long

'�õ��豸��Ŀ
Public Declare Function KSJ_DeviceGetCount Lib "KSJAPI.dll" () As Long

Public Declare Function KSJ_WrEEPROM Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal uRomAddress As Integer, ByVal btValue As Byte) As Long
Public Declare Function KSJ_RdEEPROM Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal uRomAddress As Integer, ByRef btValue As Byte) As Long

'�õ��豸��Ϣ���ͺţ���ţ��̼��汾�ţ�
Public Declare Function KSJ_DeviceGetInformation Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pDeviceType As KSJ_DEVICETYPE, ByRef pnIndex As Long, ByRef pwFirmwareVersion As Integer) As Long

'�õ��豸��Ϣ���ͺţ���ţ��̼��汾�ţ�
Public Declare Function KSJ_DeviceGetInformationEx Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pDeviceType As KSJ_DEVICETYPE, ByRef pnIndex As Long, ByRef pwFirmwareVersion As Integer, ByRef pwFpgaVersion As Integer) As Long

'����������
Enum KSJ_PARAM
    KSJ_EXPOSURE = 0
    KSJ_RED = 1
    KSJ_GREEN = 2
    KSJ_BLUE = 3
    KSJ_GAMMA = 4
    KSJ_PREVIEW_COLUMNSTART = 5
    KSJ_PREVIEW_ROWSTART = 6
    KSJ_CAPTURE_COLUMNSTART = 7
    KSJ_CAPTURE_ROWSTART = 8
    KSJ_HORIZONTALBLANK = 9
    KSJ_VERTICALBLANK = 10
    KSJ_FLIP = 11
    KSJ_BIN = 12
    KSJ_MIRROR = 13
    KSJ_CONTRAST = 14
    KSJ_BRIGHTNESS = 15
    KSJ_VGAGAIN = 16
    KSJ_CLAMPLEVEL = 17
    KSJ_CDSGAIN = 18
    KSJ_RED_SHIFT = 19
    KSJ_GREEN_SHIFT = 20
    KSJ_BLUE_SHIFT = 21
    KSJ_COMPANDING = 22
    KSJ_EXPOSURE_LINES = 23
    KSJ_SATURATION = 24
End Enum

'��ò��������÷�Χ
Public Declare Function KSJ_GetParamRange Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal Param As KSJ_PARAM, ByRef pnMinValue As Long, ByRef pnMaxValue As Long) As Long

'���ò���
Public Declare Function KSJ_SetParam Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal Param As KSJ_PARAM, ByVal nValue As Long) As Long

'��ȡ����
Public Declare Function KSJ_GetParam Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal Param As KSJ_PARAM, ByRef pnValue As Long) As Long

'Set Exposure Time (ms) for float format.( more precision )
Public Declare Function KSJ_ExposureTimeSet Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal fExpTimeMs As Single) As Long

'Get Exposure Time (ms) for float format
Public Declare Function KSJ_ExposureTimeGet Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef fExpTimeMs As Single) As Long

'���ģʽ���壨��Ϊ�г����г�㣩
Enum KSJ_ADDRESSMODE
    KSJ_SKIPNONE = 0
    KSJ_SKIP2
    KSJ_SKIP3
    KSJ_SKIP4
    KSJ_SKIP8
End Enum

'Get The Max Capture FOV( Field Of View �� supported by device
Public Declare Function KSJ_CaptureGetDefaultFieldOfView Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal nColumnStart As Long, ByVal nRowStart As Long, ByVal nColumnSize As Long, ByVal nRowSize As Long, ByVal ColumnAddressMode As KSJ_ADDRESSMODE, ByVal RowAddressMode As KSJ_ADDRESSMODE) As Long

'���òɼ��ӳ���С
Public Declare Function KSJ_CaptureSetFieldOfView Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal nColumnStart As Long, ByVal nRowStart As Long, ByVal nColumnSize As Long, ByVal nRowSize As Long, ByVal ColumnAddressMode As KSJ_ADDRESSMODE, ByVal RowAddressMode As KSJ_ADDRESSMODE) As Long

'��ȡ�ɼ��ӳ���ʵ�ʴ�С
Public Declare Function KSJ_CaptureGetFieldOfView Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef nColumnStart As Long, ByRef nRowStart As Long, ByRef nColumnSize As Long, ByRef nRowSize As Long, ByRef ColumnAddressMode As KSJ_ADDRESSMODE, ByRef RowAddressMode As KSJ_ADDRESSMODE) As Long

'�õ��ɼ�ͼ��Ŀ��Ⱥ͸߶ȣ���λ�����أ�
Public Declare Function KSJ_CaptureGetSize Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pnWidth As Long, ByRef pnHeight As Long) As Long

'�õ��ɼ�ͼ��Ŀ��Ⱥ͸߶ȣ���λ�����أ�
Public Declare Function KSJ_CaptureGetSizeEx Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pnWidth As Long, ByRef pnHeight As Long, ByRef pnBitCount As Long) As Long

'�ɼ�һ֡ԭʼ����ͼ������
Public Declare Function KSJ_CaptureRawData Lib "KSJAPI.dll" (ByVal nChannel As Long, pRawData As Any) As Long

'�ɼ�һ֡24λ��ɫͼ������
Public Declare Function KSJ_CaptureRgbData Lib "KSJAPI.dll" (ByVal nChannel As Long, pRgbData As Any) As Long

'�ɼ�һ֡24λ��ɫͼ������
Public Declare Function KSJ_CaptureRgbDataEx Lib "KSJAPI.dll" (ByVal nChannel As Long, pRgbData As Any, ByRef pnWidth As Long, ByRef pnHeight As Long, ByRef pnBitCount As Long) As Long
 
 '����ΪBmp�ļ�
Public Declare Function KSJ_HelperSaveToBmp Lib "KSJAPI.dll" (pData As Any, ByVal nWidth As Long, ByVal nHeight As Long, ByVal nBitCount As Long, ByVal pszFileName As String) As Long

'����ΪJpg�ļ�
Public Declare Function KSJ_HelperSaveToJpg Lib "KSJAPI.dll" (ByVal pData As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal nBitCount As Long, ByVal nQulity As Long, ByVal pszFileName As String) As Long
 
'Get The Max Preview FOV( Field Of View �� supported by device
Public Declare Function KSJ_PreviewGetDefaultFieldOfView Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef nColumnStart As Long, ByRef nRowStart As Long, ByRef nColumnSize As Long, ByRef nRowSize As Long, ByRef ColumnAddressMode As KSJ_ADDRESSMODE, ByRef RowAddressMode As KSJ_ADDRESSMODE) As Long
 
'����Ԥ���ӳ�
Public Declare Function KSJ_PreviewSetFieldOfView Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal nColumnStart As Long, ByVal nRowStart As Long, ByVal nColumnSize As Long, ByVal nRowSize As Long, ByVal ColumnAddressMode As KSJ_ADDRESSMODE, ByVal RowAddressMode As KSJ_ADDRESSMODE) As Long

'��ȡԤ���ӳ�
Public Declare Function KSJ_PreviewGetFieldOfView Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef nColumnStart As Long, ByRef nRowStart As Long, ByRef nColumnSize As Long, ByRef nRowSize As Long, ByRef ColumnAddressMode As KSJ_ADDRESSMODE, ByRef RowAddressMode As KSJ_ADDRESSMODE) As Long

'��ȡ���û����õ��ӳ�ģʽ�£�Ԥ��ͼ��Ŀ��Ⱥ͸߶ȣ����أ�
Public Declare Function KSJ_PreviewGetSize Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pnWidth As Long, ByRef pnHeight As Long) As Long

'��ȡ���û����õ��ӳ�ģʽ�£�Ԥ��ͼ��Ŀ��ȣ����أ��͸߶ȣ����أ�������λ��
Public Declare Function KSJ_PreviewGetSizeEx Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pnWidth As Long, ByRef pnHeight As Long, ByRef pnBitCount As Long) As Long
 
'����Ԥ��ͼ�����ʾλ��
Public Declare Function KSJ_PreviewSetPos Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal hwnd As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long

'��ȡԤ��ͼ�����ʾλ��
Public Declare Function KSJ_PreviewGetPos Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef px As Long, ByRef py As Long, ByRef pnWidth As Long, ByRef pnHeight As Long) As Long
 
Enum KSJ_PREVIEWMODE
    PM_RAWDATA = 0
    PM_RGBDATA
End Enum

'����Ԥ��ģʽ
Public Declare Function KSJ_PreviewSetMode Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal PreviewMode As KSJ_PREVIEWMODE) As Long

'��ȡԤ��ģʽ
Public Declare Function KSJ_PreviewGetMode Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pPreviewMode As KSJ_PREVIEWMODE) As Long
 
'��ȡĬ��Ԥ��ģʽ
Public Declare Function KSJ_PreviewGetDefaultMode Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pPreviewMode As KSJ_PREVIEWMODE) As Long
 
'������ֹͣԤ��
Public Declare Function KSJ_PreviewStart Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal bStart As Boolean) As Long

'��ͣ�����Ԥ��
Public Declare Function KSJ_PreviewPause Lib "KSJAPI.dll" (ByVal nChannel As Long, ByVal bPause As Boolean) As Long

Enum KSJ_PREVIEWSTATUS
    PS_STOP
    PS_START
    PS_PAUSE
End Enum

'Get Preview Status
Public Declare Function KSJ_PreviewGetStatus Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef pPreviewStatus As KSJ_PREVIEWSTATUS) As Long

'Get Preview Frame Rate
Public Declare Function KSJ_PreviewGetFrameRate Lib "KSJAPI.dll" (ByVal nChannel As Long, ByRef fFrameRate As Single) As Long

'Get Paused Image Data when PS_PAUSE Status
Public Declare Function KSJ_PreviewGetPausedData Lib "KSJAPI.dll" (ByVal nChannel As Long, pData As Any) As Long

'Get Paused Image Data when PS_PAUSE Status
Public Declare Function KSJ_PreviewGetPausedDataEx Lib "KSJAPI.dll" (ByVal nChannel As Long, pData As Any, ByRef pnWidth As Long, ByRef pnHeight As Long, ByRef pnBitCount As Long) As Long
