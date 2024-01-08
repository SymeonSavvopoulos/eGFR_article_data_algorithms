function [In_min_mean, In_mean, In_max_mean, In_min_std, In_std, In_max_std]=studies_set_1()


A=load('measurements_set_1.m');
do_age=load('do_ages_set_1.m');
interp_data=load('interp_dat_set_1.m');


prob_min=zeros(362,1);

prob_max=zeros(362,1);

prob=zeros(362,1);

for i=1:length(A)/2
    len(1,i)=nnz(A(2:28,2*i))+1;

i

    mytime=zeros(len(1,i),1);
mydata=zeros(len(1,i),1);

  for k=1:len(1,i)

mytime(k,1) = A(k,2*i-1);
mydata(k,1) =A(k,2*i);
  speed(i)=(A(2,2*i)-A(1,2*i))/(A(2,2*i-1)-A(1,2*i-1));
  end
  
  xq=[0:10:100];
  vq1 = interp1(mytime,mydata,xq);
 c_last(i)=19.5974+0.7463*vq1(1)+15.7827*(vq1(7)-vq1(1))/vq1(1)-0.1647*do_age(i);

  
  if c_last(i)<18
      c_last_min(i)=2;
      c_last_max(i)=c_last(i)+18;
  else
      c_last_min(i)=c_last(i)-18;
      c_last_max(i)=c_last(i)+18;
  end
      
gamma=0.0001;
alpha_min(i)=gamma/c_last_min(i)^2;
alpha_max(i)=gamma/c_last_max(i)^2;

beta_min(i)=-3*(alpha_min(i)*gamma/2)^0.5;
beta_max(i)=-3*(alpha_max(i)*gamma/2)^0.5;

g_a_min(i)=gamma/alpha_min(i);
g_a_max(i)=gamma/alpha_max(i);

c_3_min(i)=c_last_min(i)/3;
c_3_max(i)=c_last_max(i)/3;

theta_min(i)=c_3_min(i)+g_a_min(i)/(3*c_last_min(i));
theta_max(i)=c_3_max(i)+g_a_max(i)/(3*c_last_max(i));

lambda=[0.003764794	0.006961106	0.013900695	0.245790961	0.051907721	0.999984626	0.086558949	0.266972355	0.211896052	0.999808109	0.006776555	0.999786886	0.999973838	0.999984183	0.027914379	0.02310619	0.999962469	0.011148117	0.252659259	0.999991441	0.999959192	0.028948824	0.216790497	0.019592303	0.019335429	0.014628029	0.196814734	0.014293682	0.020052776	0.013023925	0.040038334	0.034071759	0.023705289	0.030388045	0.999923805	0.99998628	0.011892697	0.005971398	0.027366866	0.078100977	0.613095564	0.029815714	9.50E-05	0.999958408	0.019874325	0.046114928	0.243259282	0.999995242	0.999984626	0.484062246	0.999999333	0.114098611	0.999947386	0.999852545	0.999921621	0.06233616	0.014897406	0.171870654	0.01482007	0.209785692	0.017119655	0.286324491	0.155831081	0.011645654	0.999985954	0.999880719	0.057975648	0.999962504	0.060503297	0.999826874	0.015404234	0.029811611	0.50406263	0.0158907	0.169897451	0.999984627	0.999980848	0.999979285	3.90E-05	0.999992785	0.578946953	0.314801349	0.410056944	0.022111191	0.11128431	0.999981362	0.002412198	0.105227091	0.016946525	0.020807642	0.999823932	0.066181935	0.019343108	0.999853535	0.013635635	0.037401256	0.020767302	0.182667154	0.999979285	0.099146488	0.999958408	0.005697421	0.006513112	0.007681165	0.080145542	0.999984626	0.136988489	0.031133138	0.999937864	0.999994862	0.999928139	0.036417807	0.080293833	0.073385029	0.999960101	0.999943333	0.060521824	0.999956018	0.065556581	0.016114525	0.211788957	0.1736185	0.444258401	0.206484733	0.069512805	0.002341443	0.999986567	0.023810484	0.217367648	0.243551865	0.996485122	0.999680417	0.999853535	0.999979306	0.007995793	0.999984626	0.289463066	0.009120528	0.008290239	0.125743364	0.050783572	0.093518032	0.073146987	0.24176417	0.124903461	0.014189094	0.011097026	0.999956019	0.999960053	0.115289843	0.999866587	0.99998412	0.27554742	0.167277418	2.92E-05	0.007405897	0.207348031	0.214744131	0.020941832	0.016915091	0.261076944	0.193589975	0.011866788	0.024263866	7.03E-05	0.001309918	0.035425111	0.142275097	0.059077403	0.151930977	0.436096709	0.025089299	0.16553816	0.999937864	0.053327224	0.018082707	0.121308912	0.004599981	0.041265596	0.012554071	0.999943333	0.093873378	0.301246804	0.999960054	0.318382654	0.196685233	0.011906389	0.216181306	0.44643667	0.999930077	0.762127931	0.999986568	0.999969295	0.358249602	0.999989941	0.017957692	0.018585548	0.038972036	0.212100365	0.012759728	0.024017678	0.20809756	0.081525326	0.109687287	0.016959101	0.322010394	0.031896491	0.102693417	0.050224038	0.020243163	0.039999999	0.103170617	0.151170203	0.999982112	0.109538908	0.012747518	0.145769807	0.614000668	0.212006612	0.999845806	0.006067152	0.774760009	0.028753661	0.1253899	0.999930077	0.015732095	0.006360901	0.039334444	0.999981737	0.008228811	0.002470953	0.313824621	0.010671748	0.166499261	0.023835136	0.074770165	0.371368999	0.025815732	0.006199822	0.159986778	0.026392983	0.044435212	0.091235118	0.186584992	0.234526713	0.999958409	0.999811041	0.185586123	0.022419116	0.218868432	0.093155706	0.999980848	0.271760322	0.999937864	0.999912336	0.131954278	0.019127319	0.013757567	0.999979306	0.066177914	0.143507074	0.052302928	0.073018531	0.016711485	0.141571643	0.292343498	0.9999113	0.086856275	0.012434651	0.30264432	0.999983146	0.999980848	0.139580005	0.119374219	0.999994862	0.99992814	0.146581317	0.19918637	0.02616006	0.236528077	0.059384868	0.041056088	0.37715666	0.039892095	0.730191297	0.99998097	0.015765849	0.087568402	8.10E-06	0.345509076	0.312802999	0.999980848	0.999979285	0.06285237	0.098423121	0.999928139	0.015424783	0.035007093	0.020255088	0.02262851	0.137245952	0.90973998	0.167230975	0.133923648	0.999845806	0.213917083	0.012955712	0.220894134	0.026499945	0.00750807	0.093331153	0.056073792	0.13639388	3.57E-06	0.999989942	0.192225446	0.036939016	0.449514239	0.088168345	0.999998695	0.156025767	0.99993329	0.188213558	0.035738881	0.999971987	0.999958408	0.325471367	0.032179114	0.999979306	0.794621805	0.130693951	0.999980848	0.006053169	0.999937864	0.189744204	0.999988305	0.233737567	0.063488922	0.084839233	0.230764739	0.999943333	0.295129486	0.007885767	0.102062569	0.025080607	0.030880951	0.270458206	0.050594665	0.999974767	0.329490184	0.309989013	0.011632891	0.999969295	0.190569879	0.297184225	0.100409048	0.999934393	0.216619663	0.013780046	0.999971567	0.121218718	0.060889648 ];



    for k=1:length(lambda)
        f_min=@(x,y) [ y(2); -lambda(k)*y(2)-(alpha_min(i)*y(1)*y(1)*y(1)+beta_min(i)*y(1)*y(1)+gamma*y(1))];
    [ts,ys_min] = ode45(f_min,[0,630],[interp_data(7,i);(interp_data(7,i)-interp_data(6,i))/10]);    
    if ys_min(end,1)<theta_min(i)
        reject_min_1(k,i)=1;
    else
        reject_min_1(k,i)=0;
    end
    end
end
    for i=1:length(A)/2
totp_min(i)=sum(reject_min_1(:,i));
end
prob_min=totp_min'/362;
    


%==============================================================================================================================
%==============================================================================================================================
%==============================================================================================================================




for i=1:length(A)/2
    len(1,i)=nnz(A(2:28,2*i))+1;

i

    mytime=zeros(len(1,i),1);
mydata=zeros(len(1,i),1);

  for k=1:len(1,i)

mytime(k,1) = A(k,2*i-1);
mydata(k,1) =A(k,2*i);
  speed(i)=(A(2,2*i)-A(1,2*i))/(A(2,2*i-1)-A(1,2*i-1));
  end
  
  xq=[0:10:100];
  vq1 = interp1(mytime,mydata,xq);
 c_last(i)=19.5974+0.7463*vq1(1)+15.7827*(vq1(7)-vq1(1))/vq1(1)-0.1647*do_age(i);


  if c_last(i)<18
      c_last_min(i)=2;
      c_last_max(i)=c_last(i)+18;
  else
      c_last_min(i)=c_last(i)-18;
      c_last_max(i)=c_last(i)+18;
  end
      
gamma=0.0001;
alpha_min(i)=gamma/c_last_min(i)^2;
alpha_max(i)=gamma/c_last_max(i)^2;

beta_min(i)=-3*(alpha_min(i)*gamma/2)^0.5;
beta_max(i)=-3*(alpha_max(i)*gamma/2)^0.5;

g_a_min(i)=gamma/alpha_min(i);
g_a_max(i)=gamma/alpha_max(i);

c_3_min(i)=c_last_min(i)/3;
c_3_max(i)=c_last_max(i)/3;

theta_min(i)=c_3_min(i)+g_a_min(i)/(3*c_last_min(i));
theta_max(i)=c_3_max(i)+g_a_max(i)/(3*c_last_max(i));

lambda=[0.003764794	0.006961106	0.013900695	0.245790961	0.051907721	0.999984626	0.086558949	0.266972355	0.211896052	0.999808109	0.006776555	0.999786886	0.999973838	0.999984183	0.027914379	0.02310619	0.999962469	0.011148117	0.252659259	0.999991441	0.999959192	0.028948824	0.216790497	0.019592303	0.019335429	0.014628029	0.196814734	0.014293682	0.020052776	0.013023925	0.040038334	0.034071759	0.023705289	0.030388045	0.999923805	0.99998628	0.011892697	0.005971398	0.027366866	0.078100977	0.613095564	0.029815714	9.50E-05	0.999958408	0.019874325	0.046114928	0.243259282	0.999995242	0.999984626	0.484062246	0.999999333	0.114098611	0.999947386	0.999852545	0.999921621	0.06233616	0.014897406	0.171870654	0.01482007	0.209785692	0.017119655	0.286324491	0.155831081	0.011645654	0.999985954	0.999880719	0.057975648	0.999962504	0.060503297	0.999826874	0.015404234	0.029811611	0.50406263	0.0158907	0.169897451	0.999984627	0.999980848	0.999979285	3.90E-05	0.999992785	0.578946953	0.314801349	0.410056944	0.022111191	0.11128431	0.999981362	0.002412198	0.105227091	0.016946525	0.020807642	0.999823932	0.066181935	0.019343108	0.999853535	0.013635635	0.037401256	0.020767302	0.182667154	0.999979285	0.099146488	0.999958408	0.005697421	0.006513112	0.007681165	0.080145542	0.999984626	0.136988489	0.031133138	0.999937864	0.999994862	0.999928139	0.036417807	0.080293833	0.073385029	0.999960101	0.999943333	0.060521824	0.999956018	0.065556581	0.016114525	0.211788957	0.1736185	0.444258401	0.206484733	0.069512805	0.002341443	0.999986567	0.023810484	0.217367648	0.243551865	0.996485122	0.999680417	0.999853535	0.999979306	0.007995793	0.999984626	0.289463066	0.009120528	0.008290239	0.125743364	0.050783572	0.093518032	0.073146987	0.24176417	0.124903461	0.014189094	0.011097026	0.999956019	0.999960053	0.115289843	0.999866587	0.99998412	0.27554742	0.167277418	2.92E-05	0.007405897	0.207348031	0.214744131	0.020941832	0.016915091	0.261076944	0.193589975	0.011866788	0.024263866	7.03E-05	0.001309918	0.035425111	0.142275097	0.059077403	0.151930977	0.436096709	0.025089299	0.16553816	0.999937864	0.053327224	0.018082707	0.121308912	0.004599981	0.041265596	0.012554071	0.999943333	0.093873378	0.301246804	0.999960054	0.318382654	0.196685233	0.011906389	0.216181306	0.44643667	0.999930077	0.762127931	0.999986568	0.999969295	0.358249602	0.999989941	0.017957692	0.018585548	0.038972036	0.212100365	0.012759728	0.024017678	0.20809756	0.081525326	0.109687287	0.016959101	0.322010394	0.031896491	0.102693417	0.050224038	0.020243163	0.039999999	0.103170617	0.151170203	0.999982112	0.109538908	0.012747518	0.145769807	0.614000668	0.212006612	0.999845806	0.006067152	0.774760009	0.028753661	0.1253899	0.999930077	0.015732095	0.006360901	0.039334444	0.999981737	0.008228811	0.002470953	0.313824621	0.010671748	0.166499261	0.023835136	0.074770165	0.371368999	0.025815732	0.006199822	0.159986778	0.026392983	0.044435212	0.091235118	0.186584992	0.234526713	0.999958409	0.999811041	0.185586123	0.022419116	0.218868432	0.093155706	0.999980848	0.271760322	0.999937864	0.999912336	0.131954278	0.019127319	0.013757567	0.999979306	0.066177914	0.143507074	0.052302928	0.073018531	0.016711485	0.141571643	0.292343498	0.9999113	0.086856275	0.012434651	0.30264432	0.999983146	0.999980848	0.139580005	0.119374219	0.999994862	0.99992814	0.146581317	0.19918637	0.02616006	0.236528077	0.059384868	0.041056088	0.37715666	0.039892095	0.730191297	0.99998097	0.015765849	0.087568402	8.10E-06	0.345509076	0.312802999	0.999980848	0.999979285	0.06285237	0.098423121	0.999928139	0.015424783	0.035007093	0.020255088	0.02262851	0.137245952	0.90973998	0.167230975	0.133923648	0.999845806	0.213917083	0.012955712	0.220894134	0.026499945	0.00750807	0.093331153	0.056073792	0.13639388	3.57E-06	0.999989942	0.192225446	0.036939016	0.449514239	0.088168345	0.999998695	0.156025767	0.99993329	0.188213558	0.035738881	0.999971987	0.999958408	0.325471367	0.032179114	0.999979306	0.794621805	0.130693951	0.999980848	0.006053169	0.999937864	0.189744204	0.999988305	0.233737567	0.063488922	0.084839233	0.230764739	0.999943333	0.295129486	0.007885767	0.102062569	0.025080607	0.030880951	0.270458206	0.050594665	0.999974767	0.329490184	0.309989013	0.011632891	0.999969295	0.190569879	0.297184225	0.100409048	0.999934393	0.216619663	0.013780046	0.999971567	0.121218718	0.060889648 ];

    for k=1:length(lambda)
        f_max=@(x,y) [ y(2); -lambda(k)*y(2)-(alpha_max(i)*y(1)*y(1)*y(1)+beta_max(i)*y(1)*y(1)+gamma*y(1))];
    [ts,ys_max] = ode45(f_max,[0,630],[interp_data(7,i);(interp_data(7,i)-interp_data(6,i))/10]);    
    if ys_max(end,1)<theta_max(i)
        reject_max_1(k,i)=1;
    else
        reject_max_1(k,i)=0;
    end

    
    end
end

 for i=1:length(A)/2
totp_max(i)=sum(reject_max_1(:,i));
end

prob_max=totp_max'/362;



for i=1:length(A)/2
    len(1,i)=nnz(A(2:28,2*i))+1;

i

    mytime=zeros(len(1,i),1);
mydata=zeros(len(1,i),1);

  for k=1:len(1,i)

mytime(k,1) = A(k,2*i-1);
mydata(k,1) =A(k,2*i);
  speed(i)=(A(2,2*i)-A(1,2*i))/(A(2,2*i-1)-A(1,2*i-1));
  end
  
  xq=[0:10:100];
  vq1 = interp1(mytime,mydata,xq);
 c_last(i)=19.5974+0.7463*vq1(1)+15.7827*(vq1(7)-vq1(1))/vq1(1)-0.1647*do_age(i);


      
gamma=0.0001;
alpha(i)=gamma/c_last(i)^2;

beta(i)=-3*(alpha(i)*gamma/2)^0.5;

g_a(i)=gamma/alpha(i);

c_3(i)=c_last(i)/3;


theta(i)=c_3(i)+g_a(i)/(3*c_last(i));

lambda=[0.003764794	0.006961106	0.013900695	0.245790961	0.051907721	0.999984626	0.086558949	0.266972355	0.211896052	0.999808109	0.006776555	0.999786886	0.999973838	0.999984183	0.027914379	0.02310619	0.999962469	0.011148117	0.252659259	0.999991441	0.999959192	0.028948824	0.216790497	0.019592303	0.019335429	0.014628029	0.196814734	0.014293682	0.020052776	0.013023925	0.040038334	0.034071759	0.023705289	0.030388045	0.999923805	0.99998628	0.011892697	0.005971398	0.027366866	0.078100977	0.613095564	0.029815714	9.50E-05	0.999958408	0.019874325	0.046114928	0.243259282	0.999995242	0.999984626	0.484062246	0.999999333	0.114098611	0.999947386	0.999852545	0.999921621	0.06233616	0.014897406	0.171870654	0.01482007	0.209785692	0.017119655	0.286324491	0.155831081	0.011645654	0.999985954	0.999880719	0.057975648	0.999962504	0.060503297	0.999826874	0.015404234	0.029811611	0.50406263	0.0158907	0.169897451	0.999984627	0.999980848	0.999979285	3.90E-05	0.999992785	0.578946953	0.314801349	0.410056944	0.022111191	0.11128431	0.999981362	0.002412198	0.105227091	0.016946525	0.020807642	0.999823932	0.066181935	0.019343108	0.999853535	0.013635635	0.037401256	0.020767302	0.182667154	0.999979285	0.099146488	0.999958408	0.005697421	0.006513112	0.007681165	0.080145542	0.999984626	0.136988489	0.031133138	0.999937864	0.999994862	0.999928139	0.036417807	0.080293833	0.073385029	0.999960101	0.999943333	0.060521824	0.999956018	0.065556581	0.016114525	0.211788957	0.1736185	0.444258401	0.206484733	0.069512805	0.002341443	0.999986567	0.023810484	0.217367648	0.243551865	0.996485122	0.999680417	0.999853535	0.999979306	0.007995793	0.999984626	0.289463066	0.009120528	0.008290239	0.125743364	0.050783572	0.093518032	0.073146987	0.24176417	0.124903461	0.014189094	0.011097026	0.999956019	0.999960053	0.115289843	0.999866587	0.99998412	0.27554742	0.167277418	2.92E-05	0.007405897	0.207348031	0.214744131	0.020941832	0.016915091	0.261076944	0.193589975	0.011866788	0.024263866	7.03E-05	0.001309918	0.035425111	0.142275097	0.059077403	0.151930977	0.436096709	0.025089299	0.16553816	0.999937864	0.053327224	0.018082707	0.121308912	0.004599981	0.041265596	0.012554071	0.999943333	0.093873378	0.301246804	0.999960054	0.318382654	0.196685233	0.011906389	0.216181306	0.44643667	0.999930077	0.762127931	0.999986568	0.999969295	0.358249602	0.999989941	0.017957692	0.018585548	0.038972036	0.212100365	0.012759728	0.024017678	0.20809756	0.081525326	0.109687287	0.016959101	0.322010394	0.031896491	0.102693417	0.050224038	0.020243163	0.039999999	0.103170617	0.151170203	0.999982112	0.109538908	0.012747518	0.145769807	0.614000668	0.212006612	0.999845806	0.006067152	0.774760009	0.028753661	0.1253899	0.999930077	0.015732095	0.006360901	0.039334444	0.999981737	0.008228811	0.002470953	0.313824621	0.010671748	0.166499261	0.023835136	0.074770165	0.371368999	0.025815732	0.006199822	0.159986778	0.026392983	0.044435212	0.091235118	0.186584992	0.234526713	0.999958409	0.999811041	0.185586123	0.022419116	0.218868432	0.093155706	0.999980848	0.271760322	0.999937864	0.999912336	0.131954278	0.019127319	0.013757567	0.999979306	0.066177914	0.143507074	0.052302928	0.073018531	0.016711485	0.141571643	0.292343498	0.9999113	0.086856275	0.012434651	0.30264432	0.999983146	0.999980848	0.139580005	0.119374219	0.999994862	0.99992814	0.146581317	0.19918637	0.02616006	0.236528077	0.059384868	0.041056088	0.37715666	0.039892095	0.730191297	0.99998097	0.015765849	0.087568402	8.10E-06	0.345509076	0.312802999	0.999980848	0.999979285	0.06285237	0.098423121	0.999928139	0.015424783	0.035007093	0.020255088	0.02262851	0.137245952	0.90973998	0.167230975	0.133923648	0.999845806	0.213917083	0.012955712	0.220894134	0.026499945	0.00750807	0.093331153	0.056073792	0.13639388	3.57E-06	0.999989942	0.192225446	0.036939016	0.449514239	0.088168345	0.999998695	0.156025767	0.99993329	0.188213558	0.035738881	0.999971987	0.999958408	0.325471367	0.032179114	0.999979306	0.794621805	0.130693951	0.999980848	0.006053169	0.999937864	0.189744204	0.999988305	0.233737567	0.063488922	0.084839233	0.230764739	0.999943333	0.295129486	0.007885767	0.102062569	0.025080607	0.030880951	0.270458206	0.050594665	0.999974767	0.329490184	0.309989013	0.011632891	0.999969295	0.190569879	0.297184225	0.100409048	0.999934393	0.216619663	0.013780046	0.999971567	0.121218718	0.060889648 ];


    for k=1:length(lambda)
        f=@(x,y) [ y(2); -lambda(k)*y(2)-(alpha(i)*y(1)*y(1)*y(1)+beta(i)*y(1)*y(1)+gamma*y(1))];
    [ts,ys] = ode45(f,[0,630],[interp_data(7,i);(interp_data(7,i)-interp_data(6,i))/10]);    
    if ys(end,1)<theta(i)
        reject_1(k,i)=1;
    else
        reject_1(k,i)=0;
    end
    end
   
end 


 for i=1:length(A)/2
totp(i)=sum(reject_1(:,i));
end
prob=totp'/362;




thre_1=[0.05:0.05:1];

success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=20;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_min(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_min(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_min(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u20=[xaxis',yaxis'];


success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=30;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_min(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_min(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_min(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u30_min=[xaxis',yaxis'];


success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=40;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_min(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_min(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_min(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u40_min=[xaxis',yaxis'];

success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=50;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_min(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_min(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_min(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_min(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u50_min=[xaxis',yaxis'];


thre_1=[0.05:0.05:1];

success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=20;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u20=[xaxis',yaxis'];


success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=30;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u30=[xaxis',yaxis'];


success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=40;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u40=[xaxis',yaxis'];

success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=50;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u50=[xaxis',yaxis'];


thre_1=[0.05:0.05:1];

success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=20;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_max(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_max(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_max(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u20=[xaxis',yaxis'];


success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=30;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_max(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_max(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_max(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u30_max=[xaxis',yaxis'];


success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=40;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_max(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_max(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_max(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;    
    
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u40_max=[xaxis',yaxis'];

success_and_predicted_success=zeros(362,length(thre_1));
failure_but_predicted_success=zeros(362,length(thre_1));
success_but_predicted_failure=zeros(362,length(thre_1));
failure_and_predicted_failure=zeros(362,length(thre_1));
GFR_critical=50;

for k=1:length(thre_1)
for i=1:length(A)/2
    
if prob_max(i)>thre_1(k) & interp_data(end,i)<GFR_critical
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)>thre_1(k) & interp_data(end,i)>GFR_critical
    success_but_predicted_failure(i,k)=1;
elseif prob_max(i)<=thre_1(k) & interp_data(end,i)>=GFR_critical
    success_and_predicted_success(i,k)=1;
elseif prob_max(i)<thre_1(k) & interp_data(end,i)<GFR_critical
    failure_but_predicted_success(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)<=GFR_critical  
    failure_and_predicted_failure(i,k)=1;
elseif prob_max(i)==1 &  interp_data(end,i)>=GFR_critical
    success_but_predicted_failure(i,k)=1;
end
end
x11(k)=sum(success_and_predicted_success(:,k));
x12(k)=sum(failure_but_predicted_success(:,k));
x21(k)=sum(success_but_predicted_failure(:,k));
x22(k)=sum(failure_and_predicted_failure(:,k));

yaxis(k)=x11(k)/(x11(k)+x21(k));
xaxis(k)=x12(k)/(x12(k)+x22(k)+1e-6);
%xaxis(k)=x11(k)/(x11(k)+x12(k)); %precision

end
u50_max=[xaxis',yaxis'];


u30_min=[0 0; u30_min; 1 1];
u40_min=[0 0; u40_min; 1 1];
u50_min=[0 0; u50_min; 1 1];


u30=[0 0; u30; 1 1];
u40=[0 0; u40; 1 1];
u50=[0 0; u50; 1 1];


u30_max=[0 0; u30_max; 1 1];
u40_max=[0 0; u40_max; 1 1];
u50_max=[0 0; u50_max; 1 1];

I30 = cumtrapz(u30(:,1),u30(:,2));
I40 = cumtrapz(u40(:,1),u40(:,2));
I50 = cumtrapz(u50(:,1),u50(:,2));

I30_min = cumtrapz(u30_min(:,1),u30_min(:,2));
I40_min = cumtrapz(u40_min(:,1),u40_min(:,2));
I50_min = cumtrapz(u50_min(:,1),u50_min(:,2));

I30_max = cumtrapz(u30_max(:,1),u30_max(:,2));
I40_max = cumtrapz(u40_max(:,1),u40_max(:,2));
I50_max = cumtrapz(u50_max(:,1),u50_max(:,2));

thr=[30;40;50];
In_min=[I30_min(end);I40_min(end);I50_min(end)];
In=[I30(end);I40(end);I50(end)];
In_max=[I30_max(end);I40_max(end);I50_max(end)];


In_min_mean=mean(In_min);
In_min_std=std(In_min);

In_mean=mean(In);
In_std=std(In);

In_max_mean=mean(In_max);
In_max_std=std(In_max);

