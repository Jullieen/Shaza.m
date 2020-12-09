pkg load signal

waitfor(msgbox('Prosze wybrac plik audio z komputera'))
[baseName, folder] = uigetfile();
filename=fullfile(folder, baseName)
waitfor(msgbox(sprintf('Wybrales plik: %s', filename)))

BPM=RunBPM(filename)