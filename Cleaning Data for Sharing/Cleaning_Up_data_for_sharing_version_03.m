%%   Cleaning Up data for sharing version 02

% I am going to write a short program to use in order to clean up the data
% for sharing for my haptic search experiments. 

% The goal is to read in all the raw data and compile it into a table. Then
% the Table can be saved as a .csv file that will be easy to share in
% OSF
%
%v02 Now that I have cleaned both the experiments collected data I want to
% think about cleaning up/ compiling all the video coded data.
%
%v03 I may not get to the cleaning of the video coding work due to time
%constraints of the final project for PSYC 259. I think I have illustrated
%the use of this program and how it will imporve my work given the two data
%sets I have cleaned. 

clear all
close all
commandwindow
clc


%%==============   Haptic NVP Data ======================

data_home= ("G:\Shared drives\Haptic Search Group Winter 2022\Experiment 2 Data_NVP")
program_home=( "C:\Users\hunte\OneDrive\Documents\MATLAB" )
Data=[];
Data_table=[];
DS_clean=[];
max_subjects=100;
num_of_sub= 0;
cd(data_home)

for si=1:max_subjects
    if exist(['Tactile_Search_2109_Experiment_2_Subject_',num2str(si),'_Block_2.csv'])
        num_of_sub= num_of_sub +1
        Data=[Data; csvread(['Tactile_Search_2109_Experiment_2_Subject_',num2str(si),'_Block_2.csv'])];
    end
end
cd(program_home);
for gi = 1:size(Data,1)
    if Data(gi,1) ~= 0 
    DS_clean= [DS_clean; Data(gi,:)];
    end
end
titles= {'Year','Month','Day','Hour','Minute','Seconds','Subject','Experiment','Trial','Distractor_num','Distractor_size',...
    'Setup_time(s)','Inspection_time(s)','Search_time(s)','Input_time(s)','Accuracy'}
Data_table = array2table(DS_clean,"VariableNames",titles)
writetable(Data_table,'NVP_Clean_Data.csv')

%%  ============== ===========  Haptic VP Data  ===============================
data_home= ("G:\Shared drives\Haptic Search Group Winter 2022\Experiment 1 Data_VP")
program_home=( "C:\Users\hunte\OneDrive\Documents\MATLAB" )
Data=[];
Data_table=[];
DS_clean=[];
max_subjects=1000;
num_of_sub= 0;
cd(data_home)


for si=1:max_subjects
    if exist(['Tactile_Search_2109_Experiment_1_Subject_',num2str(si),'_Block_2.csv'])
        num_of_sub= num_of_sub +1
        Data=[Data; csvread(['Tactile_Search_2109_Experiment_1_Subject_',num2str(si),'_Block_2.csv'])];
    end
end
cd(program_home);
for gi = 1:size(Data,1)
    if Data(gi,1) ~= 0 
    DS_clean= [DS_clean; Data(gi,:)];
    end
end

Data_table = array2table(DS_clean,"VariableNames",titles)
writetable(Data_table,'VP_Clean_Data.csv')
   

