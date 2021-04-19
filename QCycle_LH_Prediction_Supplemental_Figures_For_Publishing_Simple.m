%% Supplemental Figures LH Prediction Paper

%% Linear Individual HR HRV DBT Surrounding Surge (Modular)
%The section below is modular. Redefine CycleColumn and LH Surge day to
%choose what cycle to plot

%The xlabel, the xticklabel (LH vs Mid) and the file name need to be
%adjusted manually for each cycle for accurate plotting and saving

CycleColumn=14;
%Individual HR Surrounding Surge
fig2aindivcyclehrzoomadjusted=figure; plot(Cycle14HR,'color','r','LineWidth',2);
xticks([ 1 1400 1400*2 1400*3 1400*4 1400*5 1400*6 1400*7 1400*8 1400*9 1400*10 1400*11 1400*12 1400*13 1400*14]); xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
axis tight;ylim([50 100]);
xlabel('Day Relative to LH Surge Onset');ylabel('Sleeping Heart Rate (BPM)');title('Individual Heart Rate Surrounding LH Surge');
%print(fig2aindivcyclehrzoomadjusted,'-djpeg','-r1000','Your File Name');

%Individual HRV Surrounding Surge
fig2bindivcyclehrvzoomadjusted=figure; plot(Cycle14HRV,'color','b','LineWidth',2);
xticks([ 1 1400 1400*2 1400*3 1400*4 1400*5 1400*6 1400*7 1400*8 1400*9 1400*10 1400*11 1400*12 1400*13 1400*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
axis tight; ylim([7 120]); 
xlabel('Day Relative to LH Surge Onset');ylabel('Sleeping HRV (RMSSD)'); title('Individual HRV Surrounding LH Surge');
%print(fig2bindivcyclehrvzoomadjusted,'-djpeg','-r1000','Your File Path and Name');

%Individual DBT Surrounding Surge
indivFTempfullCycleAdjustedzoom=figure; plot(movmean(Cycle14DBT,60*0.6),'color',[0.5 0 0.5],'LineWidth',1.5);
xticks([ 1 1400 1400*2 1400*3 1400*4 1400*5 1400*6 1400*7 1400*8 1400*9 1400*10 1400*11 1400*12 1400*13 1400*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
axis tight; ylim([22 42]); 
title('Individual DBT Surrounding LH Surge');xlabel('Day Relative to LH Surge Onset');ylabel('Continuous DBT (C)');
%print(indivFTempfullCycleAdjustedzoom,'-djpeg','-r1000','Your file path and name here');

%% HR
% 
% OVHRRawMean=mean(OVHRRawAdjusted,2);
% STDOVHRRaw=mean(movstd(OVHRRawAdjusted,[1440 1440]),2);
% SEMHRRaw=STDOVHRRaw/sqrt(20);

%%Figure 2d of HR Raw Mean Plus and Minus Standard Deviation with Raw Values
fig2dhrmeanwithstdevsadjusted=figure;  hold on; plot(OVHRRawMean,'color','r','LineWidth',1);
x=1:length(OVHRRawMean+STDOVHRRaw);a=fill([x fliplr(x)],[(OVHRRawMean+STDOVHRRaw)' flipud(OVHRRawMean-STDOVHRRaw)'],[1 0 0]); alpha(0.05); set(a,'EdgeColor','none')
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 20161]); ylim([45 75]);
xlabel('Day Relative to LH Surge Onset'); ylabel('Heart Rate (BPM)');title('Average Heart Rate Relative to LH Surge');
%print(fig2dhrmeanwithstdevsadjusted,'-djpeg','-r1000','Your File Name and Path');

%HRV


fig2ehrvrawmeanavgcycle=figure;  hold on;plot(OVHRVRawMean,'color','b','LineWidth',1);
x=1:length(OVHRVRawMean+STDOVHRVRaw);a=fill([x fliplr(x)],[(OVHRVRawMean+STDOVHRVRaw)' flipud(OVHRVRawMean-STDOVHRVRaw)'],[0 0 1]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 20161]); ylim([0 80]);
xlabel('Day Relative to LH Surge Onset'); ylabel('Sleeping HRV (RMSSD)'); title('Average Heart Rate Variability Relative to LH Surge');
%print(fig2ehrvrawmeanavgcycle,'-djpeg','-r1000','C:\Users\Azure\Google Drive\Berkeley Grad School\QCycle\Manuscript Elements\Supplemental Figures\Linear HR HRV DBT\ 2e Mean HRV CycleZoom Adjusted');

%DBT

% OVDBTRawMean=mean(OVDBTRawAdjusted,2);
% STDOVDBTRaw=mean(movstd(OVDBTRawAdjusted,[1440 1440]),2);
% SEMDBTRaw=STDOVDBTRaw/sqrt(20);

fig2eDBTrawmeanavgcycle=figure;  hold on; plot(OVDBTRawMean,'color',[0.5 0 0.5],'LineWidth',1);
x=1:length(OVDBTRawMean+STDOVDBTRaw);a=fill([x fliplr(x)],[(OVDBTRawMean+STDOVDBTRaw)' flipud(OVDBTRawMean-STDOVDBTRaw)'],[0.8 0 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
axis tight %xlim([0 20161]);ylim([22 42]); %Note units will be off, early data sets unconverted to degrees C
xlabel('Day Relative to LH Surge Onset');ylabel('Continuous DBT (C)');title('Average Distal Body Temperature to LH Surge');
%print(fig2eDBTrawmeanavgcycle,'-djpeg','-r1000','Your File Name and Path Here');
%% Linear Average HR HRV DBT Surrounding Cycle Midpoint Perimenopausal People
%HR
MenoIndex=[47:57];



%%Figure 2d of HR Raw Mean Plus and Minus Standard Deviation with Raw Values
menofig2dhrmeanwithstdevsadjusted=figure;  hold on; plot(MenoOVHRRawMean,'color','r','LineWidth',1);
x=[1:length(MenoOVHRRawMean+MenoSTDOVHRRaw)];;a=fill([x fliplr(x)],[(movmean(MenoOVHRRawMean+MenoSTDOVHRRaw,120))' flipud(movmean(MenoOVHRRawMean-MenoSTDOVHRRaw,120))'],[1 0 0]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([0 20161]);ylim([45 75]);
xlabel('Day Relative to Cycle Mid Point');ylabel('Heart Rate (BPM)');title('Average Heart Rate Relative to Cycle Mid Point');
%print(menofig2dhrmeanwithstdevsadjusted,'-djpeg','-r1000','C:\Users\Azure\Google Drive\Berkeley Grad School\QCycle\Manuscript Elements\Supplemental Figures\Linear HR HRV DBT\Meno Mean HR With STDEV');

%HRV
MenoOVHRVRawMean=mean(MenoOVHRVRawAdjusted,2);
MenoSTDOVHRVRaw=mean(movstd(MenoOVHRVRawAdjusted,[1440 1440]),2);
MenoSEMHRVRaw=MenoSTDOVHRVRaw/sqrt(5);

fig2ehrvrawmeanavgcycle=figure;  hold on; plot(MenoOVHRVRawMean,'color','b','LineWidth',1);
x=[1:length(MenoOVHRVRawMean+MenoSTDOVHRVRaw)];a=fill([x fliplr(x)],[(movmean(MenoOVHRVRawMean+MenoSTDOVHRVRaw,120))' flipud(movmean(MenoOVHRVRawMean-MenoSTDOVHRVRaw,120))'],[0 0 1]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([0 20161]); ylim([0 80]);
xlabel('Day Relative to Cycle Mid Point');ylabel('Sleeping HRV (RMSSD)');title('Average Heart Rate Variability Relative to Cycle Mid Point');
%print(fig2ehrvrawmeanavgcycle,'-djpeg','-r1000','Your path ending in filename here');

%DBT

MenoOVDBTRawMean=mean(MenoOVDBTRawAdjusted,2);
MenoSTDOVDBTRaw=mean(movstd(MenoOVDBTRawAdjusted,[1440 1440]),2);
MenoSEMDBTRaw=MenoSTDOVDBTRaw/sqrt(5);

fig2eDBTrawmeanavgcycle=figure;  plot(MenoOVDBTRawMean,'color',[0.5 0 0.5],'LineWidth',1);
x=[1:length(MenoOVDBTRawMean+MenoSTDOVDBTRaw)];hold on;a=fill([x fliplr(x)],[(movmean(MenoOVDBTRawMean+MenoSTDOVDBTRaw,120))' flipud(movmean(MenoOVDBTRawMean-MenoSTDOVDBTRaw,120))'],[0.8 0 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([0 20161]);ylim([22 42]);
xlabel('Day Relative to Cycle Mid Point');ylabel('Continuous DBT (C)');title('Average DBT Relative to Cycle Mid Point');
%print(fig2eDBTrawmeanavgcycle,'-djpeg','-r1000','Your path and filename here');

%kruskalwallis([OVDBTRawMean(1:18721)',MenoOVDBTRawMean']); %Temp ranks are not significantly different between premenopausal and perimenopausal status.

%% HR Nightly UR Power Does Not Anticipate the Surge
HRURPowersIndex=[3:10,14:23,28:37,39:50];



%Premeno---No significant differences by peak and trough days. 
Fig4HRURPower=figure;  plot(HRURPowersAdjustedMean,'color','r','LineWidth',3);
x=[1:length(HRURPowersAdjustedMean)];hold on; a=fill([x fliplr(x)],[(HRURAdjustedPlusSTD)' flipud(HRURAdjustedMinusSTD)'],[1 0 0]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-1 1]);
xlabel('Day Relative to LH Surge Onset');ylabel('Z-Scored Ultradian Power of HR ');title('Ultradian Power of HR');
%print(Fig4HRURPower,'-djpeg','-r1000','Insert your file path and filename here');


Fig4HRURPowerSEM=figure; hold on;plot(HRURPowersAdjustedMean,'color','r','LineWidth',3);
plot(HRPlusSEM,'color',[0.8 0 0]);plot(HRMinusSEM,'color',[0.8 0 0]);
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-1 1]);
xlabel('Day Relative to LH Surge Onset'); ylabel('Z-Scored Ultradian Power of HR ');title('Ultradian Power of HR');
%print(Fig4HRURPowerSEM,'-djpeg','-r1000','Your path and filename here');

%stats 
for a=1:length(HRURPowersIndex)
Day5to2DiffHR(a)=median(HRURPowersAdjusted(475*5:475*5+100,a))-median(HRURPowersAdjusted(475*2:475*2+100,a))
Day5to10DiffHR(a)=median(HRURPowersAdjusted(475*5:475*5+100,a))-median(HRURPowersAdjusted(475*10:475*10+100,a))
end

[pftempur,tbl,stats]=kruskalwallis([Day5to10DiffHR', Day5to2DiffHR']); %chi =0.3 p = 0.581
%Shows the slope from day -5 to day -1 (which is positive) is different for
%all individuals than the slope from day -5 to day 10 (which is around zero)


%Menopausal
MenoHRURPowersIndex=[48:57];

MenoHRURPowersAdjustedMean=mean(MenoHRURPowersAdjusted,2);
MenoOvMovSTDHRUR=mean(movstd(MenoHRURPowersAdjusted,[475 475]),2);
MenoHROvURAdjustedPlusSTD=MenoHRURPowersAdjustedMean+MenoOvMovSTDHRUR;
MenoHROvURAdjustedMinusSTD=MenoHRURPowersAdjustedMean-MenoOvMovSTDHRUR;

%SEMs are very small because vector is high temporal res. 
%MenoSEMHR=mean(std(MenoHRURPowersAdjustedMean)/sqrt(5));
%MenoHRPlusSEM=MenoHRURPowersAdjustedMean+MenoSEMHR;
%MenoHRMinusSEM=MenoHRURPowersAdjustedMean-MenoSEMHR;

Fig4MenoHRURPower=figure; hold on; plot(MenoHRURPowersAdjustedMean,'color','r','LineWidth',3);
x=[1:length(MenoOvMovSTDHRUR)];hold on;a=fill([x fliplr(x)],[(MenoHROvURAdjustedPlusSTD)' flipud(MenoHROvURAdjustedMinusSTD)'],[1 0 0]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 475-60*3 475*2-60*3 475*3-60*3 475*4-60*3 475*5-60*3 475*6-60*3 475*7-60*3 475*8-60*3 475*9-60*3 475*10-60*3 475*11-60*3 475*12-60*3 475*13-60*3 475*14-60*3]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-1 1]);
xlabel('Day Relative to Cycle Mid Point'); ylabel('Ultradian Power of HR');title('Ultradian Power of HR in Perimenopause');
%print(Fig4MenoHRURPower,'-djpeg','-r1000','Your path and filename here');

%stats 
for a=1:length(MenoHRURPowersIndex)
Day2to6DiffHRMeno(a)=median(movmean(MenoHRURPowersAdjusted(475*2:475*2+100,a),475*2))-median(movmean(MenoHRURPowersAdjusted(475*6:475*6+100,a),475*2))
Day2to10DiffHRMeno(a)=median(movmean(MenoHRURPowersAdjusted(475*2:475*2+100,a),475*2))-median(movmean(MenoHRURPowersAdjusted(475*10:475*10+100,a),475*2))
Day2to13DiffHRMeno(a)=median(movmean(MenoHRURPowersAdjusted(475*2:475*2+100,a),475*2))-median(movmean(MenoHRURPowersAdjusted(475*13:475*13+100,a),475*2))
end

%[pftempur,tbl,stats]=kruskalwallis([Day2to6DiffHRMeno', Day2to10DiffHRMeno']); % chi = 0.37 p = 0.5453


%Individual plot
Fig4HRURPowerIndiv=figure; plot(HRURPowersAdjusted(:,34),'color','r','LineWidth',3);
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-2.5 2.5]);
xlabel('Day Relative to LH Surge Onset');ylabel('Z-Scored Ultradian Power of HR ');title('Ultradian Power of HR');
%print(Fig4HRURPowerIndiv,'-djpeg','-r1000','Your path and filename here');

Fig4HRURPowerIndivMeno=figure; plot(MenoHRURPowersAdjusted(:,3),'color','r','LineWidth',3);hold on; 
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-2.75 2.75]);
xlabel('Day Relative to Cycle Midpoint');ylabel('Z-Scored Ultradian Power of HR ');title('Ultradian Power of HR');
%print(Fig4HRURPowerIndivMeno,'-djpeg','-r1000','Your path and filename here');

%% Circadian Power of DBT Does Not Anticipate the Surge (or midcycle for meno)
%Premenopausal
figure;
for i=1:36
disp(i)
plot(CRPowersNearSurge(:,i),'color','k','LineWidth',3); hold on;
end

MeanCRPowersNearSurge=mean(CRPowersNearSurge,2);
stdevCRPowersNearSurge=mean(movstd(CRPowersNearSurge,[720 720]),2);

CRPowerOvulatory=figure;plot(MeanCRPowersNearSurge,'color','k','LineWidth',2); hold on;
x=[1:length(stdevCRPowersNearSurge+MeanCRPowersNearSurge)];a=fill([x fliplr(x)],[(stdevCRPowersNearSurge+MeanCRPowersNearSurge)' flipud(MeanCRPowersNearSurge-stdevCRPowersNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xlabel('Day Relative to LH Surge Onset'); ylabel('ZScored Circadian Power of DBT');
axis tight; ylim([-2.75 2.75]); xlim([0 length(MeanCRPowersNearSurge)]);
xticks([ 1 1440*1 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
%print(CRPowerOvulatory,'-djpeg','-r1000','Your name and filepath here');

%stats CRs not different
for a=1:length(MenoDBTURPowersIndex)
Day2to6DiffCirc(a)=median(movmean(CRPowersNearSurge(475*2:475*2+100,a),475*2))-median(movmean(CRPowersNearSurge(475*6:475*6+100,a),475*2))
Day2to10DiffCirc(a)=median(movmean(CRPowersNearSurge(475*2:475*2+100,a),475*2))-median(movmean(CRPowersNearSurge(475*10:475*10+100,a),475*2))
Day2to13DiffCirc(a)=median(movmean(CRPowersNearSurge(475*2:475*2+100,a),475*2))-median(movmean(CRPowersNearSurge(475*13:475*13+100,a),475*2))
end

%[pftempur,tbl,stats]=kruskalwallis([Day2to6DiffCirc', Day2to10DiffCirc']); % chi = 0.37 p = 0.5453


%Perimenopausal
figure;
for i=1:length(j)
disp(i)
plot(MenoCRPowersNearSurge(:,i),'color','k','LineWidth',3); hold on;
end

MenoMeanCRPowersNearSurge=mean(MenoCRPowersNearSurge,2);
MenostdevCRPowersNearSurge=mean(movstd(MenoCRPowersNearSurge,[1440 1440*3]),2);

MenoCRPower=figure;plot(MenoMeanCRPowersNearSurge,'color','k','LineWidth',2); hold on;
x=[1:length(MenostdevCRPowersNearSurge+MenoMeanCRPowersNearSurge)];hold on;
a=fill([x fliplr(x)],[(MenostdevCRPowersNearSurge+MenoMeanCRPowersNearSurge)' flipud(MenoMeanCRPowersNearSurge-MenostdevCRPowersNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xlabel('Day Relative to Cycle Mid Point'); ylabel('ZScored Circadian Power of DBT');
xticks([ 1 1440*1 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','Mid','1','2','3','4','5','6','7'});
ylim([-2.75 2.75]);xlim([0 length(MenoMeanCRPowersNearSurge)]);
%print(MenoCRPower,'-djpeg','-r1000','Insert your filename here');

%stats perimeno
for a=1:10
MenoDay2to6DiffCirc(a)=median(movmean(MenoCRPowersNearSurge(475*2:475*2+100,a),475*2))-median(movmean(MenoCRPowersNearSurge(475*6:475*6+100,a),475*2))
MenoDay2to10DiffCirc(a)=median(movmean(MenoCRPowersNearSurge(475*2:475*2+100,a),475*2))-median(movmean(MenoCRPowersNearSurge(475*10:475*10+100,a),475*2))
MenoDay2to13DiffCirc(a)=median(movmean(MenoCRPowersNearSurge(475*2:475*2+100,a),475*2))-median(movmean(MenoCRPowersNearSurge(475*13:475*13+100,a),475*2))
end

[pftempur,tbl,stats]=kruskalwallis([MenoDay2to6DiffCirc', MenoDay2to10DiffCirc']); % chi = 1.65 p = 0.1984


%% Once Per Day Ring Outputs do not change stereotypically leading up to LH Surge Onset

%% Temperature Deviation median +/- stdev
MeanTempDevsNearSurge=median(TempDevsNearSurge,2);stdevTempDevsNearSurge=std(TempDevsNearSurge,0,2);

TempDevsAvgStdev=figure;plot(MeanTempDevsNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevTempDevsNearSurge+MeanTempDevsNearSurge); a=fill([x fliplr(x)],[(stdevTempDevsNearSurge+MeanTempDevsNearSurge)' flipud(MeanTempDevsNearSurge-stdevTempDevsNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xlabel('Day Relative to LH Surge Onset');ylabel('Median Temperature Deviation During Sleep');
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlim([1 15]);
%print(TempDevsAvgStdev,'-djpeg','-r1000','Insert your filename and path here';

%% Breathing Rate median +/- stdev
BreathingRateNearSurge=median(zscore(BreathingRateAvgNearSurge),2); stdevBreathingRateNearSurge=std(zscore(BreathingRateAvgNearSurge),0,2);

BreathingAvgStdev=figure;plot(BreathingRateNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevBreathingRateNearSurge+BreathingRateNearSurge);a=fill([x fliplr(x)],[(stdevBreathingRateNearSurge+BreathingRateNearSurge)' flipud(BreathingRateNearSurge-stdevBreathingRateNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlim([1 15]);ylim([-2.5 2.5]);
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Median Breathing Rate During Sleep');
%print(BreathingAvgStdev,'-djpeg','-r1000','Insert your filename and path here';

%% Sleep Latency median +/- stdev
AvgSleepLatencyNearSurge=mean(zscore(SleepLatencyNearSurge),2);stdevSleepLatencyNearSurge=std(zscore(SleepLatencyNearSurge),0,2);

SleepLatencyfig=figure;plot(AvgSleepLatencyNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevSleepLatencyNearSurge+AvgSleepLatencyNearSurge);a=fill([x fliplr(x)],[(stdevSleepLatencyNearSurge+AvgSleepLatencyNearSurge)' flipud(AvgSleepLatencyNearSurge-stdevSleepLatencyNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Sleep Latency');
xlim([1 15]);ylim([-2.5 2.5]);
%print(SleepLatencyfig,'-djpeg','-r1000','Insert your filename and path here';

%% Sleep Disturbance Score
AvgDisturbanceNearSurge=mean(zscore(DisturbanceScoreNearSurge),2);stdevDisturbanceNearSurge=std(zscore(DisturbanceScoreNearSurge),0,2);

Disturbancefig=figure;plot(AvgDisturbanceNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevDisturbanceNearSurge+AvgDisturbanceNearSurge);a=fill([x fliplr(x)],[(stdevSleepLatencyNearSurge+AvgSleepLatencyNearSurge)' flipud(AvgSleepLatencyNearSurge-stdevSleepLatencyNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Sleep Disturbance Score');
xlim([1 15]);ylim([-2.5 2.5]);
%print(Disturbancefig,'-djpeg','-r1000','Insert your filename and path here';

%% Seconds Awake During Sleep
% AvgSecondsAwakeNearSurge=mean(zscore(SecondsAwakeNearSurge),2);stdevSecondsAwakeNearSurge=std(zscore(SecondsAwakeNearSurge),0,2);
% 
SecondsAwakefig=figure;plot(AvgSecondsAwakeNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevSecondsAwakeNearSurge+AvgSecondsAwakeNearSurge);a=fill([x fliplr(x)],[(stdevSecondsAwakeNearSurge+AvgSecondsAwakeNearSurge)' flipud(AvgSecondsAwakeNearSurge-stdevSecondsAwakeNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]); xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Seconds Awake During Sleep');
xlim([1 15]);ylim([-2.5 2.5]);
%print(SecondsAwakefig,'-djpeg','-r1000','Insert your filename and path here');

%% Sleep Duration Fig
AvgSleepDurationNearSurge=mean(zscore(SleepDurationNearSurge),2);stdevSleepDurationNearSurge=std(zscore(SleepDurationNearSurge),0,2);

SleepDurationfig=figure;plot(AvgSleepDurationNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevSleepDurationNearSurge+AvgSleepDurationNearSurge);a=fill([x fliplr(x)],[(stdevSleepDurationNearSurge+AvgSleepDurationNearSurge)' flipud(AvgSleepDurationNearSurge-stdevSleepDurationNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Sleep Duration');
xlim([1 15]);ylim([-2.5 2.5]);
%print(SleepDurationfig,'-djpeg','-r1000','Insert your filename and path here';

%% Bedtime Start
AvgBedtimeStartNearSurge=mean(zscore(BedtimeStartNearSurge),2);stdevBedtimeStartNearSurge=std(zscore(BedtimeStartNearSurge),0,2);

BedtimeStartfig=figure;plot(AvgBedtimeStartNearSurge,'color','k','LineWidth',4);hold on;
x=1:length(stdevBedtimeStartNearSurge+AvgBedtimeStartNearSurge);a=fill([x fliplr(x)],[(stdevBedtimeStartNearSurge+AvgBedtimeStartNearSurge)' flipud(AvgBedtimeStartNearSurge-stdevBedtimeStartNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Bedtime Start');
xlim([1 15]);ylim([-2.5 2.5]);
%print(BedtimeStartfig,'-djpeg','-r1000','Insert your filename and path here';

%% Bedtime End
AvgBedtimeEndNearSurge=mean(zscore(BedtimeEndNearSurge),2);stdevBedtimeEndNearSurge=std(zscore(BedtimeEndNearSurge),0,2);

BedtimeEndfig=figure;plot(AvgBedtimeEndNearSurge,'color','k','LineWidth',4); hold on;
x=1:length(stdevBedtimeEndNearSurge+AvgBedtimeEndNearSurge);a=fill([x fliplr(x)],[(stdevBedtimeEndNearSurge+AvgBedtimeEndNearSurge)' flipud(AvgBedtimeEndNearSurge-stdevBedtimeEndNearSurge)'],[0.5 0.5 0.5]); alpha(0.1); set(a,'EdgeColor','none')
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);xticklabels({'-7', '-6','-5','-4','-3','-2','-1','LH','1','2','3','4','5','6','7'});
xlabel('Day Relative to LH Surge Onset');ylabel('ZScored Bedtime End');
xlim([1 15]);ylim([-2.5 2.5]);
%print(BedtimeEndfig,'-djpeg','-r1000','Insert your filename and path here';

%% Individually Plotting the UR Powers for DBT

%Overlapping--looks messier
figure;
for i=1:45
    plot(ForLanceDownSampledOvWinDBTURMedProjz(:,i));hold on;
    disp(i)
end

figure;
for c=1:45
    subplot(2,25,c)
    plot(ForLanceDownSampledOvWinDBTURMedProjz(:,c),'color','k');
    xticks([ 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]);
    xticklabels({ '-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
title(c)
ylim([-3 3]);
xlim([1 13]);

end

%for HRV

figure;
for i=1:45
    plot(ForLanceDownSampledOvWinHRVMedProjz(:,i));hold on;
    disp(i)
end

%Sanity Check Plot z scored version HRV
figure;
for i=1:45
    subplot(2,25,i)
    plot(ForLanceDownSampledOvWinHRVMedProjz(:,i));
    title(i)
    disp(i)
end
