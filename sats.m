function sats()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2018.9.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format long;
userpath(pwd);
curPath = pwd;

%

%设置常数
[SceName, satCons, senCons, satChain, startTime, endTime, pStep, ship1, sat_list]=cons;

% facName = 'Osan';

% 
% Coord = 'TrueOfDate';   %J2000?
% PropType = 'TwoBody';

stkInit
conid = stkOpen(stkDefaultHost)

if(stkValidScen==1)
    stkUnload('/*')
end;

stkNewObj('/', 'Scenario', SceName);
stkNewObj('*/', 'Chain', satChain);

stkSetTimePeriod(startTime, endTime, 'GREGUTC');

stkSetEpoch(startTime,  'GREGUTC');
st = sprintf('SetValues "%s" %d 0.1', startTime, pStep);
stkConnect(conid, 'Animate', '*/', st);
stkConnect(conid, 'Animate', '*/', 'Reset');
stkSyncEpoch;

%从两行轨道根数导入卫星数据
ssc = '';
for i =1:length(sat_list)
    ssc = sprintf('%s SSCNumber %d', ssc,  sat_list{i, 1});
end;
impt = sprintf( 'ImportTLEFile * "%s\\3le.txt"  %s  Autopropagate  On Constellation  %s', curPath, ssc ,satCons);
stkExec(conid, impt);

%增加传感器
stkNewObj('*/', 'Constellation', senCons);

for i=1:length(sat_list)
    %更改卫星名称
    rstr = sprintf('Rename */Satellite/tle-%d %s', sat_list{i, 1}, sat_list{i, 2}); 
    stkExec(conid, rstr); 

    %增加传感器
    satPathName = sprintf('*/Satellite/%s', sat_list{i, 2});
    senPathName = sprintf('%s/Sensor/sen_%s', satPathName, sat_list{i, 2});
    senName  = sprintf('sen_%s', sat_list{i, 2});
    stkNewObj(satPathName, 'Sensor', senName);
    sCone = sprintf('SimpleCone %d  AngularRes 1.0',  sat_list{i, 4});
    stkConnect(conid, 'Define', senPathName, sCone);
    
    astr = sprintf('Chains */Constellation/%s Add %s', senCons, senPathName);
    stkExec(conid, astr);
    
%     stkConnect(conid, 'VO', senName{1}, 'Projection Intersection Earth');
%     Projection = 'Projection Intersections None';
%     stkConnect(conid, 'Graphics', senName{1}, Projection);
end;

%把星座加入chain
satch = sprintf('Chains  */Chain/%s Add Constellation/%s', satChain, satCons);
stkExec(conid, satch);
stkExec(conid, satch);

%增加一艘船
stkNewObj('*/', 'Ship', 'US_Ship_1');
ship = sprintf('*/Ship/%s', ship1);
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 34.043            135.983        -0.000000          50');%2 May 2017 07:00:00.000
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 31.702            133.219         0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 28.298            130.880        -0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 24.468            128.541        -0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 21.915            126.840         0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 18.936            125.777        -0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 14.894            124.288         0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 12.340            123.012        -0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 10.426            121.737         0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 8.936            119.823        -0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 7.021            116.846        -0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 6.809            113.444         0.000000          50');
stkConnect(conid, 'AddWaypoint', ship, 'DetTimeAccFromVel 9.787            112.168        -0.000000          50');  %3 May 2017 07:28:23.707 

tic
for i = 1:50
    t_start = (i-1)*pStep;
    t_stop = t_start+pStep;
    i
    for n=1:size(sat_list, 1)
        %递推星历
        oneSatProp( sat_list{n, 2}, t_start, t_stop, pStep);        
    end
    
    st = sprintf('Cov */Ship/%s Asset */Constellation/%s  Assign', ship1, senCons);
    stkExec(conid, st);
    
    st = sprintf('Cov_RM */Ship/%s Access Compute "Coverage"', ship1);
    res = stkExec(conid, st);
    
    if(strcmp(res, 'No access was found.')==0)
        %发现目标
        'Ship found'
        res
        %解析信息，那个卫星发现的目标，有可能有多条信息
        
        st = sprintf('Scenario/AllSats/Ship/%s', ship1);
        [rShip1, vShip1] = stkPosVelCBF(st, t_stop);
        rShip1(:, end)
        %更新信息，发现目标的卫星，更新其单星热力图
        
    end

    
    
    %信息传播
    'Data Share:'
    %获得当前通信拓扑，结果为二维矩阵
    res = stkExec(conid, 'Chains_R */Chain/satChain Strands');
    
    tmpComm = commProc(res);
    
    %在这里进行信息融合，将最新的单星热力图更新到所有其他卫星
    
    
    
        
end
toc

stkClose(conid);



