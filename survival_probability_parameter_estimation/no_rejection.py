# -*- coding: utf-8 -*-
"""
Created on Fri Feb 24 18:21:32 2023

@author: simon
"""



import numpy as np
from scipy.optimize import minimize
import math


def quadratic(x,a, b, c):
    return a/(1+2.73**(-b*x-c))

def objective(params):
    a, b, c = params
    return np.sum((quadratic(x,a,b, c) - y)**2)



# Load the data - the extra zeros are added as the curve should start from 0 
y=np.array([0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,	0.320	,	0.320	,	0.360	,	0.400	,	0.430	,	0.440	,	0.450	,	0.460	,	0.460	,	0.470	,	0.490	,	0.490	,	0.500	,	0.510	,	0.510	,	0.520	,	0.520	,	0.520	,	0.520	,	0.530	,	0.550	,	0.560	,	0.560	,	0.560	,	0.560	,	0.570	,	0.570	,	0.580	,	0.590	,	0.600	,	0.600	,	0.600	,	0.620	,	0.620	,	0.620	,	0.620	,	0.630	,	0.630	,	0.630	,	0.630	,	0.630	,	0.630	,	0.640	,	0.640	,	0.640	,	0.640	,	0.660	,	0.660	,	0.660	,	0.660	,	0.670	,	0.670	,	0.670	,	0.670	,	0.680	,	0.680	,	0.680	,	0.680	,	0.680	,	0.690	,	0.690	,	0.690	,	0.690	,	0.700	,	0.710	,	0.710	,	0.710	,	0.720	,	0.720	,	0.730	,	0.730	,	0.730	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.750	,	0.750	,	0.750	,	0.750	,	0.750	,	0.750	,	0.750	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.770	,	0.770	,	0.770	,	0.770	,	0.770	,	0.770	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.790	,	0.790	,	0.790	,	0.790	,	0.800	,	0.800	,	0.800	,	0.800	,	0.800	,	0.800	,	0.800	,	0.810	,	0.810	,	0.810	,	0.810	,	0.820	,	0.820	,	0.820	,	0.820	,	0.820	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.850	,	0.850	,	0.850	,	0.850	,	0.850	,	0.850	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.980	,	0.980	,	0.980	,	0.980	,	0.990	,	0.990	,	0.990	,	0.990	,	0.990	,	0.990])
x=np.array([0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0, 0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0,0	, 0, 	33.79982143	,	20.13627968	,	22.2041	,	26.51588235	,	23.53020202	,	41.76428571	,	38.742	,	37.63614754	,	29.3801897	,	21.12421053	,	42.88755556	,	21.93301242	,	35.74915989	,	21.17990476	,	38.70090909	,	43.96355978	,	68.82374194	,	34.39377049	,	32.21162338	,	14.93542466	,	36.52323651	,	52.20913699	,	27.16733957	,	36.2874359	,	24.98554545	,	22.9369281	,	23.24649123	,	32.95145455	,	22.81222727	,	20.95032468	,	77.615	,	59.33967603	,	32.26805195	,	52.52169863	,	30.97466042	,	36.8915	,	38.01504202	,	22.59303226	,	22.54856287	,	28.36021918	,	26.63813559	,	18.48231214	,	36.50025862	,	53.20203915	,	27.46660131	,	44.61627329	,	25.87436658	,	26.70800539	,	40.02754386	,	28.60650485	,	31.64256198	,	36.65543689	,	33.68681081	,	44.30931937	,	27.30863636	,	38.70085246	,	32.67421053	,	33.11828402	,	55.32528767	,	52.53177898	,	53.85267016	,	40.39389671	,	31.75364985	,	36.70545455	,	73.64363636	,	43.57210674	,	47.72015873	,	37.75851752	,	39.97806452	,	43.01161644	,	22.87880109	,	32.34174603	,	30.21026239	,	31.00067606	,	53.97239203	,	74.88128319	,	39.66857143	,	41.8840274	,	42.1972103	,	52.89158607	,	96.03133333	,	31.68064516	,	27.65126984	,	70.38542936	,	62.18854305	,	30.85979592	,	49.47146341	,	28.41885246	,	108.0348024	,	67.99398417	,	76.55537415	,	72.52193878	,	42.12140436	,	55.78228571	,	50.94271676	,	34.77347926	,	71.32225275	,	73.2602551	,	85.9477551	,	58.48387755	,	72.25191489	,	46.21038961	,	41.26276888	,	43.79245014	,	59.64165025	,	48.37737931	,	63.53890173	,	36.15102981	,	61.27221024	,	32.8576824	,	44.07433962	,	35.08412451	,	43.8908867	,	35.095	,	62.54953846	,	35.10416667	,	95.48261097	,	74.35227273	,	37.51766423	,	40.81016173	,	74.45875	,	34.95591837	,	51.55282974	,	34.11452012	,	39.41479452	,	83.13738776	,	81.68562842	,	51.25040816	,	55.23298153	,	63.87100529	,	65.46022599	,	119.3089754	,	63.259	,	29.00257534	,	39.32428571	,	81.71039039	,	54.45285714	,	48.78702041	,	37.7788806	,	84.48697248	,	45.46629464	,	68.66390836	,	50.87527897	,	39.35133333	,	35.37459016	,	55.98360743	,	62.64182482	,	62.14271795	,	58.91494305	,	41.13382979	,	42.97	,	78.56388175	,	62.21861048	,	42.08447964	,	61.48065574	,	58.83569014	,	38.01058252	,	25.06	,	30.59	,	95.69901478	,	89.52073569	,	36.65105769	,	40.07	,	18.15777778	,	55.78877778	,	8.76	,	17.46	,	40.60959184	,	27.634	,	98.96333333	,	42.79412104	,	63.88306383	,	40	,	22.26	,	29.63	,	26.31	,	50.02927039	,	32.87	,	36.45309735	,	67.55978892	,	41.15466667	,	49.11452514	,	45.29884097	,	57.62791878	,	110.2262931	,	47.8549726	,	52.89063694	,	46.68824513	,	43.36095238	,	71.61784264	,	82.11962264	,	43.019081	,	56.29187179	,	45.82872774	,	90.74089888	,	57.39912863	,	47.86730458	,	33.12497041	,	68.83348315	,	55.86041916	,	66.28084592	,	60.13629893	,	74.62922652	,	85.24830645	,	49.58850829	,	50.82461538	,	48.21948529	,	91.79909297	,	51.34381963	,	85.10661721	,	61.09	,	41.53540816	,	74.38541547	,	73.50577007	,	43.34560364	,	76.11037736	,	66.76202658	,	62.66134948	,	80.10065089	,	67.38355972	,	45.90300448	,	45.61337838	,	38.57578616	,	71.93758242	,	74.63928571	,	82.73669834	,	50.99820253	,	44.63267532	,	62.91698113	,	66.15	,	84.67266667	,	88.97595694	,	56.40510086	,	60.81419355	,	41.22606061	,	80.87636364	,	81.06804348	,	157.0520823	,	53.45263636	,	65.08285714	,	55.37053571	,	88.7910453	,	73.65477366	,	61.47768254	,	80.73115385	,	63.52201072	,	64.77211864	,	68.18060274	,	65.21327103	,	60.86730769	,	52.29508242	,	50.56109244	,	54.81376694	,	90.97255639	,	69.06726027	,	49.39934021	,	62.6365748	,	70.61031746	,	56.43049887	,	51.13944056	,	50.42796721	,	75.40343826	,	65.46781931	,	67.46867347	,	46.76033708	,	51.95952247	,	59.67135338	,	71.29142857	,	68.03	,	80.00343558	,	51.4827933	,	68.36594828	,	40.94311005	,	99.11041353	,	60.35657426	,	41.5736105	,	58.38543956	,	94.430625	,	69.0486711	,	61.40816279	,	51.76510204	,	51.15785714	,	57.63278061	,	44.31566964	,	53.55721198	,	68.93	,	79.85325714	,	107.4177143	,	129.5627907	,	86.01811321	,	54.45572414	,	63.06814607	,	116.5237097	,	72.76506739	,	76.20611898	,	58.75940541	,	81.81495238	,	52.06241096	,	69.01350427	,	66.24880435	,	59.9535533	,	74.54784566	,	67.04556738	,	71.7961991	,	46.76785714	,	100.2788372	,	52.72099715	,	60.46747604	,	55.77366548	,	47.17456522	,	55.17806122	,	69.86287212	,	60.79869565	,	44.12067055	,	52.32540146	,	112.0065957	,	71.39692506	,	70.83076923	,	78.61315068	,	100.1105797	,	86.49886199	,	50.92274238	,	88.8698338	,	59.68579832	,	57.28556769	,	51.14273138	,	62.65021978	,	90.41237624	,	61.85	,	67.60098901	,	69.4169163	,	70.43171429	,	60.93972125	,	63.26935361	,	82.44096346	,	128.9867147	,	58.07537778	,	71.98584821	,	69.965209	,	47.64601824	,	94.79862745	,	61.95057692	,	57.80506494	,	60.88324561	,	82.20629428	,	95.79158683	,	66.0047138	,	79.50087912	,	53.86833333	,	77.74064516	,	65.65612245	,	59.06637168	,	76.07804408	,	51.83497143	,	64.50692494	,	62.18142857	,	72.68456464	,	71.975625	,	95.04613372	,	77.84623762	,	89.76683983	,	77.40792642])

# Define the objective function
def objective(params):
    a,b, c = params
    return np.sum((quadratic(x, a,b, c) - y)**2)

# Estimate the parameters using the least squares method
initial_guess = [0,0, 0]
result = minimize(objective, initial_guess)

yorig=np.array([0.320	,	0.320	,	0.360	,	0.400	,	0.430	,	0.440	,	0.450	,	0.460	,	0.460	,	0.470	,	0.490	,	0.490	,	0.500	,	0.510	,	0.510	,	0.520	,	0.520	,	0.520	,	0.520	,	0.530	,	0.550	,	0.560	,	0.560	,	0.560	,	0.560	,	0.570	,	0.570	,	0.580	,	0.590	,	0.600	,	0.600	,	0.600	,	0.620	,	0.620	,	0.620	,	0.620	,	0.630	,	0.630	,	0.630	,	0.630	,	0.630	,	0.630	,	0.640	,	0.640	,	0.640	,	0.640	,	0.660	,	0.660	,	0.660	,	0.660	,	0.670	,	0.670	,	0.670	,	0.670	,	0.680	,	0.680	,	0.680	,	0.680	,	0.680	,	0.690	,	0.690	,	0.690	,	0.690	,	0.700	,	0.710	,	0.710	,	0.710	,	0.720	,	0.720	,	0.730	,	0.730	,	0.730	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.740	,	0.750	,	0.750	,	0.750	,	0.750	,	0.750	,	0.750	,	0.750	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.760	,	0.770	,	0.770	,	0.770	,	0.770	,	0.770	,	0.770	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.780	,	0.790	,	0.790	,	0.790	,	0.790	,	0.800	,	0.800	,	0.800	,	0.800	,	0.800	,	0.800	,	0.800	,	0.810	,	0.810	,	0.810	,	0.810	,	0.820	,	0.820	,	0.820	,	0.820	,	0.820	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.830	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.840	,	0.850	,	0.850	,	0.850	,	0.850	,	0.850	,	0.850	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.860	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.870	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.880	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.890	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.900	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.910	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.920	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.930	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.940	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.950	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.960	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.970	,	0.980	,	0.980	,	0.980	,	0.980	,	0.990	,	0.990	,	0.990	,	0.990	,	0.990	,	0.990])
xorig=np.array([33.79982143	,	20.13627968	,	22.2041	,	26.51588235	,	23.53020202	,	41.76428571	,	38.742	,	37.63614754	,	29.3801897	,	21.12421053	,	42.88755556	,	21.93301242	,	35.74915989	,	21.17990476	,	38.70090909	,	43.96355978	,	68.82374194	,	34.39377049	,	32.21162338	,	14.93542466	,	36.52323651	,	52.20913699	,	27.16733957	,	36.2874359	,	24.98554545	,	22.9369281	,	23.24649123	,	32.95145455	,	22.81222727	,	20.95032468	,	77.615	,	59.33967603	,	32.26805195	,	52.52169863	,	30.97466042	,	36.8915	,	38.01504202	,	22.59303226	,	22.54856287	,	28.36021918	,	26.63813559	,	18.48231214	,	36.50025862	,	53.20203915	,	27.46660131	,	44.61627329	,	25.87436658	,	26.70800539	,	40.02754386	,	28.60650485	,	31.64256198	,	36.65543689	,	33.68681081	,	44.30931937	,	27.30863636	,	38.70085246	,	32.67421053	,	33.11828402	,	55.32528767	,	52.53177898	,	53.85267016	,	40.39389671	,	31.75364985	,	36.70545455	,	73.64363636	,	43.57210674	,	47.72015873	,	37.75851752	,	39.97806452	,	43.01161644	,	22.87880109	,	32.34174603	,	30.21026239	,	31.00067606	,	53.97239203	,	74.88128319	,	39.66857143	,	41.8840274	,	42.1972103	,	52.89158607	,	96.03133333	,	31.68064516	,	27.65126984	,	70.38542936	,	62.18854305	,	30.85979592	,	49.47146341	,	28.41885246	,	108.0348024	,	67.99398417	,	76.55537415	,	72.52193878	,	42.12140436	,	55.78228571	,	50.94271676	,	34.77347926	,	71.32225275	,	73.2602551	,	85.9477551	,	58.48387755	,	72.25191489	,	46.21038961	,	41.26276888	,	43.79245014	,	59.64165025	,	48.37737931	,	63.53890173	,	36.15102981	,	61.27221024	,	32.8576824	,	44.07433962	,	35.08412451	,	43.8908867	,	35.095	,	62.54953846	,	35.10416667	,	95.48261097	,	74.35227273	,	37.51766423	,	40.81016173	,	74.45875	,	34.95591837	,	51.55282974	,	34.11452012	,	39.41479452	,	83.13738776	,	81.68562842	,	51.25040816	,	55.23298153	,	63.87100529	,	65.46022599	,	119.3089754	,	63.259	,	29.00257534	,	39.32428571	,	81.71039039	,	54.45285714	,	48.78702041	,	37.7788806	,	84.48697248	,	45.46629464	,	68.66390836	,	50.87527897	,	39.35133333	,	35.37459016	,	55.98360743	,	62.64182482	,	62.14271795	,	58.91494305	,	41.13382979	,	42.97	,	78.56388175	,	62.21861048	,	42.08447964	,	61.48065574	,	58.83569014	,	38.01058252	,	25.06	,	30.59	,	95.69901478	,	89.52073569	,	36.65105769	,	40.07	,	18.15777778	,	55.78877778	,	8.76	,	17.46	,	40.60959184	,	27.634	,	98.96333333	,	42.79412104	,	63.88306383	,	40	,	22.26	,	29.63	,	26.31	,	50.02927039	,	32.87	,	36.45309735	,	67.55978892	,	41.15466667	,	49.11452514	,	45.29884097	,	57.62791878	,	110.2262931	,	47.8549726	,	52.89063694	,	46.68824513	,	43.36095238	,	71.61784264	,	82.11962264	,	43.019081	,	56.29187179	,	45.82872774	,	90.74089888	,	57.39912863	,	47.86730458	,	33.12497041	,	68.83348315	,	55.86041916	,	66.28084592	,	60.13629893	,	74.62922652	,	85.24830645	,	49.58850829	,	50.82461538	,	48.21948529	,	91.79909297	,	51.34381963	,	85.10661721	,	61.09	,	41.53540816	,	74.38541547	,	73.50577007	,	43.34560364	,	76.11037736	,	66.76202658	,	62.66134948	,	80.10065089	,	67.38355972	,	45.90300448	,	45.61337838	,	38.57578616	,	71.93758242	,	74.63928571	,	82.73669834	,	50.99820253	,	44.63267532	,	62.91698113	,	66.15	,	84.67266667	,	88.97595694	,	56.40510086	,	60.81419355	,	41.22606061	,	80.87636364	,	81.06804348	,	157.0520823	,	53.45263636	,	65.08285714	,	55.37053571	,	88.7910453	,	73.65477366	,	61.47768254	,	80.73115385	,	63.52201072	,	64.77211864	,	68.18060274	,	65.21327103	,	60.86730769	,	52.29508242	,	50.56109244	,	54.81376694	,	90.97255639	,	69.06726027	,	49.39934021	,	62.6365748	,	70.61031746	,	56.43049887	,	51.13944056	,	50.42796721	,	75.40343826	,	65.46781931	,	67.46867347	,	46.76033708	,	51.95952247	,	59.67135338	,	71.29142857	,	68.03	,	80.00343558	,	51.4827933	,	68.36594828	,	40.94311005	,	99.11041353	,	60.35657426	,	41.5736105	,	58.38543956	,	94.430625	,	69.0486711	,	61.40816279	,	51.76510204	,	51.15785714	,	57.63278061	,	44.31566964	,	53.55721198	,	68.93	,	79.85325714	,	107.4177143	,	129.5627907	,	86.01811321	,	54.45572414	,	63.06814607	,	116.5237097	,	72.76506739	,	76.20611898	,	58.75940541	,	81.81495238	,	52.06241096	,	69.01350427	,	66.24880435	,	59.9535533	,	74.54784566	,	67.04556738	,	71.7961991	,	46.76785714	,	100.2788372	,	52.72099715	,	60.46747604	,	55.77366548	,	47.17456522	,	55.17806122	,	69.86287212	,	60.79869565	,	44.12067055	,	52.32540146	,	112.0065957	,	71.39692506	,	70.83076923	,	78.61315068	,	100.1105797	,	86.49886199	,	50.92274238	,	88.8698338	,	59.68579832	,	57.28556769	,	51.14273138	,	62.65021978	,	90.41237624	,	61.85	,	67.60098901	,	69.4169163	,	70.43171429	,	60.93972125	,	63.26935361	,	82.44096346	,	128.9867147	,	58.07537778	,	71.98584821	,	69.965209	,	47.64601824	,	94.79862745	,	61.95057692	,	57.80506494	,	60.88324561	,	82.20629428	,	95.79158683	,	66.0047138	,	79.50087912	,	53.86833333	,	77.74064516	,	65.65612245	,	59.06637168	,	76.07804408	,	51.83497143	,	64.50692494	,	62.18142857	,	72.68456464	,	71.975625	,	95.04613372	,	77.84623762	,	89.76683983	,	77.40792642])

# Print the estimated parameters
print(result.x)


a1 = np.arange(0.00, 4.02, 0.02)
a2 = np.arange(-5, 5.02, 0.02)
Rtable = np.zeros((len(a1), len(a2)))

#yd_exp = np.mean(y)

for i in range(len(a1)):
    for j in range(len(a2)):
        y_mod = result.x[0] / (1 + np.exp(-a1[i] * xorig - a2[j]))
        R = np.corrcoef(yorig, y_mod)
        Rtable[i,j] = R[0,1]**2

Rtable = np.nan_to_num(Rtable, nan=0)
Rmax = np.max(Rtable)
rows, cols = np.where(Rtable == Rmax)
print(a1[rows])
print(a2[cols])
xorigf=np.sort(xorig, axis=0)
ybest= result.x[0] / (1 + np.exp(-a1[rows] * xorigf - a2[cols]))


import matplotlib.pyplot as plt

plt.plot(xorig, yorig, 'o')
plt.plot(xorigf, ybest)

plt.show()