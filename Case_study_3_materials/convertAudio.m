%% function convertAudio(inFile,outFile)
% reads in an audio file specified by inFile
% shortens the audio to 30 sec if the file is large
% writes the audio into a mat file specified by outFile
%
% inFile - string with path to audio file
% outFile - string with path to MAT file
%
% Example usage:
% convertAudio('Eine_kleine_Nachtmusik.mp3','Eine_kleine_Nachtmusik.mat');
%
% Matthew Lew 11/16/2018
% edited 11/26/2020 to allow 30 sec of audio to be converted

function convertAudio(inFile, outFile)
[Vsound,Fs] = audioread(inFile);
len = min(length(Vsound),30*Fs);
Vsound = Vsound(1:len);
Vsound = Vsound/max(Vsound(:));
save(outFile,'Vsound','Fs');
end