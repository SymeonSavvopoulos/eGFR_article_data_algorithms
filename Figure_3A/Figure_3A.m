clc
clear

%All patients in set 1 (N1)
[data_min_thr_mean_set_1,data_mean_thr_mean_set_1,data_max_thr_mean_set_1,data_min_thr_std_set_1,data_mean_thr_std_set_1,data_max_thr_std_set_1]=studies_set_1()

%All patients in set 2 (N2)
[data_min_thr_mean_set_2,data_mean_thr_mean_set_2,data_max_thr_mean_set_2,data_min_thr_std_set_2,data_mean_thr_std_set_2,data_max_thr_std_set_2]=studies_set_2()


figure(1)
xlim([0 5])

x1=[2:1:4];
y1=[data_min_thr_mean_set_1,data_mean_thr_mean_set_1,data_max_thr_mean_set_1];
err1=[data_min_thr_std_set_1,data_mean_thr_std_set_1,data_max_thr_std_set_1];

errorbar(x1,y1,err1,"o")
names = {'GFR_{min}'; 'GFR_{mean}'; 'GFR_{max}'};
set(gca,'xtick',[2:4],'xticklabel',names)

hold on

x2=[2.2:1:4.2];
y2=[data_min_thr_mean_set_2,data_mean_thr_mean_set_2,data_max_thr_mean_set_2];
err2=[data_min_thr_std_set_2,data_mean_thr_std_set_2,data_max_thr_std_set_2];
errorbar(x2,y2,err2,"o")
names = {'GFR_{min}'; 'GFR_{mean}'; 'GFR_{max}'};
set(gca,'xtick',[2.2:4.2],'xticklabel',names)

