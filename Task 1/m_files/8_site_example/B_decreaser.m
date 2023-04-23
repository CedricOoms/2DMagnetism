function [Bstart,Bend]=B_decreaser(Bfin)
	Bstart=abs(Bfin);
	Bend=Bfin-(Bstart/2);
end