% This is the script for the implementation of the Walfisch - Ikegami Path loss model

%d=1; %km: [0.02,5]
%fc=900; %MHz: [800,2000]
%hBS=30; %m: [4,50]
%hMS=2; %m: [1,3]
%hroof = 25;
%ang = 40;   %(0 - 90 degrees)
town=0; % (0: small city ,  1: large city)
%b = 15;
w = 4;

%if ((fc>=800 && fc<=2000) && (hBS>=4 && hBS<=50) && (1<=hMS && hMS<=3) && (0.02<=d && d<= 5)&& (ang >= 0 && ang <= 90))       
    d = 1;
    d1 = 0.02;
    d2 = 2.87;
    d3 = 5;   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    fc=1000; %MHz: [800,2000]
    fc1=800;
    fc2=2000;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hBS=50; % m : [4,50]
    hBS1=4;  
    hBS2 = 20;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hMS=2; %m: [1,3]
    hMS1=3;
    hMS2=1; 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hroof = 2;
    hroof1 = 10;
    hroof2 = 30;
    hroof3 = 50;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ang1 = 0;   % [0,90]
    ang2 = 45;
    ang3 = 90;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    flag=1; % (0,1)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    b1 = 2;
    b2 = 4;
    b = 8;
    b3 = 16;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    w1 = 2;
    w = 6;
    w2 = 10;
    w3 = 14;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Variable: Distance
    X=0.02:0.001:5; %distance in kilometers 
    %------------------------%
    YU=zeros(1,length(X));
    YSU=zeros(1,length(X));
    %------------------------%
    YRU=zeros(1,length(X));
    YU1=zeros(1,length(X));
    YU2=zeros(1,length(X));
    %------------------------%
    YUh1=zeros(1,length(X));
    YUh2=zeros(1,length(X));
    YUh3=zeros(1,length(X));
    %------------------------%
    YUr0=zeros(1,length(X));
    YUr1=zeros(1,length(X));
    YUr2=zeros(1,length(X));
    YUr3=zeros(1,length(X));
    %-------------------------%
    YUa1=zeros(1,length(X));
    YUa2=zeros(1,length(X));
    YUa3=zeros(1,length(X));
    %-------------------------%
    YUb0=zeros(1,length(X));
    YUb1=zeros(1,length(X));
    YUb2=zeros(1,length(X));
    YUb3=zeros(1,length(X));
    %--------------------------%
    YUw0=zeros(1,length(X));
    YUw1=zeros(1,length(X));
    YUw2=zeros(1,length(X));
    YUw3=zeros(1,length(X));   
    %--------------------------%
    for i=1:length(X)
        % The type of city
        [x ,YU(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,0);     % small city
        [x ,YSU(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,1);    % large city
        
        % The frequency
        [x ,YRU(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,0);  %medium frequency    
        [x ,YU1(1,i)]=walfkeg(fc1,X(i),hBS2,hMS,hroof2,b,w,ang2,0); %low end frequnecy 
        [x ,YU2(1,i)]=walfkeg(fc2,X(i),hBS2,hMS,hroof2,b,w,ang2,0); %high end frequency
        
        % The height of the base and mobile stations
        [x ,YUh1(1,i)]=walfkeg(fc,X(i),hBS1,hMS1,hroof2,b,w,ang2,0);% mobile station similar height with the base station
        [x ,YUh2(1,i)]=walfkeg(fc,X(i),hBS2,hMS1,hroof2,b,w,ang2,0);% mobile station lower in height than the base station(middle case)
        [x ,YUh3(1,i)]=walfkeg(fc,X(i),hBS,hMS1,hroof2,b,w,ang2,0); % mobile station way lower in height than the base station
    
        % The height of the roof of buildings
        [x ,YUr0(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof,b,w,ang2,0);       % very low roof height (2 m)
        [x ,YUr1(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof1,b,w,ang2,0);       % low roof height (10 m)
        [x ,YUr2(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,0);      % middle roof height (30 m)
        [x ,YUr3(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof3,b,w,ang2,0);       % higher roof height (50 m)
        
        % The angle the signal incident
        [x ,YUa1(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang1,0);   % The first case of Lori (0 < ? < 35)
        [x ,YUa2(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,0);   % The second case for Lori (35 < ? < 55)
        [x ,YUa3(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang3,0);   % The third case of Lori (55 < ? < 90)
        
        % The distance of the buildings
        [x ,YUb0(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b1,w,ang2,0);       % b = 2
        [x ,YUb1(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b2,w,ang2,0);       % b = 4
        [x ,YUb2(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,0);        % b = 8
        [x ,YUb3(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b3,w,ang2,0);       % b = 16
        
        %The width of the streets
        [x ,YUw0(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w1,ang2,0);       %w = 2
        [x ,YUw1(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w,ang2,0);        % w = 6
        [x ,YUw2(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w2,ang2,0);       % w = 10
        [x ,YUw3(1,i)]=walfkeg(fc,X(i),hBS2,hMS,hroof2,b,w3,ang2,0);       % w = 14
        
        
        
    end
        figure(1);
        %plot(X,YU, X,YSU, X,YRU, X,YU1, X,YU2, X,YUh1,X,YUh2, X,YUh3, X,YUr1, X,YUr3, X,YUa1, X,YUa2, X,YUa3);
        %title('Variable: Distance');
        %legend('Small City','Large City', 'fc = 1000 Hz', 'fc = 800 Hz', 'fc = 2000 Hz','HBs ~ HMs','HBs > HMs','HBs >> HMs', 'Hroof = 10','Hroof = 50','Angle = 0',' 35 < Angle < 55','55 < Angle < 90');
        xlabel('Distance(km)');
        title('Loss(db) - Distance, b = 8, w = 6 ')
        grid on;
        plot(X,YU, X,YSU);legend('Small City','Large City');       
        
        figure(2);
        xlabel('Distance(km)');
        title('Loss(db) - Distance, b = 8, w = 6 ')
        grid on;
        plot(X,YRU, X,YU1, X,YU2);legend('fc = 1000 Hz', 'fc = 800 Hz', 'fc = 2000 Hz');

        figure(3);
        xlabel('Distance(km)');
        title('Loss(db) - Distance, b = 8, w = 6 ')
        grid on;
        plot(X,YUh1,X,YUh2, X,YUh3);legend('HBs ~ HMs','HBs > HMs','HBs >> HMs');
        
        figure(4);
        xlabel('Distance(km)');
        title('Loss(db) - Distance, b =8, w = 6 ')
        grid on;
        plot(X,YUr0, X,YUr1, X,YUr2, X,YUr3);legend('Hroof = 2','Hroof = 10','Hroof = 30','Hroof = 50');
        
        figure(5);
        xlabel('Distance(km)');
        title('Loss(db) - Distance, b = 8, w = 6 ')
        grid on;
        plot(X,YUa1, X,YUa2, X,YUa3);legend('Angle = 0',' 35 < Angle < 55','55 < Angle < 90');
        
        figure(6);
        xlabel('Distance(km)');
        title('Loss(db) - Distance, w = 6')
        grid on;
        plot(X,YUb0, X,YUb1, X,YUb2, X,YUb3);legend('b = 2',' b = 4','b = 8','b = 16');
        
        figure(7);
        xlabel('Distance(km)');
        title('Loss(db) - Distance, b = 8')
        grid on;
        plot(X,YUw0,X,YUw1, X,YUw2, X,YUw3);legend('w = 2','w = 6','w = 10','w = 14');
        
        
    %Variable: Frequency
    fX=800:50:2000; %frequency MHz
    fYU=zeros(1,length(fX));
    fYSU=zeros(1,length(fX));
    %--------------------------%
    fYUd1=zeros(1,length(fX));
    fYUd2=zeros(1,length(fX));
    fYUd3=zeros(1,length(fX));
    %--------------------------%
    fYUh1=zeros(1,length(fX));
    fYUh2=zeros(1,length(fX));
    fYUh3=zeros(1,length(fX));
    %--------------------------%
    fYUr0=zeros(1,length(fX));
    fYUr1=zeros(1,length(fX));
    fYUr2=zeros(1,length(fX));
    fYUr3=zeros(1,length(fX));
    %--------------------------%
    fYUa1=zeros(1,length(fX));
    fYUa2=zeros(1,length(fX));
    fYUa3=zeros(1,length(fX));
    %--------------------------%
    fYUb0=zeros(1,length(fX));
    fYUb1=zeros(1,length(fX));
    fYUb2=zeros(1,length(fX));
    fYUb3=zeros(1,length(fX));
    %--------------------------%
    fYUw0=zeros(1,length(fX));
    fYUw1=zeros(1,length(fX));
    fYUw2=zeros(1,length(fX));
    fYUw3=zeros(1,length(fX));
    %--------------------------%
    
    for i=1:length(fX)
        % The type of the city
        [x ,fYU(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang2,0);    % Small City
        [x ,fYSU(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang2,1);   % Large City
        %[x fYRU(1,i)]=walfkeg(d4,fX(i),hBS,hMS,1);   
        
        % The distance
        [x ,fYUd1(1,i)]=walfkeg(fX(i),d1,hBS2,hMS1,hroof2,b,w,ang2,0); %lower end distance (0.02 km)
        [x ,fYUd2(1,i)]=walfkeg(fX(i),d2,hBS2,hMS1,hroof2,b,w,ang2,0); % middle distance (2.87 km)
        [x ,fYUd3(1,i)]=walfkeg(fX(i),d3,hBS2,hMS1,hroof2,b,w,ang2,0); % higher end distance(5 km)
             
        % The height of the base and mobile stations
        [x ,fYUh1(1,i)]=walfkeg(fX(i),d,hBS1,hMS1,hroof2,b,w,ang2,0);   % mobile station similar height with the base station
        [x ,fYUh2(1,i)]=walfkeg(fX(i),d,hBS2,hMS1,hroof2,b,w,ang2,0);   % mobile station lower in height than the base station(middle case)
        [x ,fYUh3(1,i)]=walfkeg(fX(i),d,hBS,hMS1,hroof2,b,w,ang2,0);    % mobile station waayy lower in height than the base station
        
        % The height of the roof of buildings
        [x ,fYUr0(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof,b,w,ang2,0);     % very low roof height (2)
        [x ,fYUr1(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof1,b,w,ang2,0);    % low roof height (10)
        [x ,fYUr2(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang2,0);    % middle roof height (30)
        [x ,fYUr3(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof3,b,w,ang2,0);    % high roof height (50)
        
        % The angle the signal incident
        [x ,fYUa1(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang1,0);   % The first case of Lori (0 < ? < 35)
        [x ,fYUa2(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang2,0);   % The second case for Lori (35 < ? < 55)
        [x ,fYUa3(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang3,0);   % The third case of Lori (55 < ? < 90)
            
         % b 
        [x ,fYUb0(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b1,w,ang2,0);       % b = 2
        [x ,fYUb1(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b2,w,ang2,0);       % b = 4
        [x ,fYUb2(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang2,0);        % b = 8
        [x ,fYUb3(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b3,w,ang2,0);       % b = 16
        
        % The distance of the buildings
        [x ,fYUw0(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w1,ang2,0);       % w = 2
        [x ,fYUw1(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w,ang2,0);        % w = 6
        [x ,fYUw2(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w2,ang2,0);       % w = 10
        [x ,fYUw3(1,i)]=walfkeg(fX(i),d,hBS2,hMS,hroof2,b,w3,ang2,0);       % w = 14
        
    end
    
              
        figure(8);
        xlabel('frequency(MHz)');
        title('Loss(db) - frequency, b = 15, w = 4 ')
        grid on;
        plot(fX,fYU, fX,fYSU);legend('Small City','Large City');       
        
        figure(9);
        xlabel('frequency(MHz)');
        title('Loss(db) - frequency, b = 15, w = 4 ')
        grid on;
        plot(fX,fYUd1, fX,fYUd2, fX,fYUd3);legend('d =0.02 km', 'd =2.87 km','d = 5 km');

        figure(10);
        xlabel('MHz');
        title('Loss(db) - frequency, b = 15, w = 4 ')
        grid on;
        plot(fX,fYUh1,fX,fYUh2 ,fX,fYUh3);legend('HBs ~ HMs','HBs > HMs','HBs >> HMs');
        
        figure(11);
        xlabel('MHz');
        title('Loss(db) - frequency, b = 15, w = 4 ')
        grid on;
        plot(fX,fYUr0,fX,fYUr1,fX,fYUr2,fX,fYUr3);legend('Hroof = 2','Hroof = 10','Hroof = 30','Hroof = 50');
        
        figure(12);
        xlabel('MHz');
        title('Loss(db) - frequency, b = 15, w = 4 ')
        grid on;
        plot(fX,fYUa1, fX,fYUa2, fX,fYUa3);legend('Angle = 0',' 35 < Angle < 55','55 < Angle < 90');
       
        figure(13);
        xlabel('frequency(MHz)');
        title('Loss(db) - frequency, w = 6')
        grid on;
        plot(fX,fYUb0, fX,fYUb1, fX,fYUb2, fX,fYUb3);legend('b = 2',' b = 4','b = 8','b = 16');
        
        figure(14);
        xlabel('frequency(MHz)');
        title('Loss(db) - frequency, b = 8')
        grid on;
        plot(fX,fYUw0,fX,fYUw1, fX,fYUw2, fX,fYUw3);legend('w = 2','w = 6','w = 10','w = 14');
        
   %Variable: Height of the Base station
    
    HbX=4:1:50; % meters
    HbYU=zeros(1,length(HbX));
    HbYSU=zeros(1,length(HbX));
    %----------------------------%
    HbYUd1=zeros(1,length(HbX));
    HbYUd2=zeros(1,length(HbX));
    HbYUd3=zeros(1,length(HbX));
    %----------------------------%
    HbYUf1=zeros(1,length(HbX));
    HbYUf2=zeros(1,length(HbX));
    HbYUf3=zeros(1,length(HbX));
    %----------------------------%
    HbYUhm1=zeros(1,length(HbX));
    HbYUhm2=zeros(1,length(HbX));
    HbYUhm3=zeros(1,length(HbX));
    %----------------------------%
    HbYUr0=zeros(1,length(HbX));
    HbYUr1=zeros(1,length(HbX));
    HbYUr2=zeros(1,length(HbX));
    HbYUr3=zeros(1,length(HbX));
    %----------------------------%
    HbYUa1=zeros(1,length(HbX));
    HbYUa2=zeros(1,length(HbX));
    HbYUa3=zeros(1,length(HbX));
    %---------------------------%
    HbYUb0=zeros(1,length(HbX));
    HbYUb1=zeros(1,length(HbX));
    HbYUb2=zeros(1,length(HbX));
    HbYUb3=zeros(1,length(HbX));
    %---------------------------%
    HbYUw0=zeros(1,length(HbX));
    HbYUw1=zeros(1,length(HbX));
    HbYUw2=zeros(1,length(HbX));
    HbYUw3=zeros(1,length(HbX));
    %---------------------------%
    
    for i=1:length(HbX)
        % The type of the city
        [x ,HbYU(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);    % Small City
        [x ,HbYSU(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,1);   % Large City
         
        
        % The distance
        [x ,HbYUd1(1,i)]=walfkeg(fc,d1,HbX(i),hMS,hroof2,b,w,ang2,0);  % lower end distance (0.02 km)
        [x ,HbYUd2(1,i)]=walfkeg(fc,d2,HbX(i),hMS,hroof2,b,w,ang2,0); % middle distance (2.87 km)
        [x ,HbYUd3(1,i)]=walfkeg(fc,d3,HbX(i),hMS,hroof2,b,w,ang2,0); % higher end distance(5 km)
        
        % The frequency
        [x ,HbYUf1(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);  %medium frequency    
        [x ,HbYUf2(1,i)]=walfkeg(fc1,d,HbX(i),hMS,hroof2,b,w,ang2,0); %low end frequnecy 
        [x ,HbYUf3(1,i)]=walfkeg(fc2,d,HbX(i),hMS,hroof2,b,w,ang2,0); %high end frequency
        
         % The height of the mobile stations
        [x ,HbYUhm1(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);
        [x ,HbYUhm2(1,i)]=walfkeg(fc,d,HbX(i),hMS1,hroof2,b,w,ang2,0);
        [x ,HbYUhm3(1,i)]=walfkeg(fc,d,HbX(i),hMS2,hroof2,b,w,ang2,0);    
              
        % The height of the roof of buildings
        [x ,HbYUr0(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof,b,w,ang2,0);     % very low roof height(2)
        [x ,HbYUr1(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof1,b,w,ang2,0);    % low roof height (10)
        [x ,HbYUr2(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);    % middle roof height (30)
        [x ,HbYUr3(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof3,b,w,ang2,0);    % higher roof height (50)
        
        % The angle the signal incident
        [x ,HbYUa1(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang1,0);   % The first case of Lori (0 < ? < 35)
        [x ,HbYUa2(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);   % The second case for Lori (35 < ? < 55)
        [x ,HbYUa3(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang3,0);   % The third case of Lori (55 < ? < 90)
        
        
        % b
        [x ,HbYUb0(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b1,w,ang2,0);     
        [x ,HbYUb1(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b2,w,ang2,0);    
        [x ,HbYUb2(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);    
        [x ,HbYUb3(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b3,w,ang2,0);    
        
        % The distance of the buildings
        [x ,HbYUw0(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w1,ang2,0);     
        [x ,HbYUw1(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w,ang2,0);    
        [x ,HbYUw2(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w2,ang2,0);    
        [x ,HbYUw3(1,i)]=walfkeg(fc,d,HbX(i),hMS,hroof2,b,w3,ang2,0);   
        
        
    end
    
        figure(15);
        title('Loss(dB) - Base Station Height');    
        xlabel('Base Station Height (m)');
        grid on;
        plot(HbX,HbYU,HbX,HbYSU);legend('Small City','Large City');
        
        figure(16);      
        title('Loss(dB) - Base Station Height');
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUd1, HbX,HbYUd2, HbX,HbYUd3);legend('d =0.02 km', 'd =2.87 km', 'd = 5 km');
        
        figure(17);   
        title('Loss(dB) - Base Station Height');     
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUf1, HbX,HbYUf2, HbX,HbYUf3);legend('fc = 1000 MHz','fc = 800 MHz','fc = 2000 MHz');
        
        figure(18);        
        title('Loss(dB) - Base Station Height');      
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUhm3,HbX,HbYUhm1,HbX,HbYUhm2);legend('HMs = 1 m','HMs = 2 m','HMs = 3 m');
        
        figure(19);        
        title('Loss(dB) - Base Station Height');     
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUr0, HbX,HbYUr1, HbX,HbYUr2, HbX,HbYUr3);legend('Hroof = 2','Hroof = 10','Hroof = 30','Hroof = 50');
                       
        figure(20);      
        title('Loss(dB)-Base Station Height');
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUa1, HbX,HbYUa2, HbX,HbYUa3);legend('Angle = 0',' 35 < Angle < 55','55 < Angle < 90')
        
        figure(21);    
        title('Loss(db)-Base Station Height, w = 6');      
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUb0, HbX,HbYUb1, HbX,HbYUb2, HbX,HbYUb3);legend('b = 2',' b = 4','b = 8','b = 16');
        
        figure(22);      
        title('Loss(db)-Base Station Height, b = 8');
        xlabel('Base Station Height(m)');
        grid on;
        plot(HbX,HbYUw0,HbX,HbYUw1,HbX,HbYUw2,HbX,HbYUw3);legend('w = 2','w = 6','w = 10','w = 14');
        
   
    %Variable: Height of the Mobile Station
    
    HmX=1:0.4:3; % metres
    %----------------------------%
    HmYU=zeros(1,length(HmX));
    HmYSU=zeros(1,length(HmX));
    %----------------------------%
    HmYUd1=zeros(1,length(HmX));
    HmYUd2=zeros(1,length(HmX));
    HmYUd3=zeros(1,length(HmX));
    %----------------------------%
    HmYUHbs1=zeros(1,length(HmX));
    HmYUHbs2=zeros(1,length(HmX));
    HmYUHbs3=zeros(1,length(HmX));
    %-----------------------------%
    HmYUf1=zeros(1,length(HmX));
    HmYUf2=zeros(1,length(HmX));
    HmYUf3=zeros(1,length(HmX));
    %-----------------------------%
    HmYUr0=zeros(1,length(HmX));
    HmYUr1=zeros(1,length(HmX));
    HmYUr2=zeros(1,length(HmX));
    HmYUr3=zeros(1,length(HmX));
    %-----------------------------%
    HmYUa1=zeros(1,length(HmX));
    HmYUa2=zeros(1,length(HmX));
    HmYUa3=zeros(1,length(HmX));
    %-----------------------------%
    HmYUb0=zeros(1,length(HmX));
    HmYUb1=zeros(1,length(HmX));
    HmYUb2=zeros(1,length(HmX));
    HmYUb3=zeros(1,length(HmX));
    %-----------------------------%
    HmYUw0=zeros(1,length(HmX));
    HmYUw1=zeros(1,length(HmX));
    HmYUw2=zeros(1,length(HmX));
    HmYUw3=zeros(1,length(HmX));
    
    %-----------------------------%
    for i=1:length(HmX)
        % The type of the city
        [x ,HmYU(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);    % Small City
        [x ,HmYSU(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,1);   % Large City
            
        % The distance
        [x ,HmYUd1(1,i)]=walfkeg(fc,d1,hBS2,HmX(i),hroof2,b,w,ang2,0); %lower end distance (0.02 km)
        [x ,HmYUd2(1,i)]=walfkeg(fc,d2,hBS2,HmX(i),hroof2,b,w,ang2,0); % middle distance (2.87 km)
        [x ,HmYUd3(1,i)]=walfkeg(fc,d3,hBS2,HmX(i),hroof2,b,w,ang2,0); % higher end distance(5 km)
        
        % The frequency
        [x ,HmYUf1(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);  %medium frequency    
        [x ,HmYUf2(1,i)]=walfkeg(fc1,d,hBS2,HmX(i),hroof2,b,w,ang2,0); %low end frequnecy 
        [x ,HmYUf3(1,i)]=walfkeg(fc2,d,hBS2,HmX(i),hroof2,b,w,ang2,0); %high end frequency
        
        % The height of the base station
        [x ,HmYUHbs1(1,i)]=walfkeg(fc,d,hBS1,HmX(i),hroof2,b,w,ang2,0);   % mobile station similar height with the base station
        [x ,HmYUHbs2(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);   % mobile station lower in height than the base station(middle case)
        [x ,HmYUHbs3(1,i)]=walfkeg(fc,d,hBS,HmX(i),hroof2,b,w,ang2,0);    % mobile station waayy lower in height than the base station     
        
        % The height of the roof of buildings
        [x ,HmYUr0(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof,b,w,ang2,0);    % very low height (2 m)
        [x ,HmYUr1(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof1,b,w,ang2,0);    % low roof height (10 m)
        [x ,HmYUr2(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);    % middle roof height (30 m)
        [x ,HmYUr3(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof3,b,w,ang2,0);    % higher roof height (50 m)
        
        % The angle the signal incident
        [x ,HmYUa1(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang1,0);   % The first case of Lori (0 < ? < 35)
        [x ,HmYUa2(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);   % The second case for Lori (35 < ? < 55)
        [x ,HmYUa3(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang3,0);   % The third case of Lori (55 < ? < 90)
        
        
        % b
        [x ,HmYUb0(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b1,w,ang2,0);    
        [x ,HmYUb1(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b2,w,ang2,0);    
        [x ,HmYUb2(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);    
        [x ,HmYUb3(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b3,w,ang2,0);   
        
        % The distance of the buildings
        [x ,HmYUw0(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w1,ang2,0);    
        [x ,HmYUw1(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w,ang2,0);    
        [x ,HmYUw2(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w2,ang2,0);    
        [x ,HmYUw3(1,i)]=walfkeg(fc,d,hBS2,HmX(i),hroof2,b,w3,ang2,0);    
        
        
    end
    
        figure(23);        
        title('Loss(dB)-Mobile Station Height');
        xlabel('Mobile Station(m)');
        grid on;    
        plot(HmX,HmYU,HmX,HmYSU); legend('Small City','Large City');
        
        figure(24);        
        title('Loss(dB) - Mobile Station Height');
        xlabel('Mobile Station(m)');
        grid on;    
        plot(HmX,HmYUd1, HmX,HmYUd2, HmX,HmYUd3); legend('d =0.02 km', 'd =2.87 km', 'd = 5 km');
        
        figure(25);      
        title('Loss(dB)-Mobile Station Height');
        xlabel('Mobile Station Height(m)');
        grid on;
        plot(HmX,HmYUf2, HmX,HmYUf1, HmX,HmYUf3); legend('fc = 800 MHz','fc = 1000 MHz','fc = 2000 MHz');
        
        figure(26);       
        title('Loss(dB)-Mobile Station Height');
        xlabel('Mobile Station Height(m)');
        grid on;
        plot(HmX,HmYUHbs1, HmX,HmYUHbs2, HmX,HmYUHbs3);legend('Hbs = 4 m','Hbs = 20 m','Hbs = 50 m');
         
        figure(27);        
        title('Loss(dB) - Mobile Station Height');
        xlabel('Mobile Station Height(m)');
        grid on;
        plot(HmX,HmYUr0, HmX,HmYUr1, HmX,HmYUr2, HmX,HmYUr3);legend('Hroof = 2','Hroof = 10','Hroof = 30','Hroof = 50');
        
        figure(28);        
        title('Loss(dB) - Mobile Station Height');
        xlabel('Mobile Station Height(m)');
        grid on;
        plot(HmX,HmYUa1, HmX,HmYUa2, HmX,HmYUa3); legend('Angle = 0',' 35 < Angle < 55','55 < Angle < 90');
              
        figure(29);        
        title('Loss(dB) - Mobile Station Height');
        xlabel('Mobile Station Height(m)');
        grid on;
        plot(HmX,HmYUb0, HmX,HmYUb1, HmX,HmYUb2, HmX,HmYUb3); legend('b = 2',' b = 4','b = 8','b = 16');
               
        figure(30);        
        title('Loss(dB) - Mobile Station Height');
        xlabel('Mobile Station Height(m)');
        grid on;
        plot(HmX,HmYUw0, HmX,HmYUw1, HmX,HmYUw2, HmX,HmYUw3); legend('w = 2','w = 6','w = 10','w = 14');
        
    %Variable: Angle of the signal incident
    
    AX=0:90; % metres
    %----------------------------%
    AYU=zeros(1,length(AX));
    AYSU=zeros(1,length(AX));
    %----------------------------%
    AYUd1=zeros(1,length(AX));
    AYUd2=zeros(1,length(AX));
    AYUd3=zeros(1,length(AX));
    %----------------------------%
    AYUh1=zeros(1,length(AX));
    AYUh2=zeros(1,length(AX));
    AYUh3=zeros(1,length(AX));
    %-----------------------------%
    AYUf1=zeros(1,length(AX));
    AYUf2=zeros(1,length(AX));
    AYUf3=zeros(1,length(AX));
    %-----------------------------%
    AYUr0=zeros(1,length(AX));
    AYUr1=zeros(1,length(AX));
    AYUr2=zeros(1,length(AX));
    AYUr3=zeros(1,length(AX));
    %-----------------------------%
    AYUb0=zeros(1,length(AX));
    AYUb1=zeros(1,length(AX));
    AYUb2=zeros(1,length(AX));
    AYUb3=zeros(1,length(AX));
    %-----------------------------%
    AYUw0=zeros(1,length(AX));
    AYUw1=zeros(1,length(AX));
    AYUw2=zeros(1,length(AX));
    AYUw3=zeros(1,length(AX));  
    %-----------------------------%
    
    for i=1:length(AX)
        % The type of the city
        [x ,AYU(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),0);    % Small City
        [x ,AYSU(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),1);   % Large City
            
        % The distance
        [x ,AYUd1(1,i)]=walfkeg(fc,d1,hBS2,hMS,hroof2,b,w,AX(i),0); %lower end distance (0.02 km)
        [x ,AYUd2(1,i)]=walfkeg(fc,d2,hBS2,hMS,hroof2,b,w,AX(i),0); % middle distance (2.87 km)
        [x ,AYUd3(1,i)]=walfkeg(fc,d3,hBS2,hMS,hroof2,b,w,AX(i),0); % higher end distance(5 km)
        
        % The frequency
        [x ,AYUf1(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),0);  %medium frequency    
        [x ,AYUf2(1,i)]=walfkeg(fc1,d,hBS2,hMS,hroof2,b,w,AX(i),0); %low end frequnecy 
        [x ,AYUf3(1,i)]=walfkeg(fc2,d,hBS2,hMS,hroof2,b,w,AX(i),0); %high end frequency
        
        % The height of the base and mobile stations
        [x ,AYUh1(1,i)]=walfkeg(fc,d,hBS1,hMS,hroof2,b,w,AX(i),0);   % mobile station similar height with the base station
        [x ,AYUh2(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),0);   % mobile station lower in height than the base station(middle case)
        [x ,AYUh3(1,i)]=walfkeg(fc,d,hBS,hMS,hroof2,b,w,AX(i),0);    % mobile station waayy lower in height than the base station     
        
        % The height of the roof of buildings
        [x ,AYUr0(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof,b,w,AX(i),0);     % very low height (2 m)
        [x ,AYUr1(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof1,b,w,AX(i),0);    % low roof height (10 m)
        [x ,AYUr2(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),0);    % middle roof height (30 m)
        [x ,AYUr3(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof3,b,w,AX(i),0);    % higher roof height (50 m)
        
        %
        [x ,AYUb0(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b1,w,AX(i),0);     
        [x ,AYUb1(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b2,w,AX(i),0);    
        [x ,AYUb2(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),0);    
        [x ,AYUb3(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b3,w,AX(i),0);    
        
        %
        [x ,AYUw0(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w1,AX(i),0);     
        [x ,AYUw1(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w,AX(i),0);    
        [x ,AYUw2(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w2,AX(i),0);    
        [x ,AYUw3(1,i)]=walfkeg(fc,d,hBS2,hMS,hroof2,b,w3,AX(i),0);    
        
                      
    end
        figure(31);    
        xlabel('Angle(degrees)');
        title('Loss(db) - Angle, b = 15, w = 4 ')
        grid on;
        plot(AX,AYU, AX,AYSU);legend('Small City','Large City');       
        
        figure(32);
        xlabel('Angle(degrees)');
        title('Loss(db) - Angle, b = 15, w = 4 ')
        grid on;
        plot(AX,AYUd1, AX,AYUd2, AX,AYUd3);legend('d = 0.02 km', 'd = 2.87 km', 'd = 5 km');

        figure(33);
        xlabel('Angle(degrees)');
        title('Loss(db) - Angle, b = 15, w = 4 ')
        grid on;
        plot(AX,AYUh1, AX,AYUh2, AX,AYUh3);legend('HBs ~ HMs','HBs > HMs','HBs >> HMs');
        
        figure(34);
        xlabel('Angle(degrees)');
        title('Loss(db) - Angle, b = 15, w = 4 ')
        grid on;
        plot(AX,AYUr0, AX,AYUr1, AX,AYUr2, AX,AYUr3);legend('Hroof = 2','Hroof = 10','Hroof = 30','Hroof = 50');
        
        figure(35);
        xlabel('Angle(degrees)');
        title('Loss(db) - Angle, w = 6 ')
        grid on;
        plot(AX,AYUb0, AX,AYUb1, AX,AYUb2, AX,AYUb3);legend('b = 2','b = 4','b = 8','b = 16');
        
        figure(36);
        xlabel('Angle(degrees)');
        title('Loss(db) - Angle, b = 8')
        grid on;
        plot(AX,AYUw0, AX,AYUw1, AX,AYUw2, AX,AYUw3);legend('w = 2','w = 6','w = 10','w = 14');
        
        figure(37);      
        title('Loss(dB)-Angle,b=15,w=4');
        xlabel('Angle(degrees)');
        grid on;
        plot(AX,AYUf2, AX,AYUf1, AX,AYUf3); legend('fc = 800 MHz','fc = 1000 MHz','fc = 2000 MHz');
        
%else
 %   plot(1000,1000);
    %end
   