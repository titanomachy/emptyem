set x=emptyem
rem xcopy %x% build /i /e

xcopy content build\chrome\content /i /e
xcopy locale build\chrome\locale /i /e
xcopy skin build\chrome\skin /i /e
xcopy defaults build\defaults /i /e
xcopy install.rdf build
xcopy chrome.manifest.dist build

cd build\chrome
D:\code\scripts\javascript\thunderbird-plugins\empty-em\7-Zip\7z.exe a -tzip "%x%.jar" * -r -mx=0
cd ..\..

rmdir /s /q build\chrome\content
rmdir /s /q build\chrome\locale
rmdir /s /q build\chrome\skin

rem replace chrome.manifest build

cd build
rename chrome.manifest.dist chrome.manifest
D:\code\scripts\javascript\thunderbird-plugins\empty-em\7-Zip\7z.exe a -tzip "%x%.xpi" * -r -mx=9
cd ..

move build\%x%.xpi %x%.xpi

rmdir /s /q build