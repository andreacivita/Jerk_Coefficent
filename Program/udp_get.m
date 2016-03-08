% MATLAB code to read data from a WiFi network by 
% the UDP protocol by Andrea Civita, Giuseppe 
% Romani and Simone Fiori (Universita' Politecnica 
% delle Marche, October 2015)
datastream = 9000; timeout = 30;
UDPComIn = udp('0.0.0.0','LocalPort',1234); 
set(UDPComIn,'DatagramTerminateMode','off',...
    'InputBufferSize',datastream,'TimeOut',timeout) 
fopen(UDPComIn); 
readout = fscanf(UDPComIn,'%s',datastream); 
fclose(UDPComIn);
scandata = textscan(readout,'%s',datastream,...
                    'Delimiter',', ,#');
scan = scandata{1};
scan=scan(~cellfun('isempty',scan));
apparray = cellfun(@str2num,scan);
data = vec2mat(apparray,3)';

