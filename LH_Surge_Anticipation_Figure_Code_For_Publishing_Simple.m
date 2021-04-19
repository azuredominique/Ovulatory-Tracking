%% Ultradian Rhythms in Heart Rate Variability and Distal Body Temperature Anticipate the Luteinizing Hormone Surge Onset
% Code and Data Used to Create Figures. 
% Code by Azure Grant, thanks to Tanya Leise @ Amherst University for Base
% Wavelet Code. Thanks to Ben Smarr for advice on color choices

%Files Referenced can be found on our OSF project page at [insert link], and are listed below

%Hormone_Stats-and_means ; Mean and SEM of premenopausal estradiol and a-pregnanediol data
%Meno_Stats_Data; Mean and SEM of perimenopausal estradiol and a-pregnanediol data
%PremenopausalE2Statistics; PDF of statistics from rmAnova;
%PremenopausalaPregnanediolStatistics; PDF of statistics from rmAnova;
%PerimenopausalE2Statistics; PDF of statistics from rmAnova;
%PerimenopausalaPregnanediolStatistics; PDF of statistics from rmAnova;
%Supplemental Figures Script (For references to data on UR pattern around the LH surge in each individual cycle).
%Peaks and Troughs for Within Individual Comparisons: Shows Days of peaks and troughs for premenopausal cycles
%All other results can be found inline in this script


%% Reading in Data for Figure 1A: Estradiol and a-Pregnanediol Means and SEMS for Premenopausal and Perimenopausal Individuals
% PremenoE2MeansRevised=xlsread('Hormone_Stats-and_means','Estradiol','B13:B27');
% PremenoE2SEMRevised=xlsread('Hormone_Stats-and_means','Estradiol','C13:C27');
% 
% PremenoapregMeansRevised=xlsread('Hormone_Stats-and_means','aPreg','B15:B29');
% PremenoapregSEMRevised=xlsread('Hormone_Stats-and_means','aPreg','C15:C29');
% 
% PremenobpregMeansRevised=xlsread('Hormone_Stats-and_means','bPreg','B15:B29');
% PremenobpregSEMRevised=xlsread('Hormone_Stats-and_means','bPreg','C15:C29');
% 
% MenoE2MeansRevised=xlsread('Meno_Stats_Data','Estradiol','B15:B29');
% MenoE2SEMRevised=xlsread('Meno_Stats_Data','Estradiol','C15:C29');
% 
% MenoapregMeansRevised=xlsread('Meno_Stats_Data','aPreg','B15:B29');
% MenoapregSEMRevised=xlsread('Meno_Stats_Data','aPreg','C15:C29');
% 
% MenobpregMeansRevised=xlsread('Meno_Stats_Data','bPreg','B17:B31');
% MenobpregSEMRevised=xlsread('Meno_Stats_Data','bPreg','C17:C31');

%% Figure 1A: Premenopausal Mean +/- SEM Estradiol (E2) and a-Pregnanediol (aPG)
yapreg=PremenoapregMeansRevised; y=PremenoE2MeansRevised(1:1:15); %Define E2 and aPG means to plot
x=1:1:15;err=PremenoE2SEMRevised;;errapreg=PremenoapregSEMRevised; %Define error terms and their length (x) to plot
E2andapregaverage=figure;
plot(PremenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3); %Plot E2
e=errorbar(x,y,err,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on; e.Marker='.'; e.Color= 'black'; %Define E2 Error bar and its appearance
plot(PremenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3); %Plot aPG
ylabel('Urinary Estradiol pg/mg'); %Axis Label
ylimits=[0 19.5]; ylim(ylimits); hold on; yyaxis right;hold on; %Setting standard E2 y-axis limits, switching to aPG axis
plot(PremenoapregMeansRevised,'--','color',[0.3 0.3 0.3],'LineWidth',3); 
e=errorbar(x,yapreg,errapreg,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on;e.Color= 'black'; %Define aPG error bar and its appearance
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'}); %Defining X-Axis Ticks
xlabel('Day Relative to LH Surge Onset');
ylabel('Urinary a-Pregnanediol pg/mg'); %Second y-axis label
title('Average Premenopausal Estradiol and a-Pregnanediol');
ylim([0.001 140]);xlim([1 15]); %Setting standard aPG y-axis limits, and x-axis limits
ax = gca; ax.YAxis(1).Color = 'k'; ax.YAxis(2).Color = 'k'; %prevents second y-axis from coming out orange
%print(E2andapregaverage,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Figure 1B: All Premenopausal Individuals' E2 and a-Pregnanediol 
individuale2andapregnozscore=figure;
for a=[1:16]; %number of logs
    plot(AllAdjustedE2(:,a),'-','color',[0.5 0.5 0.5],'LineWidth',1); hold on; %plot them all on top of eachother in a solid line
disp(a)
end
ylabel('Urinary Estradiol (pg/mg)');ylim([0 30]); %Makes E2 yaxis label and limite limits the same for perimenopausal and premenopausal
for a=[1:16]
    hold on; yyaxis right;plot(AllapregsAdjusted(:,a),'--','color',[0.3 0.3 0.3],'LineWidth',1); %plot all the aPG individual values in dashed line on right axis
   disp(a)
end
ylim([0.001 325]); xlim([1 1440*14]);
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);
xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
title('All Premenopausal Individuals E2 and a-Pregnanediol');
xlabel('Day Relative to LH Surge Onset');
ylabel('Urinary a-Pregnanediol (pg/mg)');
ax=gca;ax.YAxis(1).Color = 'k'; ax.YAxis(2).Color = 'k';
%print(individuale2andapregnozscore,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Figure 1 C Individual 17 Premenopausal E2 and a-Pregnanediol Example
Cycle17E2andapreg=figure; plot(Cycle17E2,'color',[0.5 0.5 0.5],'LineWidth',3); %define figure and plot cycle 17 E2
ylabel('Urinary Estradiol (pg/mg)');ylim([0 7]); %E2 ylabel and limits
hold on; yyaxis right;plot(Cycle17aPreg,'color',[0.3 0.3 0.3],'LineWidth',3); %switch to right axis and plot aPG
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
axis tight;ylim([0.001 350]); %set aPG axis limits
xlabel('Day Relative to LH Surge Onset');ylabel('Urinary a-Pregnanediol (pg/mg)');title('Cycle 17 Estradiol and a-Pregnanediol'); %xlabel, title and right aPG y axis label
ax=gca;ax.YAxis(1).Color = 'k'; ax.YAxis(2).Color = 'k'; %make y axes black
%print(Cycle17E2andapreg,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Figure 1D: Perimenopausal Mean +/- SEM Estradiol (E2) and a-Pregnanediol (aPG)
y=MenoE2MeansRevised(1:1:15);yapreg=MenoapregMeansRevised;%Define E2 and aPG means to plot
x=1:1:15;err=MenoE2SEMRevised;;errapreg=MenoapregSEMRevised;%Define error terms and their length (x) to plot
E2andapregaverage=figure;
plot(MenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3);  %Plot E@
e=errorbar(x,y,err,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on; e.Marker='.'; e.Color= 'black'; %Define E2 Error bar and its appearance
plot(MenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3); 
ylabel('Urinary Estradiol pg/mg'); %Axis Label
ylim([0.001 19.5]); hold on; yyaxis right;hold on;  %Setting standard E2 y-axis limits, switching to aPG axis
plot(MenoapregMeansRevised,'--','color',[0.3 0.3 0.3],'LineWidth',3); %Plot aPG
e=errorbar(x,yapreg,errapreg,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on;e.Color= 'black'; %plot aPG error bar and set appearance
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'}); %Define X-Axis Ticks
xlabel('Day Relative to Midcycle');ylabel('Urinary a-Pregnanediol pg/mg'); %label title of x axis and aPG y axis
title('Average Premenopausal Estradiol and a-Pregnanediol');
ylim([0.001 140]);xlim([1 15]); %Define aPG y limits and x axis limit
ax = gca;ax.YAxis(1).Color = 'k';ax.YAxis(2).Color = 'k'; %Make sure axis colors are all black
%print(E2andapregaverage,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Figure 1E Perimenopausal all 4 individuals' E2 and -aPregnanediol
MENOindividuale2andapregnozscore=figure;
for a=[1:4]
    plot(AllAdjustedMENOE2s(:,a),'-','color',[0.5 0.5 0.5],'LineWidth',1);%[0 0.6+((a/13)-0.4) 0.6+((a/13)-0.4)]); 
    hold on;
end
ylabel('Urinary Estradiol (pg/mg)'); ylim([0 30]);
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
for a=[1:4]
    hold on; yyaxis right;
plot(AllapregsMENOAdjusted(:,a),'--','color',[0.3 0.3 0.3],'LineWidth',1);
end
ylim([0.001 325]); xlim([1 1440*14]);
title('All Individual E2 and a-Pregnanediol');xlabel('Day Relative to Cycle Mid Point');ylabel('Urinary a-Pregnanediol (pg/mg)');
ax = gca;ax.YAxis(1).Color = 'k';ax.YAxis(2).Color = 'k'; %Make sure axis colors are all black
%print(MENOindividuale2andapregnozscore,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Figure 1F Individual Menopausal Hormones
Cycle57E2andapreg=figure;
plot(Cycle57E2,'color',[0.5 0.5 0.5],'LineWidth',3);
ylabel('Urinary Estradiol (pg/mg)');axis tight; ylim([0 30]);hold on; yyaxis right;
plot(Cycle57apreg,'color',[0.3 0.3 0.3],'LineWidth',3);
ylim([0 325])
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);
xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','+1','2','3','4','5' '6' '7'});
xlabel('Day Relative to Cycle Mid Point');ylabel('Urinary a-Pregnanediol (pg/mg)');
ax = gca;ax.YAxis(1).Color = 'k';ax.YAxis(2).Color = 'k'; %Make sure axis colors are all black
title('Cycle 17 Estradiol and a-Pregnanediol');
%print(Cycle57E2andapreg,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer


%% Plot of Figure 1A-1F all Together;
Figure1Hormones=figure;

subplot(2,3,1);
yapreg=PremenoapregMeansRevised; y=PremenoE2MeansRevised(1:1:15); %Define E2 and aPG means to plot
x=1:1:15;err=PremenoE2SEMRevised;;errapreg=PremenoapregSEMRevised; %Define error terms and their length (x) to plot
plot(PremenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3); %Plot E2
e=errorbar(x,y,err,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on; e.Marker='.'; e.Color= 'black'; %Define E2 Error bar and its appearance
plot(PremenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3); %Plot aPG
ylabel('Urinary Estradiol pg/mg'); %Axis Label
ylimits=[0 19.5]; ylim(ylimits); hold on; yyaxis right;hold on; %Setting standard E2 y-axis limits, switching to aPG axis
plot(PremenoapregMeansRevised,'--','color',[0.3 0.3 0.3],'LineWidth',3); 
e=errorbar(x,yapreg,errapreg,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on;e.Color= 'black'; %Define aPG error bar and its appearance
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'}); %Defining X-Axis Ticks
xlabel('Day Relative to LH Surge Onset');
ylabel('Urinary a-Pregnanediol pg/mg'); %Second y-axis label
title('Average Premenopausal Estradiol and a-Pregnanediol');
ylim([0.001 140]);xlim([1 15]); %Setting standard aPG y-axis limits, and x-axis limits
ax = gca; ax.YAxis(1).Color = 'k'; ax.YAxis(2).Color = 'k'; 

subplot(2,3,2);
for a=[1:16]; %number of logs
    plot(AllAdjustedE2(:,a),'-','color',[0.5 0.5 0.5],'LineWidth',1); hold on; %plot them all on top of eachother in a solid line
disp(a)
end
ylabel('Urinary Estradiol (pg/mg)');ylim([0 30]); %Makes E2 yaxis label and limite limits the same for perimenopausal and premenopausal
for a=[1:16]
    hold on; yyaxis right;plot(AllapregsAdjusted(:,a),'--','color',[0.3 0.3 0.3],'LineWidth',1); %plot all the aPG individual values in dashed line on right axis
   disp(a)
end
ylim([0.001 325]); xlim([1 1440*14]);
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);
xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
title('All Premenopausal Individuals E2 and a-Pregnanediol');
xlabel('Day Relative to LH Surge Onset');
ylabel('Urinary a-Pregnanediol (pg/mg)');
ax=gca;ax.YAxis(1).Color = 'k'; ax.YAxis(2).Color = 'k';

subplot(2,3,3);
plot(Cycle17E2,'color',[0.5 0.5 0.5],'LineWidth',3); %define figure and plot cycle 17 E2
ylabel('Urinary Estradiol (pg/mg)');ylim([0 25]); %E2 ylabel and limits
hold on; yyaxis right;plot(Cycle17aPreg,'color',[0.3 0.3 0.3],'LineWidth',3); %switch to right axis and plot aPG
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
axis tight;ylim([0.001 350]); %set aPG axis limits
xlabel('Day Relative to LH Surge Onset');ylabel('Urinary a-Pregnanediol (pg/mg)');title('Cycle 17 Estradiol and a-Pregnanediol'); %xlabel, title and right aPG y axis label
ax=gca;ax.YAxis(1).Color = 'k'; ax.YAxis(2).Color = 'k';

subplot(2,3,4);
y=MenoE2MeansRevised(1:1:15);yapreg=MenoapregMeansRevised;%Define E2 and aPG means to plot
x=1:1:15;err=MenoE2SEMRevised;;errapreg=MenoapregSEMRevised;%Define error terms and their length (x) to plot
plot(MenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3);  %Plot E@
e=errorbar(x,y,err,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on; e.Marker='.'; e.Color= 'black'; %Define E2 Error bar and its appearance
plot(MenoE2MeansRevised,'color',[0.5 0.5 0.5],'LineWidth',3); 
ylabel('Urinary Estradiol pg/mg'); %Axis Label
ylim([0.001 19.5]); hold on; yyaxis right;hold on;  %Setting standard E2 y-axis limits, switching to aPG axis
plot(MenoapregMeansRevised,'--','color',[0.3 0.3 0.3],'LineWidth',3); %Plot aPG
e=errorbar(x,yapreg,errapreg,'MarkerSize',5,'MarkerEdgeColor','k','MarkerFaceColor','k'); hold on;e.Color= 'black'; %plot aPG error bar and set appearance
xticks([ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'}); %Define X-Axis Ticks
xlabel('Day Relative to Midcycle');ylabel('Urinary a-Pregnanediol pg/mg'); %label title of x axis and aPG y axis
title('Average Premenopausal Estradiol and a-Pregnanediol');
ylim([0.001 140]);xlim([1 15]); %Define aPG y limits and x axis limit
ax = gca;ax.YAxis(1).Color = 'k';ax.YAxis(2).Color = 'k'; 

subplot(2,3,5);
for a=[1:4]
    plot(AllAdjustedMENOE2s(:,a),'-','color',[0.5 0.5 0.5],'LineWidth',1);%[0 0.6+((a/13)-0.4) 0.6+((a/13)-0.4)]); 
    hold on;
end
ylabel('Urinary Estradiol (pg/mg)'); ylim([0 30]);
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
for a=[1:4]
    hold on; yyaxis right;
plot(AllapregsMENOAdjusted(:,a),'--','color',[0.3 0.3 0.3],'LineWidth',1);
end
ylim([0.001 325]); xlim([1 1440*14]);
title('All Individual E2 and a-Pregnanediol');xlabel('Day Relative to Cycle Mid Point');ylabel('Urinary a-Pregnanediol (pg/mg)');
ax = gca;ax.YAxis(1).Color = 'k';ax.YAxis(2).Color = 'k'; 

subplot(2,3,6);
plot(Cycle57E2,'color',[0.5 0.5 0.5],'LineWidth',3);
ylabel('Urinary Estradiol (pg/mg)');axis tight; ylim([0 25]);hold on; yyaxis right;
plot(Cycle57apreg,'color',[0.3 0.3 0.3],'LineWidth',3);
ylim([0 350])
xticks([ 1 1440 1440*2 1440*3 1440*4 1440*5 1440*6 1440*7 1440*8 1440*9 1440*10 1440*11 1440*12 1440*13 1440*14]);
xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','+1','2','3','4','5' '6' '7'});
xlabel('Day Relative to Cycle Mid Point');ylabel('Urinary a-Pregnanediol (pg/mg)');
ax = gca;ax.YAxis(1).Color = 'k';ax.YAxis(2).Color = 'k'; %Make sure axis colors are all black
title('Cycle 17 Estradiol and a-Pregnanediol');

%print(Figure1Hormones,'-djpeg','-r1000','C:\Users\Azure\Google Drive\Berkeley Grad School\QCycle\Manuscript Elements\LH Prediction MS Figures\UpdatedFigure1wSubplots');

%% Figure 2 DBT URs
%2A
Fig4FTempURPower=figure; 
subplot(2,2,1);
hold on;plot(FTempURPowersAdjustedMean,'color',[0.5 0 0.5],'LineWidth',4); %plot average DBT power surrounding surge
x=1:length(FTempOvURAdjustedPlusSTD);a=fill([x fliplr(x)],[FTempOvURAdjustedPlusSTD' flipud(FTempOvURAdjustedMinusSTD)'],[0.8 0 0.5]); alpha(0.05); set(a,'EdgeColor','none'); %Creating shaded stdev
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]); xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 475*14]); ylim([-1 1]); %limits
xlabel('Day Relative to LH Surge Onset');ylabel('Z-Scored DBT Ultradian Power');%title('Ultradian Power of DBT Relative to LH Surge Onset'); %axis labels and title
%print(Fig4FTempURPower,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%2B premeno individual cycle 16
subplot(2,2,2);
plot(movmean(Cycle16DBTUR,475*2),'-','color',[0.5 0 0.5],'LineWidth',4); %DBT
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]); xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([ 0 475*14]); ylim([0.1 0.7]);xlabel('Day Relative to LH Surge Onset');ylabel('DBT Ultradian Power');%title('DBT UR Power Cycle 16');

%2C perimeno mean and stdev
subplot(2,2,3);
plot(MenoFTempURPowersAdjustedMean,'color',[0.5 0 0.5],'LineWidth',4);hold on;
x=1:length(MenoFTempOvURAdjustedPlusSTD);a=fill([x fliplr(x)],[MenoFTempOvURAdjustedPlusSTD' flipud(MenoFTempOvURAdjustedMinusSTD)'],[0.8 0 0.5]); alpha(0.05); set(a,'EdgeColor','none')
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]); xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-1 1]);
xlabel('Day Relative to Cycle Midpoint'); ylabel('Z-Scored DBT Ultradian Power');%title('Ultradian Power of DBT in Perimenopause');

%2D perimeno individual cycle 48
subplot(2,2,4);
plot(movmean(Cycle48DBTUR,475*2),'-','color',[0.5 0 0.5],'LineWidth',4); %DBT
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]); xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([ 0 475*14]); ylim([0.1 0.7]);xlabel('Day Relative to Cycle Midpoint');ylabel('DBT Ultradian Power');%title('DBT UR Power Cycle 16');
%print(Fig4FTempURPower,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Boxes for figure 2; Linear Excerpts of Data from Peak and Troughs for DBT 
%High DBT Power
%Cycle16DBTURPowerShort=NewQCycleDataAdjusted{11,16};
%Cycle52DBTURPowerShort=NewQCycleDataAdjusted{11,52};
Linearhighurpwr=figure;plot(movmean(Cycle16DBTURPowerShort(7608:8633),60*0.5),'color',[0.5 0 0.5],'LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([15 40]);xlim([0 60*16]);xlabel('Hours Since Waking');ylabel('DBT (C)');
%print(Linearhighurpwr,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%Low DBT Power
LinearLowurpwr=figure;plot(movmean(Cycle16DBTURPowerShort(14790:15800),60*0.5),'color',[0.5 0 0.5],'LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([15 40]);xlim([0 60*16]);xlabel('Hours Since Waking');ylabel('DBT (C)');
%print(LinearLowurpwr,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%High DBT Power
MenoLinearhighurpwr=figure;plot(movmean(Cycle52DBTURPowerShort(7608:8633),60*0.5),'color',[0.5 0 0.5],'LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([15 40]);xlim([0 60*16]);xlabel('Hours Since Waking');ylabel('DBT (C)');
%print(MenoLinearhighurpwr,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%Pretty Comparable DBT Power for menopausal individuals
MenoLinearLowurpwr=figure;plot(movmean(Cycle52DBTURPowerShort(19150:19940),60*0.5),'color',[0.5 0 0.5],'LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([15 40]);xlim([0 60*16]);xlabel('Hours Since Waking');ylabel('DBT (C)');%limits and labels
%print(MenoLinearLowurpwr,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer
%% Stats for Figures 2 and 3 : peak and trough days from a given individual, and avg peak and trough differences for all individuals
%(these individual comparisons aren't in ms, but they stack up well)

%2B Comparing Day 1, Peak Day and Trough Day
%DBT Premeno Stats b4 mc correct %chi sq=17.12 p = 2*10^-4 Using 1 point every 4 hours on each of the compared days, because the UR power is cycling every 2-4 h averaged in the bands we are comparing
[pftempur,tbldbt,statsdbt]=kruskalwallis([Cycle16DBTUR(1:80:480+80), Cycle16DBTUR(480*6:80:480*7),Cycle16DBTUR(480*11:80:480*12)]);
cdbt=multcompare(statsdbt,'Alpha',0.05); % still very significant after correcting for multiple comparisons


%2D Comparing Same Days as Premeno for consistency
%DBT Perimeno Stats %chi sq=4.99 p = 0.0823
[pftempurpremeno,tbldbtpremeno,statsdbtpremeno]=kruskalwallis([Cycle48DBTUR(1:80:480+80), Cycle48DBTUR(480*6:80:480*7),Cycle48DBTUR(480*11:80:480*12)]);
cdbt=multcompare(statsdbt,'Alpha',0.05); % still very significant after correcting for multiple comparisons

%Calculating power between average day of peak and average day of trough.
%Recall this is rough because individuals' peak and trough days move around
%a bit. The slope from initial inflection (~2 days in) to peak (6 days in) is
%mostly positive, whereas slope from initial infleciton(~2days in) to peak
%trough (10 days in) is mostly null

%note the peak vs the trough alone isn't different enough, but the difference bewteen peaks and troughs (the down from peak to trough, vs. flat slope for trough to trough). Any arbitrary number of comparisons
%could illustrate conserved peakiness prior to the surge. 
kruskalwallis([ForLancePeakTroughDiff' ForLanceTroughTroughDiff']);
%chi=10.5, p=0.0012
[ForLancep, ForLancetbl,ForLancestat]=ranksum(ForLancePeakTroughDiff',ForLanceTroughTroughDiff');

kruskalwallis([ForLancePeakTroughDiffHRV' ForLanceTroughTroughDiffHRV']);
%chisq=12.55 p =0.004
[ForLanceHRVp, ForLanceHRVtbl,ForLanceHRVstat]=ranksum(ForLancePeakTroughDiffHRV',ForLanceTroughTroughDiffHRV');

%Shows the slope from day -5 to day -1 (which is positive) is different for all individuals than the slope from day -5 to day 10 (which is around zero)
%Diffs generated from full res.
[h,p]=ttest(Day2to6Diff); %0.0242 (implying there is a conserved difference in power from day 2 to 6)
[h,p]=ttest(Day2to10Diff);% 0.7 (these represent similar troughs across individuals0


%HRV Individual Stats
%Figure 2B chi sq=13.37 p = 0.0013
[phrvur,tblhrv,statshrv]=kruskalwallis([Cycle21HRVUR(480*2:80:480*3), Cycle21HRVUR(480*4:80:480*5),Cycle21HRVUR(480*7:80:480*8)]);
chrv=multcompare(statshrv,'Alpha',0.05); % still very significant after correcting for multiple comparisons

%Figure 2D ReCheck
[phrvur,tblhrvmen,statshrvmen]=kruskalwallis([Cycle51HRVUR(480*2:80:480*3), Cycle51HRVUR(480*4:80:480*5),Cycle51HRVUR(480*7:80:480*8)]);
chrvmrn=multcompare(statshrvmen,'Alpha',0.05); %

%% Figure 3 HRV URs
%3A
Fig4HRVURPower=figure; 
subplot(2,2,1);
plot(HRVURPowersAdjustedMean,'color','b','LineWidth',4);hold on; 
x=1:length(HRVURAdjustedPlusSTD); a=fill([x fliplr(x)],[HRVURAdjustedPlusSTD' flipud(HRVURAdjustedMinusSTD)'],[0 0 1]); alpha(0.1); set(a,'EdgeColor','none'); %stdev back fill
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]);xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([0 475*14]);ylim([-1 1]); %set limits
xlabel('Day Relative to LH Surge Onset');ylabel('Z-Scored HRV (RMSSD)Ultradian Power');%title('Ultradian Power of HRV (RMSSD)'); %axis labels and titles

%3B
subplot(2,2,2);
plot(movmean(Cycle21HRVUR,475*2),'-','color',[0 0 1],'LineWidth',4); %plot HRV
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]); xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','LH','1','2','3','4','5' '6' '7'});
xlim([ 0 475*14]); ylim([0.1 0.7]);xlabel('Day Relative to Cycle Midpoint');ylabel('HRV (RMSSD) Ultradian Power');%title('HRV (RMSSD) UR Power Cycle 21');

%3C
subplot(2,2,3);
plot(MenoHRVURPowersAdjustedMean,'color','b','LineWidth',4);hold on;
x=1:length(MenoHRVOvURAdjustedPlusSTD);a=fill([x fliplr(x)],[MenoHRVOvURAdjustedPlusSTD' flipud(MenoHRVOvURAdjustedMinusSTD)'],[0 0 1]); alpha(0.1); set(a,'EdgeColor','none'); %stdev back fill
xticks([ 1 475-60*3 475*2-60*3 475*3-60*3 475*4-60*3 475*5-60*3 475*6-60*3 475*7-60*3 475*8-60*3 475*9-60*3 475*10-60*3 475*11-60*3 475*12-60*3 475*13-60*3 475*14-60*3]);xticklabels({ '-7','-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([0 475*14]); ylim([-1 1]); % set limits
xlabel('Day Relative to Cycle Mid Point');ylabel('Z-Scored HRV (RMSSD) Ultradian');%title('Ultradian Power of HRV in Perimenopause'); %axis labels and titles

%3D
subplot(2,2,4);
plot(movmean(Cycle51HRVUR,475*2),'-','color',[0 0 1],'LineWidth',4); %DBT
xticks([ 1 475 475*2 475*3 475*4 475*5 475*6 475*7 475*8 475*9 475*10 475*11 475*12 475*13 475*14]); xticklabels({'-7', '-6', '-5','-4','-3','-2','-1','Mid','1','2','3','4','5' '6' '7'});
xlim([ 0 475*14]); ylim([0.1 0.7]);xlabel('Day Relative to Cycle Midpoint');ylabel('HRV (RMSSD) Ultradian Power');%title('DBT UR Power Cycle 16');

%print(Fig4HRVURPower,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Boxes for figure 3; Linear Excerpts of Data from Peak and Troughs for HRV
%High HRV Power Premeno
LinearhighurpwrHRV=figure;plot(movmean(Cycle21HRVRawShort(4300:4720),60*0.5),'color','b','LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([25 140]);xlim([0 60*9]);xlabel('Hours Since Sleep Onset');ylabel('HRV RMSSD');
%print(LinearhighurpwrHRV,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%Low HRV Power Premeno
LinearLowurpwrHRV=figure;plot(movmean(Cycle21HRVRawShort(11600:12000),60*0.5),'color','b','LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([25 140]);xlim([0 60*9]);xlabel('Hours Since Sleep Onset');ylabel('HRV RMSSD');
%print(LinearLowurpwrHRV,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%High HRV Power Meno
MenoLinearhighurpwrHRV=figure;plot(movmean(Cycle51HRVRawShort(5650:6100),60*0.5),'color','b','LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([5 70]);xlim([0 60*9]);xlabel('Hours Since Sleep Onset');ylabel('HRV RMSSD');
%print(MenoLinearhighurpwrHRV,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%Low HRV Power Meno
MenoLinearLowurpwrHRV=figure;plot(movmean(Cycle51HRVRawShort(9920:10400),60*0.5),'color','b','LineWidth',2);
xticks([ 1 60 60*2 60*3 60*4 60*5 60*6 60*7 60*8 60*9 60*10 60*11 60*12 60*13 60*14 60*15 60*16]);xticklabels({ 'Wake','1h', '2h','3h','4h','5h','6h','7h','8h','9h','10h','11h','12h' '13h' '14h' '15h' '16h'});
ylim([5 70]);xlim([0 60*9]);xlabel('Hours Since Sleep Onset');ylabel('HRV RMSSD');
%print(MenoLinearLowurpwrHRV,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%% Figure 4  Data Counts and Cumulative Histogram for + Inter vs. Intra Individual Differences

%Cumulative Histogram Data
% These counts generated from excel file; For plotter of Peaks and troughs
%for each cycle see supplemental figures script.
inflect1DBTxvals=[-8 -7 -6 -5 -4 -3 -2 -1 0 1 2];
inflect1DBTyvals=[2/45 14/45 28/45 36/45 43/45 45/45 45/45 45/45 45/45 45/45 45/45 ];
subsequentpeakDBTxvals=[-8 -7 -6 -5 -4 -3 -2 -1 0 1 2];
subsequentpeakDBTyvals=[0/45 0/45 0/45 3/45 10/45 17/45 38/45 42/45 42/45 43/45 45/45];

inflect1HRVxvals=[-8 -7 -6 -5 -4 -3 -2 -1 0 1 2];
inflect1HRVyvals=[5/45 18/45 27/45 37/45 42/45 43/45 45/45 45/45 45/45 45/45 45/45 ];
subsequentpeakHRVxvals=[-8 -7 -6 -5 -4 -3 -2 -1 0 1 2];
subsequentpeakHRVyvals=[0/45 0/45 1/45 9/45 15/45 24/45 32/45 38/45 43/45 44/45 45/45];

%Plot Figure 4a
CumulativeHisto=figure; plot(inflect1DBTxvals,inflect1DBTyvals,'--','color',[0.5 0 0.5],'LineWidth',4); %FTEMP
xlabel('Day Relative to LH Surge Onset'); ylabel('Percent of Cycles');
hold on;plot(subsequentpeakDBTxvals,subsequentpeakDBTyvals,'-','color',[0.5 0 0.5],'LineWidth',4);
plot(inflect1HRVxvals,inflect1HRVyvals,'--','color','b','LineWidth',4); %FTEMP
xlabel('Day Relative to LH Surge Onset'); ylabel('Percent of Cycles');
hold on;plot(subsequentpeakHRVxvals,subsequentpeakHRVyvals,'-','color','b','LineWidth',4);
%print(CumulativeHisto,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer

%Figure 4B Bar Graph of Intra vs. Inter-Individual Differences

%HRV Individual Inflection Range = 1.45; Individual subsequent peak Range = 2.2
%HRV Inter-Indiv Inflect Range = 6; Inter-Indiv Subsequent Peak Range = 8

%DBT Individual Inflection Range = 1.15; Individual subsequent peak Range= 1.6
%DBT Inter-Indiv Inflect Range = 5; Inter-Indiv Subsequent Peak Range = 7

IntervsIntra=figure;c=bar([1,2,3,4],[1.45,6,2.2,8],0.5); 
c.FaceColor=[0 0 1];hold on; %HRV Comparison
b=bar([1.5,2.5,3.5,4.5],[1.15,5,1.6,7],0.5); %DBT Comparison
b.FaceColor=[0.5 0 0.5];
ylim([0 10]);xticks([1.25 2.25 3.25 4.25]);
xticklabels({'Intra','Inter','Intra','Inter'});ylabel('Range of Days Features Occurred');xlabel('Day of Inflection Point and Subsequent Peak Day');
%print(IntervsIntra,'-djpeg','-r1000','Your File Path Including File Name Here'); % If you want to save this figure at hires to your computer
