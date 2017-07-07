
%%Creates heat maps, Wavelet Transforms, finding variability/means/sums etc. of choice time periods. 
%%modified by Azure Grant from Tanya Leise and Benjamin smarr


%%Reading in excel files

Tempfile=xlsread('JosieAxial','316to702','A2:B163489');% You need to type in 'Filename','sheetname','cellstoread'
%http://www.oleksiygayda.com/2011/03/tip-excel-2007-insert-rows-for-missing.html for help filling in missing value
InterpMissing=fillmissing(Tempfile,'linear');
plot(InterpKateCore(:,1));
TempString=InterpMissing(:,1);
TempString(TempString<33)=median(TempString);
TempString(TempString>39)=median(TempString);
plot(TempString);


Mnum = input('How many files are we plotting? ');
%Categ = input('For temperature, type T; for activity, type A'); 
DtIt = zeros(163488, Mnum);%you have to set this to the number of rows for each file, can only handle files of the same length.
DtIt(:,1) = TempString(:,1); disp(1); %first column of this matrix
%DtIt(:,2) = momaxial(:,1); disp(2); %second and so on. they butt up to one
%another. use this line if reading in multiple files
DtIt(isnan(DtIt)) = 0;

for i = 1:Mnum;
Dt = DtIt(:,i); %now I'm modifying DtIt a number of times, and to avoid saving over the loaded data, I rename if for more modifications. We have 8 columns, for each column a certain
%number of zeroes is added. So far each animal is only a very long line of
%data evenly divisible by 1440
% looks like padi is something I'm supposed to adjust everytime i load new data. Oops. Could this be causing problems? 
PadiH = 19;%input('In what hour (0-23) of the day does the record start? '); %this information is the top cell of the left-most column in the data (e.g. A330 for the first group).
PadiM = 54;%input('In what minute (0-59) of that hour does the record start? '); 
Padi = zeros((PadiH*60+PadiM-1),1); %adding padding to space initial data point to correct time.
Dt1 = insertrows(Dt,Padi,0); %adding as 0s the time up until the actual record starts, so the data is in an even number of days.
 
L = 24; %input('How many hours is the X axis? '); %L for lambda. Usually 24.
X = L*60; %converts L to minutes since the data is minute by minute.
Xaxis = (1:1:X)';
 
Padf = zeros((X-mod(length(Dt1),X(1,1))),1); %padding to make data evenly divisible by X, thereby rounding out some number of days.
Dt2 = insertrows(Dt1,Padf,length(Dt1)); %padding the end of the matrix like we did the beginning.
 if max(Dt2) == 0;
     t0 = 0; t1 = 1;
 else
 t0 = mean(Dt2(Dt2~=0))-2*std(Dt2(Dt2~=0)); t1 = mean(Dt2(Dt2~=0))+2*std(Dt2(Dt2~=0));%setting temp (t) max and min to +/- 2 SD.
 end
Dt2(Dt2 == 0) = mean(Dt2(Dt2~=0));%replace 0s with more mean value
Days = length(Dt2)/X;
Dt3 = reshape(Dt2,X,Days); %making the string of data into a matrix so we can plot actigrams with days on top of eachother.
clims = [t0 t1]; %sets color maps to the temp min and max calculated above. [35.5 39];%
fig = subplot(1,Mnum,i);%(2,Mnum/2,i);
hold on
imagesc(fliplr(Dt3)',clims); %colormap(smarr);
title('Your Title Here');
%set(gca,'ylim',[1 196]);
set(gca, 'Ydir', 'reverse')
set(gca, 'YAxisLocation', 'Right')
%set(gca,'YTick', [ 25 30 37 44 63 67 82 87 111]);
end


%%%TryingtoPredictPeriods
%%%Whole Day Basic Metrics
TotalDayTempMatrix=zeros(197,1); %%%Summing daily temps, maybe max total day temp accords
for i = 1:197;
TotalDayTempMatrix(i,1)=sum(Dt3(:,i));
end
subplot(2,2,1);
plot(TotalDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Summed Day Temp');

hold on

MaxDayTempMatrix=zeros(197,1); %%%Maybe the day with the max temp accors
for i = 1:197;
MaxDayTempMatrix(i,1)=max(Dt3(:,i));
end
subplot(2,2,2);
plot(MaxDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Max Day Temp')

MeanDayTempMatrix=zeros(197,1); %%%Maybe the day with the highest mean temp accords
for i = 1:197;
MeanDayTempMatrix(i,1)=mean(Dt3(:,i));
end
subplot(2,2,3);
plot(MeanDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Mean Day Temp');

VarDayTempMatrix=zeros(197,1);  %%%Maybe the most or least variable day works%%
for i = 1:197;
VarDayTempMatrix(i,1)=var(Dt3(:,i),0);
end
%subplot(2,2,4);
plot(VarDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Var Day Temp');

%%
%Nighttime Metrics

TotalDayTempMatrix=zeros(197,1); %%%Same but changing nightly windows
for i = 1:197;
TotalDayTempMatrix(i,1)=sum(Dt3(800:1100,i));
end
subplot(2,2,1);
plot(TotalDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Summed Day Temp');

hold on

MaxDayTempMatrix=zeros(197,1); %Same w nightly windows
for i = 1:197;
MaxDayTempMatrix(i,1)=max(Dt3(800:1100,i));
end
subplot(2,2,2);
plot(MaxDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Max Day Temp')

MeanDayTempMatrix=zeros(197,1); 
for i = 1:197;
MeanDayTempMatrix(i,1)=mean(Dt3(800:1100,i));
end
subplot(2,2,3);
plot(MeanDayTempMatrix);
set(gca,'XTick', [ 25 30 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
title('Mean Day Temp');

VarDayTempMatrix=zeros(197,1);  %%nighttime variability seems like the best one so far. Recheck what the Var (o) parameter means. it made a difference 
for i = 1:197;
VarDayTempMatrix(i,1)=var(Dt3(800:1100,i),0);
end
subplot(2,2,4);
plot(VarDayTempMatrix);
set(gca,'XTick', [ 25 30 35 37 44 63 67 82 87 111]);
set(gca,'XGrid','on');
set(gca,'YGrid','on');
set(gca,'YTick',[.01 .02 .03]);
title('Var Day Temp');



%% wavelets.
%24h: 336; 9h: 248; 5h: 194; 1h: 45.plot([336, 248, 194, 45],[24 9 5 1]);
NstepsPerHr=60; TimeStep=1/NstepsPerHr;
period1=24;  % period in hours of main oscillation
period2=24*56;% period in hours governing the varying frequency or amplitude
Nsteps=24*60*NstepsPerHr+1; t=(0:Nsteps-1)'/NstepsPerHr; T=t(Nsteps)-t(1);
longestperiod=40;shortestperiod=1;  % range of periods to use in AWT
gamma=3;beta=5; % parameter values for Morse wavelet function; g=3,b=5; morse wavelet; no dramatic change with different g,b.
nvoice=64;
[fs,tau,qscaleArray] = CalcScaleForCWT(shortestperiod,longestperiod,T,NstepsPerHr,nvoice);
taubnds=round(interp1(tau,1:numel(tau),[1 39])); 



%%%Remember to delete old variables for iwt before running this, other wi
for i = 1;
iwt=wavetrans(TempString(:,i),{1,gamma,beta,fs,'bandpass'},'periodic');
iWT(:,:,i) = abs(iwt);
disp(i);
end

for i = 1;
iwt2=wavetrans(minusoneweek(:,i),{1,gamma,beta,fs,'bandpass'},'periodic');
iWT2(:,:,i) = abs(iwt2);
disp(i);
end

for i = 1;
iwt3=wavetrans(minustwoweek(:,i),{1,gamma,beta,fs,'bandpass'},'periodic');
iWT3(:,:,i) = abs(iwt3);
disp(i);
end

for i = 1;
iwt4=wavetrans(minusthreeweek(:,i),{1,gamma,beta,fs,'bandpass'},'periodic');
iWT4(:,:,i) = abs(iwt4);
disp(i);
end



for i = 1; %mod to be list
   % subplot(2,2,i);
    imagesc(flipud(iWT(:,:,i)'));%Jan17-25
    set(gca, 'YTick',[48 110 173 237 339],'YTickLabel',{'24','12','6','3','1'});
   % subplot(2,2,i+1); imagesc(flipud(iWT2(:,:,i)'));%Jan10-16
    %set(gca, 'YTick',[48 110 173 237 339],'YTickLabel',{'24','12','6','3','1'});
    %subplot(2,2,i+2);imagesc(flipud(iWT3(:,:,i)'));%Jan3-9
    %set(gca, 'YTick',[48 110 173 237 339],'YTickLabel',{'24','12','6','3','1'});
    %subplot(2,2,i+3);imagesc(flipud(iWT4(:,:,i)'));%Dec27-2
set(gca, 'YTick',[48 110 173 237 339],'YTickLabel',{'24','12','6','3','1'});
set(gca,'XTick',[1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14 1440*15 1440*16 1440*17 1440*18 1440*19 1440*20]);
set(gca,'XTickLabel',[28 29 30 31 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]);
set(gca,'XGrid','on');
end

  
      