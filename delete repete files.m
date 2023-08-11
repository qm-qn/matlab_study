clc;
clear;

Folders_1 = {};

folders = dir('D:\Google\download\QQ空间备份_2589688044\Albums\生活');
folders(strcmp({folders(:).name}, '.') | strcmp({folders(:).name}, '..')) = [];
Folders_1 = {folders.name};

for i=1:length(Folders_1)
    m_name = ['D:\Google\download\QQ空间备份_2589688044\Albums\生活' '\' Folders_1{i}];
    files = dir(m_name);
    files(strcmp({files(:).name}, '.') | strcmp({files(:).name}, '..')) = [];
    filename_1 = {files.name};
    for j = 1:length(filename_1)
        [~, filename, fileExt] = fileparts(filename_1{j}); % 去掉后缀的文件名部分
        if filename(length(filename)-2)=='(' && filename(length(filename)-1)=='1' && filename(length(filename))==')'
            delete(['D:\Google\download\QQ空间备份_2589688044\Albums\生活' '\' Folders_1{i} '\' filename fileExt]);
        end
    end
end