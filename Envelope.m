function [RectifiedEnvelope]=Envelope(SubBand,DecimateValue,new_fs,numerator,denominator)

%apply full Wave retification
SubBand = abs(SubBand);

%low pass filter
LowPassSubBand = filtfilt(numerator, denominator, SubBand);

%downsample
bands = downsample(LowPassSubBand, DecimateValue);

%apply mean removal
MeanRemoval=bands-mean(bands);


Tw = 0.1;
Nw=Tw*new_fs;
w=ones(Nw,1)/Nw;     


RectifiedEnvelope=conv((MeanRemoval),w,'same');

