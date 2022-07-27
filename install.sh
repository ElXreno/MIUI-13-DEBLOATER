SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

print_modname() {
  ui_print " **************************"
  ui_print "  MIUI 13 DEBLOATER "
  ui_print " **************************"
}

REPLACE="
/data/app/GlobalFashiongallery
/system/app/AiAsstVision
/system/app/AnalyticsCore
/system/app/BookmarkProvider
/system/app/BuiltInPrintService
/system/app/Calculator
/system/app/CalculatorGlobalStub
/system/app/CarrierDefaultApp
/system/app/Cit
/system/app/CloudService
/system/app/com.miui.qr
/system/app/CompassGlobalStub
/system/app/com.xiaomi.macro
/system/app/EasterEgg
/system/app/facebook-appmanager
/system/app/FidoAuthen
/system/app/FidoClient
/system/app/FileExplorer
/system/app/FileExplorerGlobal
/system/app/GooglePrintRecommendationService
/system/app/greenguard
/system/app/Health
/system/app/HybridAccessory
/system/app/HybridPlatform
/system/app/IdMipay
/system/app/InMipay
/system/app/Joyose
/system/app/Lens
/system/app/LiveWallpapersPicker
/system/app/mab
/system/app/MiCloudSync
/system/app/mi_connect_service
/system/app/MiDropStub
/system/app/MiGalleryLockscreen
/system/app/MiLinkService2
/system/app/Mipay
/system/app/MiPicks
/system/app/MiPlayClient
/system/app/MiRadio
/system/app/MiuiAccessibility
/system/app/MiuiAudioMonitor
/system/app/MiuiBugReport
/system/app/MiuiCompass
/system/app/MiuiDaemon
/system/app/MiuiScreenRecorder
/system/app/MiuiVideoPlayer
/system/app/MSA
/system/app/MSA-Global
/system/app/Netflix_activation
/system/app/NextPay
/system/app/Notes
/system/app/NotesGlobalStub
/system/app/OsuLogin
/system/app/PartnerBookmarksProvider
/system/app/PaymentService
/system/app/PlayAutoInstallStubApp
/system/app/PrintRecommendationService
/system/app/ScreenRecorderGlobalStub
/system/app/SogouInput
/system/app/Stk
/system/app/TouchAssistant
/system/app/Traceur
/system/app/TranslationService
/system/app/TSMClient
/system/app/UPTsmService
/system/app/VoiceAssist
/system/app/VsimCore
/system/app/WAPPushManager
/system/app/WeatherGlobalStub
/system/app/wps_lite
/system/app/XiaomiSimActivateService
/system/app/XMCloudEngine
/system/app/XMSFKeeper
/system/app/YouDaoEngine
/system/priv-app/Browser
/system/priv-app/Calendar
/system/priv-app/CellBroadcastServiceModulePlatform
/system/priv-app/CleanMaster
/system/priv-app/CloudBackup
/system/priv-app/CloudServiceSysbase
/system/priv-app/facebook-installer
/system/priv-app/facebook-services
/system/priv-app/GameCenterGlobal
/system/priv-app/GlobalMinusScreen
/system/priv-app/GoogleTTS
/system/priv-app/MiBrowserGlobal
/system/priv-app/MiCalendarGlobal
/system/priv-app/MiDrop
/system/priv-app/MiGameCenterSDKService
/system/priv-app/MiService
/system/priv-app/MiShare
/system/priv-app/MiuiBrowserGlobal
/system/priv-app/MiuiGallery
/system/priv-app/MiuiMusicGlobal
/system/priv-app/MiuiScanner
/system/priv-app/MiuiVideo
/system/priv-app/Music
/system/priv-app/NewHome
/system/priv-app/ONS
/system/priv-app/PersonalAssistant
/system/priv-app/ProxyHandler
/system/priv-app/QuickSearchBox
/system/priv-app/ScannerGlobalStub
/system/priv-app/SoundRecorder
/system/priv-app/SoundRecorderStub
/system/priv-app/Stk1
/system/priv-app/Tag
/system/priv-app/UserDictionaryProvider
/system/priv-app/VoiceCommand
/system/priv-app/VoiceTrigger
/system/priv-app/VoiceUnlock
/system/priv-app/Weather
/system/priv-app/YellowPage
/system/product/app/aiasst_service
/system/product/app/Chrome
/system/product/app/FM
/system/product/app/Gmail2
/system/product/app/GoogleOne
/system/product/app/GoogleTTS
/system/product/app/Maps
/system/product/app/remoteSimLockAuthentication
/system/product/app/talkback
/system/product/app/uimremoteclient
/system/product/app/uimremoteserver
/system/product/app/YouTube
/system/product/priv-app/AndroidAutoStub
/system/product/priv-app/EmergencyInfo
/system/product/priv-app/GoogleAssistant
/system/product/priv-app/GoogleRestore
/system/product/priv-app/HotwordEnrollmentOKGoogleCORTEXM4
/system/product/priv-app/HotwordEnrollmentXGoogleCORTEXM4
/system/product/priv-app/ims
/system/product/priv-app/SetupWizard
/system/product/priv-app/Velvet
/system/product/priv-app/Wellbeing
/system/system_ext/app/FM
/system/system_ext/priv-app/GoogleFeedback
/system/system_ext/priv-app/SetupWizard
/system/vendor/app/Joyose
/system/vendor/app/SoterService
/vendor/data/app/Drive
/vendor/data/app/Duo
/vendor/data/app/GlobalFashiongallery
/vendor/data/app/Music2
/vendor/data/app/Photos
/vendor/data/app/Videos
/vendor/data/app/wps_lite
/vendor/data/app/XMRemoteController
"

on_install() {
  ui_print "   Extracting module files...   "
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}
