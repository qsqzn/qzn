function [SceName, satCons, senCons, satChain, startTime, endTime, pStep, ship1, sat_list]=cons

%常数

SceName = 'AllSats';
satCons = 'satCons';
senCons = 'senCons';
satChain = 'satChain';
startTime = '2 May 2017 07:00:00.000';
endTime = '3 May 2017 08:00:00.000';
pStep = 600;
ship1 = 'US_Ship_1';

optAng = 30;
optElec = 30;

sat_list = {
% 29092	'YAOGAN_1'              0          optAng 
% 31490	'YAOGAN_2'              0          optAng 
% 32289	'YAOGAN_3'              0          optAng 
% 33446	'YAOGAN_4'              0          optAng 
34839	'YAOGAN_6'              0          optAng 
36110	'YAOGAN_7'              0          optAng 
36121	'YAOGAN_8'              0          optAng 
36413	'YAOGAN_9A'             1          optElec       
% 36414	'YAOGAN_9B'             1          optElec       
% 36415	'YAOGAN_9C'             1          optElec       
36834	'YAOGAN_10'             0          optAng 
37165	'YAOGAN_11'             0          optAng 
37875	'YAOGAN_12'             0          optAng 
37941	'YAOGAN_13'             0          optAng 
38257	'YAOGAN_14'             0          optAng 
38354	'YAOGAN_15'             0          optAng 
39011	'YAOGAN_16A'            1          optElec       
% 39012	'YAOGAN_16B'            1          optElec 
% 39013	'YAOGAN_16C'            1          optElec 
39239	'YAOGAN_17A'            1          optElec 
% 39240	'YAOGAN_17B'            1          optElec
% 39241	'YAOGAN_17C'            1          optElec 
39363	'YAOGAN_18'             0          optAng 
39410	'YAOGAN_19'             0          optAng 
40109	'YAOGAN_20A'            1          optElec 
% 40110	'YAOGAN_20B'            1          optElec 
% 40111	'YAOGAN_20C'            1          optElec
40143	'YAOGAN_21'             0          optAng
40275	'YAOGAN_22'             0          optAng 
40305	'YAOGAN_23'             0          optAng 
40310	'YAOGAN_24'             0          optAng 
40338	'YAOGAN_25A'            1          optElec 
% 40339	'YAOGAN_25B'            1          optElec 
% 40340	'YAOGAN_25C'            1          optElec 
40362	'YAOGAN_26'             0          optAng
40878	'YAOGAN_27'             0          optAng
41026	'YAOGAN_28'             0          optAng
41038	'YAOGAN_29'             0          optAng 
41473	'YAOGAN_30'             0          optAng
42945	'YAOGAN_30A'           1          optElec
% 42946	'YAOGAN_30B'           1          optElec
% 42947	'YAOGAN_30C'           1          optElec
41907   'SUPERVIEW_1_01'        0          optAng
41908   'SUPERVIEW_1_02'        0          optAng
40961   'JILIN_1'               0          optAng
41914   'JILIN_1_03'            0          optAng
39150	'GAOFEN_1'              0          optAng
40118	'GAOFEN_2'              0          optAng
41727	'GAOFEN_3'              0          optAng
41194	'GAOFEN_4'              0          0.25          %方位角41度，高度角81.9，可以监视乌山基地
40701	'GAOFEN_8'              0          optAng
40894	'GAOFEN_9'              0          optAng
42761	'ZHUHAI_1_01'           0          optAng
42759	'ZHUHAI_1_02'           0          optAng
% 40959	'LINGQIAO_VIDEO_A'      0          optAng
% 40960	'LINGQIAO_VIDEO_B'      0          optAng
% 28413	'SJ-6A'                 0          optAng
% 28414	'SJ-6B'                 0          optAng
% 29505	'SJ-6C'                 0          optAng
% 29506	'SJ-6D'                 0          optAng
% 33408	'SJ-6E'                 0          optAng
% 33409	'SJ-6F'                 0          optAng
% 37179	'SJ-6G'                 0          optAng
% 37180	'SJ-6H'                 0          optAng
% 28737	'SJ-7'                  0          optAng
% 38860	'SJ-9A'                 0          optAng
% 38861	'SJ-9B'                 0          optAng
% 36088	'SJ-11-01'              0          optAng
% 37765	'SJ-11-02'              0          optAng
% 37730	'SJ-11-03'              0          optAng
% 39202	'SJ-11-05'              0          optAng
% 39624	'SJ-11-06'              0          optAng
% 40261	'SJ-11-07'              0          optAng
% 40286	'SJ-11-08'              0          optAng
% 36596	'SJ-12'                 0          optAng
% 39358	'SJ-16'                 0          optAng
% 41634	'SJ_16-02'              0          optAng
};