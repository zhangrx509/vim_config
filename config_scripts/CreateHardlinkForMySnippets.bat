if exist %USERPROFILE%\vimfiles goto makelink
mkdir %USERPROFILE%\vimfiles
:makelink
mklink /J %USERPROFILE%\vimfiles\MySnippets ..\MySnippets
