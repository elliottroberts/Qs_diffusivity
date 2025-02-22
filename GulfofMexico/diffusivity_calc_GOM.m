% Gulf of Mexico barriers diffusivity

%% format and save WIS data
% inputFolder_WIS = ['/Users/rosepalermo/Documents/GitHub/Qs_diffusivity/GulfofMexico/WIS_GOM/WIS_save/']; % where is your WW3 data?
% % % % % formatWIS(inputFolder_WIS,inputFolder_WIS)
% saveWISdata(inputFolder_WIS,inputFolder_WIS)
% %% compute wave climate
inputFolder_Waves = ["/Users/rosepalermo/Documents/GitHub/Qs_diffusivity/GulfofMexico/WIS_GOM/WIS_save/"];
outputFolder_waveclimate = ["/Users/rosepalermo/Documents/GitHub/Qs_diffusivity/GulfofMexico/WIS_GOM/waveclimate_test/"];
plot_on = 0; % 1 to make plots, 0 to not
save_on = 1;
computewaveclimate_CERC(inputFolder_Waves,outputFolder_waveclimate,10,plot_on,save_on)

%% look up diffusivity for each barrier given sl angle and closest station

load('barrier_coord_az.mat')
load('sl_az_v2.mat')
load('wis_info.mat')
wis_station(6) = [];
diffusivity_m2s = zeros(length(sl_az),1);
WaveAngle = zeros(length(sl_az),1);

% Ang = (mod(sl_az,180));
% SLAng =  - atan(SLAng)/degtorad - RotationAngle;
for i = 1:length(diffusivity_m2s)
    [diffusivity_m2s(i),WaveAngle(i)] = lookup_diffusivity_gom(sl_az(i),wis_station(i),outputFolder_waveclimate,i,BarrierIsland(i));
end
