clc
clear

%No rejection (nr) patients in set 1 (N1)
[data_nr_mean_set_1,data_nr_std_set_1]=studies_nr_set_1()

%One rejection (or) patients in set 1 (N1)
[data_or_mean_set_1,data_or_std_set_1]=studies_or_set_1()

%Multiple rejection (mr) patients in set 1 (N1)
[data_mr_mean_set_1,data_mr_std_set_1]=studies_mr_set_1()


%No rejection (nr) patients in set 2 (N2)
[data_nr_mean_set_2,data_nr_std_set_2]=studies_nr_set_2()

%One rejection (or) patients in set 2 (N2)
[data_or_mean_set_2,data_or_std_set_2]=studies_or_set_2()

%Multiple rejection (mr) patients in set 2 (N2)
[data_mr_mean_set_2,data_mr_std_set_2]=studies_mr_set_2()



figure(1)
xlim([0 5])

x1=[1:1:3];
y1=[data_nr_mean_set_1,data_or_mean_set_1,data_mr_mean_set_1];
err1=[data_nr_std_set_1,data_or_std_set_1,data_mr_std_set_1];

errorbar(x1,y1,err1,"o")
names = {'No rejection'; 'One rejection'; 'Multiple rejections'};
set(gca,'xtick',[1:3],'xticklabel',names)

hold on

x2=[1.2:1:3.2];
y2=[data_nr_mean_set_2,data_or_mean_set_2,data_mr_mean_set_2];
err2=[data_nr_std_set_2,data_or_std_set_2,data_mr_std_set_2];
errorbar(x2,y2,err2,"o")
names = {'No rejection'; 'One rejection'; 'Multiple rejections'};
set(gca,'xtick',[1.2:3.2],'xticklabel',names)

