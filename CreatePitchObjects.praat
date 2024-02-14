# этот скрипт можно запустить просто из вскода
directory_name$ = "C:\Users\Ivan\Desktop\AI\0_Dissertation\emo_audio\"

Create Strings as file list... fileList 'directory_name$'/*.wav
numberOfFiles = Get number of strings
for ifile to numberOfFiles
    select Strings fileList
    fileName$ = Get string... ifile
    Read from file... 'directory_name$''fileName$'
    To Pitch (filtered ac)... 0.0 50.0 800.0 15 yes 0.03 0.09 0.50 0.055 0.35 0.14
    base$ = replace$(fileName$, ".wav", "", 0)
    selectObject: "Pitch 'base$'"
    outputFile$ = "'directory_name$''base$'.Pitch"
    Write to text file: outputFile$
endfor
