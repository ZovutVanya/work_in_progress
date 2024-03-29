# этот скрипт нужно запускать прямо из праата, если хочется поменять стандартные настройки
form: "Sound: To Pitch (filtered ac)... for all .wav files in the given directory"
    text: "Directory adress", "C:\Users\Ivan\Desktop\AI\0_Dissertation\emo_audio\"
    real: "Time step (s)", "0.0 (= auto)"
    real: "Pitch floor (Hz)", "50.0"
    real: "Pitch ceiling (Hz)", "800.0"
    natural: "Max number of candidates", "15"
    boolean: "Very accurate", 1
    real: "Attenuation at ceiling", "0.03"
    real: "Silence threshold", "0.09"
    real: "Voicing threshold", "0.50"
    real: "Octave cost", "0.055"
    real: "Octave jump cost", "0.35"
    real: "Voiced unvoiced cost", "0.14"
endform

# Создаём список файлов и получаем его размер
Create Strings as file list... fileList 'directory_adress$'/*.wav
numberOfFiles = Get number of strings

for i to numberOfFiles
    # когда пишешь скрипты в праате, нужно просто представлять, что ты словами описываешь действия в gui
    select Strings fileList
    fileName$ = Get string... i
    Read from file... 'directory_adress$''fileName$'
    To Pitch (filtered ac)... time_step pitch_floor pitch_ceiling max_number_of_candidates very_accurate attenuation_at_ceiling silence_threshold voicing_threshold octave_cost octave_jump_cost voiced_unvoiced_cost
    base$ = replace$(fileName$, ".wav", "", 0)
    selectObject: "Pitch 'base$'"
    outputFile$ = "'directory_adress$''base$'.Pitch"
    Write to text file: outputFile$
endfor
