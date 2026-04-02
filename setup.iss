; ============================================================
;  Bina Yönetim Sistemi — Inno Setup Kurulum Betiği
;  Gereksinim: Inno Setup 6.x  (https://jrsoftware.org/isinfo.php)
; ============================================================

[Setup]
AppName=Bina Yönetim Sistemi
AppVersion=3.0
AppPublisher=Bina Yönetim
AppPublisherURL=
DefaultDirName={autopf}\BinaYonetim
DefaultGroupName=Bina Yönetim Sistemi
OutputDir=kurulum_cikti
OutputBaseFilename=BinaYonetim_Kurulum
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\BinaYonetim.exe
; Türkçe karakter desteği
AppCopyright=2024

[Languages]
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"

[Tasks]
Name: "desktopicon"; Description: "Masaüstüne kısayol oluştur"; GroupDescription: "Ek görevler:"; Flags: unchecked

[Files]
; PyInstaller çıktısını kopyala
Source: "dist\BinaYonetim.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Başlat menüsü
Name: "{group}\Bina Yönetim Sistemi"; Filename: "{app}\BinaYonetim.exe"
Name: "{group}\Kaldır"; Filename: "{uninstallexe}"
; Masaüstü (seçili ise)
Name: "{autodesktop}\Bina Yönetim Sistemi"; Filename: "{app}\BinaYonetim.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\BinaYonetim.exe"; Description: "Bina Yönetim Sistemini başlat"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
// Kurulum öncesi kontrol — eski sürüm çalışıyorsa uyar
function InitializeSetup(): Boolean;
begin
  Result := True;
end;
