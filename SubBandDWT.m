function [SubBand, numerator, denominator]=SubBandDWT(Signal,Fs,L,H)

%Normalize the Low Frequency Band
LowFrequencyBand = L/(Fs/2);

%Creating the highpass filter coefficient
[numerator,denominator] = butter(2, LowFrequencyBand, 'high');

%Apply highpass filter in the signal wave
FiltredSignal = filtfilt(numerator, denominator, Signal);

%Normalize the High Frequency Band
HighFrequencyBand = H/(Fs/2);

%Creating the lowpass filter coefficient
[numerator,denominator] = butter(2, HighFrequencyBand, 'low');

%Apply Lowpass filter in the FiltredSignal
SubBand = filtfilt(numerator, denominator, FiltredSignal);

