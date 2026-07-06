%
isCodegen = false;

% TanSacNet パッケージバージョン
TanSacNet_VER = "v0.2.0";
TanSacNet_DIR = "TanSacNet-"+TanSacNet_VER;
if ~exist(TanSacNet_DIR,"dir")
    unzip("https://github.com/msiplab/TanSacNet/archive/refs/tags/"+TanSacNet_VER+".zip")
else
    disp(TanSacNet_DIR+" exits.")
end

isMexCodesAvailable = true;

root_dir = fullfile(pwd,'TanSacNet-0.2.0','code');
if  exist(fullfile(root_dir,'+tansacnet/'),'dir') == 7
    envname = 'TANSACNET_ROOT';
    if strcmp(getenv(envname),'')
        setenv(envname,root_dir)
    end
    addpath(fullfile(getenv(envname),'.'))
    %
    sdirmexcodes = fullfile(getenv(envname),'mexcodes');
    if isMexCodesAvailable && exist(sdirmexcodes,"dir")
        addpath(sdirmexcodes)
    elseif strfind(path,sdirmexcodes)  %#ok
        rmpath(sdirmexcodes)
    end
else
    error(['Move to the root directory of TanSacNet Package ' ...
           'before executing setpath.']);
end

%% http://databookuw.com/DATA.zip
ccd = pwd;
data_dir = fullfile(ccd,'data');
if ~exist(fullfile(data_dir,'databool_DATA'),"dir")
    disp("Downloading databook DATA ...")
    unzip("http://databookuw.com/DATA.zip",fullfile(data_dir,'databook_DATA'))
else
    disp("databook_DATA exists.")
end

if ~exist("data/VORTALL.mat","file")
    disp("Copying VORTALL.mat ...")
    copyfile("./data/databook_DATA/DATA/VORTALL.mat","DATA")
else
    disp("VORTALL.mat exists.")
end
cd(ccd)
