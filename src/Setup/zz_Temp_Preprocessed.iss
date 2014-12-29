; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS

; BEGIN ISPPBUILTINS.ISS


; END ISPPBUILTINS.ISS





  

[Setup]
AppName=TestUtil 
AppVersion=1.15 (2014-12-29)

;Better add something to the AppID to avoid a name collision
AppId=MTHTestUtil

AppPublisher=Michael 'Tex' Hex
AppSupportURL=http://www.testutil.com/
;AppComments=For support, please contact your local IT department

;VersionInfoCompany=MANN+HUMMEL
VersionInfoVersion=1.15
VersionInfoCopyright=Copyright � 2010-2015 Michael 'Tex' Hex 

;Place resulting Setup.exe in the same folder as the ISS file
OutputDir=.
OutputBaseFilename=TestUtilSetup

;I really think we should set this to NO...
Uninstallable=Yes 

;Install in x64 mode (when available)
ArchitecturesInstallIn64BitMode=x64 

;Allow to be installed in x32 or x64 mode
ArchitecturesAllowed=x86 x64

;This should be a good name for the files
DefaultDirName={pf}\TestUtil

;Icon inside Add/Remove programs
UninstallDisplayIcon={app}\TestUtilLauncher.exe

;License is Apache 2.0
LicenseFile=C:\dev\gitrepos\testutil\src\Setup\..\..\licenses\LICENSE-Apache-2.0.txt
;Readme is our license
InfoBeforeFile=C:\dev\gitrepos\testutil\src\Setup\..\..\licenses\LICENSE.txt


;No cancel during install
AllowCancelDuringInstall=False

;If TestUtil is running, close it without question if running silently
CloseApplications=yes

;Do not restart if TestUtil was closed
RestartApplications=no

;Do not warn if we install into a folder that already exists
DirExistsWarning=no

;Only allow setup to run on Windows 7 and upwards. Needed anyway because of Restart Manager
MinVersion=6.1

;LZMA2 compression at level MAX
Compression=lzma2

;We can use solid compression as all files will be installed
SolidCompression=yes

;Do not allow use to select a folder
DisableDirPage=yes

;We create a single icon anyway 
DisableProgramGroupPage=yes

;Give the user the last chance to stop the installation
DisableReadyPage=no

;;If we change file associations this flag will instruct InnoSetup at the end to refresh all Explorer icons
;ChangesAssociations=yes



[Icons]
Name: "{commonprograms}\TestUtil"; Filename: "{app}\TestUtilLauncher.exe"; Parameters: ""; IconFilename: "{app}\TestUtilLauncher.exe"

[Files]
;Source: "IrfanView\*.*"; DestDir: "{pf}\IrfanView"; Flags: ignoreversion recursesubdirs

;Copy helper module to PS Modules path of the current user to make sure the user is able to use them outside TestUtil as well
;Path: C:\Users\<<USERNAME>>\Documents\WindowsPowerShell\Modules\TestUtilTestModule1
Source: "C:\dev\gitrepos\testutil\src\Setup\..\..\scripts\modules\TestUtilHelpers\TestUtilHelpers.psm1"; DestDir: "{userdocs}\WindowsPowerShell\Modules\TestUtilHelpers\"; Flags: ignoreversion;

[Dirs]
;Create a folder in common app data (C:\ProgramData\TestUtil) to store the scripts there
;Also grant users the modify permission, in case they which to add addtional scripts 
Name: "{commonappdata}\TestUtil"; Permissions: users-modify



[Registry]
;Add testutillauncher.exe to app paths as testutil.exe. This means Windows knows where to find the file when "testutil.exe" is requested somewhere
;Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\testutil.exe"; ValueType: string; ValueName: ; ValueData: "{app}\{#StartExeName}";
;Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\testutil.exe"; ValueType: string; ValueName: "Path"; ValueData: "{app}";



[InstallDelete]
;In case this is a left over from a manual installation -> KILL IT! 
Type: files; Name: "{app}";

;I'm not sure if we should do this
Type: files; Name: "{commonappdata}\TestUtil";


;Code Section to determin the language
[Code]
{
function GetLanguageDLL(Param: String): String;
var
 iLng:integer;
 iLngGeneral:integer;
begin
  iLng:=GetUILanguage 

  iLngGeneral:=iLng and $3FF

  case iLngGeneral of 
  $01:
    begin 
      Result:='Arabic';
    end; 
  $04:
    begin 
      Result:='Chinese_Simp';
    end; 
  $05:
    begin 
      Result:='Czech1';
    end; 
  $07:
    begin 
      Result:='Deutsch';
    end; 
  $09:
    begin 
      Result:='English';
    end; 
  $0C:
    begin 
      Result:='French';
    end; 
  $10:
    begin 
      Result:='Italian';
    end; 
  $11:
    begin 
      Result:='Japanese';
    end; 
  $16:
    begin 
      Result:='Portugues-Brasil';
    end; 
  $19:
    begin 
      Result:='Russian';
    end; 
  $0A:
    begin 
      Result:='Spanish';
    end; 

  else
    begin 
       Result:='';
    end; 
  end;

     
end;

function CheckICOFileTypeIsIncorrect(): Boolean;
var
 sFiletype:string;
begin
   result:=false;

   if RegQueryStringValue(HKEY_CLASSES_ROOT, '.ico','', sFiletype) then begin
      if sFileType='IrfanViewDefaultFile' then
         result:=true;
   end;      
end;
}




