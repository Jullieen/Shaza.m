function [Xcorre]=AutoCorrelation(ENVELOPE,EnvelopeDecimated,MinBPM,MaxBPM)

%Auto Correlation Calc


EndPosition = ceil((60 * EnvelopeDecimated) / (MinBPM));

StartPosition = ceil((60 * EnvelopeDecimated) / (MaxBPM));

TotalSamples = length(ENVELOPE) - EndPosition;

Xcorre = zeros(EndPosition,1);

for pos=StartPosition:EndPosition,
	sum = 0;
	for i=1:TotalSamples,
		sum = sum + (ENVELOPE(i)*ENVELOPE(i + pos));
	end
	Xcorre(pos) = Xcorre(pos) + sum;
end




