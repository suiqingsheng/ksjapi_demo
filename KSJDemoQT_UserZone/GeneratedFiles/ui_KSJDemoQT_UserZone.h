/********************************************************************************
** Form generated from reading UI file 'KSJDemoQT_UserZone.ui'
**
** Created by: Qt User Interface Compiler version 5.7.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_KSJDEMOQT_USERZONE_H
#define UI_KSJDEMOQT_USERZONE_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QCheckBox>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_KSJDemoQT_UserZone
{
public:
    QWidget *PREVIEWWND_Widget;
    QLabel *DEVICENUM_Label;
    QComboBox *DEVICE_LIST_ComboBox;
    QSpinBox *ExposureLinesSpinBox;
    QSpinBox *GainSpinBox;
    QLabel *label_6;
    QLabel *label_7;
    QLabel *label_8;
    QSpinBox *ExposureTimeSpinBox;
    QLabel *label_9;
    QLabel *label_10;
    QLabel *label_11;
    QLabel *EXPOSURE_TIME_RANGE_Label;
    QLabel *EXPOSURE_LINES_RANGE_Label;
    QLabel *GAIN_RANGE_Label;
    QLabel *EXPOSURE_TIME_REAL_Label;
    QLabel *FOV_RANGE_Label;
    QLabel *label_12;
    QGroupBox *groupBox;
    QLabel *label;
    QLabel *label_2;
    QLabel *label_3;
    QLabel *label_4;
    QLabel *label_5;
    QPushButton *SetPreviewFovButton;
    QSpinBox *PreviewColStartSpinBox;
    QSpinBox *PreviewColSizeSpinBox;
    QSpinBox *PreviewRowStartSpinBox;
    QSpinBox *PreviewRowSizeSpinBox;
    QSpinBox *PreviewMultiFrameSpinBox;
    QGroupBox *groupBox_2;
    QLabel *label_18;
    QLabel *label_19;
    QLabel *label_20;
    QLabel *label_21;
    QLabel *label_22;
    QPushButton *SetCaptureFovButton;
    QSpinBox *CaptureColStartSpinBox;
    QSpinBox *CaptureColSizeSpinBox;
    QSpinBox *CaptureRowStartSpinBox;
    QSpinBox *CaptureRowSizeSpinBox;
    QSpinBox *CaptureMultiFrameSpinBox;
    QPushButton *PreviewButton;
    QPushButton *CaptureButton;
    QLabel *ERROR_INFO_Label;
    QLabel *ELAPSE_TIME_Label;
    QTableWidget *FunctionTableWidget;
    QCheckBox *SaveCheckBox;
    QLabel *label_13;
    QLabel *label_14;
    QLineEdit *AddressEdit;
    QLabel *label_15;
    QLineEdit *ValueEdit;
    QPushButton *WriteButton;
    QPushButton *ReadButton;
    QLineEdit *TypeEdit;
    QLabel *label_16;
    QLineEdit *RangeEdit;

    void setupUi(QDialog *KSJDemoQT_UserZone)
    {
        if (KSJDemoQT_UserZone->objectName().isEmpty())
            KSJDemoQT_UserZone->setObjectName(QStringLiteral("KSJDemoQT_UserZone"));
        KSJDemoQT_UserZone->resize(1180, 561);
        PREVIEWWND_Widget = new QWidget(KSJDemoQT_UserZone);
        PREVIEWWND_Widget->setObjectName(QStringLiteral("PREVIEWWND_Widget"));
        PREVIEWWND_Widget->setGeometry(QRect(-10, 0, 501, 561));
        DEVICENUM_Label = new QLabel(KSJDemoQT_UserZone);
        DEVICENUM_Label->setObjectName(QStringLiteral("DEVICENUM_Label"));
        DEVICENUM_Label->setGeometry(QRect(510, 20, 71, 21));
        DEVICE_LIST_ComboBox = new QComboBox(KSJDemoQT_UserZone);
        DEVICE_LIST_ComboBox->setObjectName(QStringLiteral("DEVICE_LIST_ComboBox"));
        DEVICE_LIST_ComboBox->setGeometry(QRect(590, 20, 301, 22));
        ExposureLinesSpinBox = new QSpinBox(KSJDemoQT_UserZone);
        ExposureLinesSpinBox->setObjectName(QStringLiteral("ExposureLinesSpinBox"));
        ExposureLinesSpinBox->setGeometry(QRect(640, 100, 91, 22));
        GainSpinBox = new QSpinBox(KSJDemoQT_UserZone);
        GainSpinBox->setObjectName(QStringLiteral("GainSpinBox"));
        GainSpinBox->setGeometry(QRect(640, 170, 91, 22));
        label_6 = new QLabel(KSJDemoQT_UserZone);
        label_6->setObjectName(QStringLiteral("label_6"));
        label_6->setGeometry(QRect(600, 170, 41, 21));
        label_7 = new QLabel(KSJDemoQT_UserZone);
        label_7->setObjectName(QStringLiteral("label_7"));
        label_7->setGeometry(QRect(520, 60, 111, 21));
        label_8 = new QLabel(KSJDemoQT_UserZone);
        label_8->setObjectName(QStringLiteral("label_8"));
        label_8->setGeometry(QRect(530, 100, 91, 21));
        ExposureTimeSpinBox = new QSpinBox(KSJDemoQT_UserZone);
        ExposureTimeSpinBox->setObjectName(QStringLiteral("ExposureTimeSpinBox"));
        ExposureTimeSpinBox->setGeometry(QRect(640, 60, 91, 22));
        label_9 = new QLabel(KSJDemoQT_UserZone);
        label_9->setObjectName(QStringLiteral("label_9"));
        label_9->setGeometry(QRect(760, 60, 61, 21));
        label_10 = new QLabel(KSJDemoQT_UserZone);
        label_10->setObjectName(QStringLiteral("label_10"));
        label_10->setGeometry(QRect(760, 100, 41, 21));
        label_11 = new QLabel(KSJDemoQT_UserZone);
        label_11->setObjectName(QStringLiteral("label_11"));
        label_11->setGeometry(QRect(760, 170, 41, 21));
        EXPOSURE_TIME_RANGE_Label = new QLabel(KSJDemoQT_UserZone);
        EXPOSURE_TIME_RANGE_Label->setObjectName(QStringLiteral("EXPOSURE_TIME_RANGE_Label"));
        EXPOSURE_TIME_RANGE_Label->setGeometry(QRect(830, 60, 71, 21));
        EXPOSURE_LINES_RANGE_Label = new QLabel(KSJDemoQT_UserZone);
        EXPOSURE_LINES_RANGE_Label->setObjectName(QStringLiteral("EXPOSURE_LINES_RANGE_Label"));
        EXPOSURE_LINES_RANGE_Label->setGeometry(QRect(830, 100, 71, 21));
        GAIN_RANGE_Label = new QLabel(KSJDemoQT_UserZone);
        GAIN_RANGE_Label->setObjectName(QStringLiteral("GAIN_RANGE_Label"));
        GAIN_RANGE_Label->setGeometry(QRect(830, 170, 71, 21));
        EXPOSURE_TIME_REAL_Label = new QLabel(KSJDemoQT_UserZone);
        EXPOSURE_TIME_REAL_Label->setObjectName(QStringLiteral("EXPOSURE_TIME_REAL_Label"));
        EXPOSURE_TIME_REAL_Label->setGeometry(QRect(640, 140, 201, 21));
        FOV_RANGE_Label = new QLabel(KSJDemoQT_UserZone);
        FOV_RANGE_Label->setObjectName(QStringLiteral("FOV_RANGE_Label"));
        FOV_RANGE_Label->setGeometry(QRect(640, 200, 201, 21));
        label_12 = new QLabel(KSJDemoQT_UserZone);
        label_12->setObjectName(QStringLiteral("label_12"));
        label_12->setGeometry(QRect(570, 200, 61, 21));
        groupBox = new QGroupBox(KSJDemoQT_UserZone);
        groupBox->setObjectName(QStringLiteral("groupBox"));
        groupBox->setGeometry(QRect(500, 230, 331, 141));
        label = new QLabel(groupBox);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(20, 20, 61, 21));
        label_2 = new QLabel(groupBox);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(180, 20, 61, 21));
        label_3 = new QLabel(groupBox);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(20, 60, 61, 21));
        label_4 = new QLabel(groupBox);
        label_4->setObjectName(QStringLiteral("label_4"));
        label_4->setGeometry(QRect(180, 60, 61, 21));
        label_5 = new QLabel(groupBox);
        label_5->setObjectName(QStringLiteral("label_5"));
        label_5->setGeometry(QRect(10, 100, 71, 21));
        SetPreviewFovButton = new QPushButton(groupBox);
        SetPreviewFovButton->setObjectName(QStringLiteral("SetPreviewFovButton"));
        SetPreviewFovButton->setGeometry(QRect(180, 100, 111, 23));
        PreviewColStartSpinBox = new QSpinBox(groupBox);
        PreviewColStartSpinBox->setObjectName(QStringLiteral("PreviewColStartSpinBox"));
        PreviewColStartSpinBox->setGeometry(QRect(90, 20, 71, 22));
        PreviewColSizeSpinBox = new QSpinBox(groupBox);
        PreviewColSizeSpinBox->setObjectName(QStringLiteral("PreviewColSizeSpinBox"));
        PreviewColSizeSpinBox->setGeometry(QRect(90, 60, 71, 22));
        PreviewRowStartSpinBox = new QSpinBox(groupBox);
        PreviewRowStartSpinBox->setObjectName(QStringLiteral("PreviewRowStartSpinBox"));
        PreviewRowStartSpinBox->setGeometry(QRect(240, 20, 71, 22));
        PreviewRowSizeSpinBox = new QSpinBox(groupBox);
        PreviewRowSizeSpinBox->setObjectName(QStringLiteral("PreviewRowSizeSpinBox"));
        PreviewRowSizeSpinBox->setGeometry(QRect(240, 60, 71, 22));
        PreviewMultiFrameSpinBox = new QSpinBox(groupBox);
        PreviewMultiFrameSpinBox->setObjectName(QStringLiteral("PreviewMultiFrameSpinBox"));
        PreviewMultiFrameSpinBox->setGeometry(QRect(90, 100, 71, 22));
        groupBox_2 = new QGroupBox(KSJDemoQT_UserZone);
        groupBox_2->setObjectName(QStringLiteral("groupBox_2"));
        groupBox_2->setGeometry(QRect(500, 370, 331, 141));
        label_18 = new QLabel(groupBox_2);
        label_18->setObjectName(QStringLiteral("label_18"));
        label_18->setGeometry(QRect(20, 20, 61, 21));
        label_19 = new QLabel(groupBox_2);
        label_19->setObjectName(QStringLiteral("label_19"));
        label_19->setGeometry(QRect(180, 20, 61, 21));
        label_20 = new QLabel(groupBox_2);
        label_20->setObjectName(QStringLiteral("label_20"));
        label_20->setGeometry(QRect(20, 60, 61, 21));
        label_21 = new QLabel(groupBox_2);
        label_21->setObjectName(QStringLiteral("label_21"));
        label_21->setGeometry(QRect(180, 60, 61, 21));
        label_22 = new QLabel(groupBox_2);
        label_22->setObjectName(QStringLiteral("label_22"));
        label_22->setGeometry(QRect(10, 100, 71, 21));
        SetCaptureFovButton = new QPushButton(groupBox_2);
        SetCaptureFovButton->setObjectName(QStringLiteral("SetCaptureFovButton"));
        SetCaptureFovButton->setGeometry(QRect(180, 100, 111, 23));
        CaptureColStartSpinBox = new QSpinBox(groupBox_2);
        CaptureColStartSpinBox->setObjectName(QStringLiteral("CaptureColStartSpinBox"));
        CaptureColStartSpinBox->setGeometry(QRect(90, 20, 71, 22));
        CaptureColSizeSpinBox = new QSpinBox(groupBox_2);
        CaptureColSizeSpinBox->setObjectName(QStringLiteral("CaptureColSizeSpinBox"));
        CaptureColSizeSpinBox->setGeometry(QRect(90, 60, 71, 22));
        CaptureRowStartSpinBox = new QSpinBox(groupBox_2);
        CaptureRowStartSpinBox->setObjectName(QStringLiteral("CaptureRowStartSpinBox"));
        CaptureRowStartSpinBox->setGeometry(QRect(240, 20, 71, 22));
        CaptureRowSizeSpinBox = new QSpinBox(groupBox_2);
        CaptureRowSizeSpinBox->setObjectName(QStringLiteral("CaptureRowSizeSpinBox"));
        CaptureRowSizeSpinBox->setGeometry(QRect(240, 60, 71, 22));
        CaptureMultiFrameSpinBox = new QSpinBox(groupBox_2);
        CaptureMultiFrameSpinBox->setObjectName(QStringLiteral("CaptureMultiFrameSpinBox"));
        CaptureMultiFrameSpinBox->setGeometry(QRect(90, 100, 71, 22));
        PreviewButton = new QPushButton(KSJDemoQT_UserZone);
        PreviewButton->setObjectName(QStringLiteral("PreviewButton"));
        PreviewButton->setGeometry(QRect(840, 340, 75, 23));
        CaptureButton = new QPushButton(KSJDemoQT_UserZone);
        CaptureButton->setObjectName(QStringLiteral("CaptureButton"));
        CaptureButton->setGeometry(QRect(840, 480, 75, 23));
        ERROR_INFO_Label = new QLabel(KSJDemoQT_UserZone);
        ERROR_INFO_Label->setObjectName(QStringLiteral("ERROR_INFO_Label"));
        ERROR_INFO_Label->setGeometry(QRect(510, 530, 201, 21));
        ELAPSE_TIME_Label = new QLabel(KSJDemoQT_UserZone);
        ELAPSE_TIME_Label->setObjectName(QStringLiteral("ELAPSE_TIME_Label"));
        ELAPSE_TIME_Label->setGeometry(QRect(740, 530, 121, 21));
        FunctionTableWidget = new QTableWidget(KSJDemoQT_UserZone);
        FunctionTableWidget->setObjectName(QStringLiteral("FunctionTableWidget"));
        FunctionTableWidget->setGeometry(QRect(920, 0, 261, 311));
        SaveCheckBox = new QCheckBox(KSJDemoQT_UserZone);
        SaveCheckBox->setObjectName(QStringLiteral("SaveCheckBox"));
        SaveCheckBox->setGeometry(QRect(840, 450, 71, 20));
        label_13 = new QLabel(KSJDemoQT_UserZone);
        label_13->setObjectName(QStringLiteral("label_13"));
        label_13->setGeometry(QRect(930, 330, 71, 21));
        label_14 = new QLabel(KSJDemoQT_UserZone);
        label_14->setObjectName(QStringLiteral("label_14"));
        label_14->setGeometry(QRect(930, 410, 80, 21));
        AddressEdit = new QLineEdit(KSJDemoQT_UserZone);
        AddressEdit->setObjectName(QStringLiteral("AddressEdit"));
        AddressEdit->setGeometry(QRect(1010, 410, 121, 20));
        label_15 = new QLabel(KSJDemoQT_UserZone);
        label_15->setObjectName(QStringLiteral("label_15"));
        label_15->setGeometry(QRect(940, 450, 71, 21));
        ValueEdit = new QLineEdit(KSJDemoQT_UserZone);
        ValueEdit->setObjectName(QStringLiteral("ValueEdit"));
        ValueEdit->setGeometry(QRect(1010, 450, 121, 20));
        WriteButton = new QPushButton(KSJDemoQT_UserZone);
        WriteButton->setObjectName(QStringLiteral("WriteButton"));
        WriteButton->setGeometry(QRect(940, 490, 75, 23));
        ReadButton = new QPushButton(KSJDemoQT_UserZone);
        ReadButton->setObjectName(QStringLiteral("ReadButton"));
        ReadButton->setGeometry(QRect(1050, 490, 75, 23));
        TypeEdit = new QLineEdit(KSJDemoQT_UserZone);
        TypeEdit->setObjectName(QStringLiteral("TypeEdit"));
        TypeEdit->setGeometry(QRect(1010, 330, 121, 20));
        TypeEdit->setReadOnly(true);
        label_16 = new QLabel(KSJDemoQT_UserZone);
        label_16->setObjectName(QStringLiteral("label_16"));
        label_16->setGeometry(QRect(930, 370, 71, 21));
        RangeEdit = new QLineEdit(KSJDemoQT_UserZone);
        RangeEdit->setObjectName(QStringLiteral("RangeEdit"));
        RangeEdit->setGeometry(QRect(1010, 370, 121, 20));
        RangeEdit->setReadOnly(true);

        retranslateUi(KSJDemoQT_UserZone);

        QMetaObject::connectSlotsByName(KSJDemoQT_UserZone);
    } // setupUi

    void retranslateUi(QDialog *KSJDemoQT_UserZone)
    {
        KSJDemoQT_UserZone->setWindowTitle(QApplication::translate("KSJDemoQT_UserZone", "KSJDemoQT", 0));
        DEVICENUM_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "Device Num:", 0));
        label_6->setText(QApplication::translate("KSJDemoQT_UserZone", "Gain:", 0));
        label_7->setText(QApplication::translate("KSJDemoQT_UserZone", "Exposure Time(ms):", 0));
        label_8->setText(QApplication::translate("KSJDemoQT_UserZone", "Exposure Lines:", 0));
        label_9->setText(QApplication::translate("KSJDemoQT_UserZone", "Range(ms):", 0));
        label_10->setText(QApplication::translate("KSJDemoQT_UserZone", "Range:", 0));
        label_11->setText(QApplication::translate("KSJDemoQT_UserZone", "Range:", 0));
        EXPOSURE_TIME_RANGE_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "Range", 0));
        EXPOSURE_LINES_RANGE_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "Range", 0));
        GAIN_RANGE_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "Range", 0));
        EXPOSURE_TIME_REAL_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "REAL EXP TIME", 0));
        FOV_RANGE_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "EXP LINES RANGE", 0));
        label_12->setText(QApplication::translate("KSJDemoQT_UserZone", "FOV Range:", 0));
        groupBox->setTitle(QApplication::translate("KSJDemoQT_UserZone", "Preview", 0));
        label->setText(QApplication::translate("KSJDemoQT_UserZone", "Col Start:", 0));
        label_2->setText(QApplication::translate("KSJDemoQT_UserZone", "Row Start:", 0));
        label_3->setText(QApplication::translate("KSJDemoQT_UserZone", "Col Size:", 0));
        label_4->setText(QApplication::translate("KSJDemoQT_UserZone", "Row Size:", 0));
        label_5->setText(QApplication::translate("KSJDemoQT_UserZone", "MultiFrame:", 0));
        SetPreviewFovButton->setText(QApplication::translate("KSJDemoQT_UserZone", "Set Preview Fov", 0));
        groupBox_2->setTitle(QApplication::translate("KSJDemoQT_UserZone", "Capture", 0));
        label_18->setText(QApplication::translate("KSJDemoQT_UserZone", "Col Start:", 0));
        label_19->setText(QApplication::translate("KSJDemoQT_UserZone", "Row Start:", 0));
        label_20->setText(QApplication::translate("KSJDemoQT_UserZone", "Col Size:", 0));
        label_21->setText(QApplication::translate("KSJDemoQT_UserZone", "Row Size:", 0));
        label_22->setText(QApplication::translate("KSJDemoQT_UserZone", "MultiFrame:", 0));
        SetCaptureFovButton->setText(QApplication::translate("KSJDemoQT_UserZone", "Set Capture Fov", 0));
        PreviewButton->setText(QApplication::translate("KSJDemoQT_UserZone", "Preview", 0));
        CaptureButton->setText(QApplication::translate("KSJDemoQT_UserZone", "Capture", 0));
        ERROR_INFO_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "Error Info", 0));
        ELAPSE_TIME_Label->setText(QApplication::translate("KSJDemoQT_UserZone", "Elapse", 0));
        SaveCheckBox->setText(QApplication::translate("KSJDemoQT_UserZone", "Save", 0));
        label_13->setText(QApplication::translate("KSJDemoQT_UserZone", "EEPROM Type:", 0));
        label_14->setText(QApplication::translate("KSJDemoQT_UserZone", "Address(Hex):", 0));
        label_15->setText(QApplication::translate("KSJDemoQT_UserZone", "Value(Hex):", 0));
        WriteButton->setText(QApplication::translate("KSJDemoQT_UserZone", "Write", 0));
        ReadButton->setText(QApplication::translate("KSJDemoQT_UserZone", "Read", 0));
        label_16->setText(QApplication::translate("KSJDemoQT_UserZone", "Range:", 0));
    } // retranslateUi

};

namespace Ui {
    class KSJDemoQT_UserZone: public Ui_KSJDemoQT_UserZone {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_KSJDEMOQT_USERZONE_H
