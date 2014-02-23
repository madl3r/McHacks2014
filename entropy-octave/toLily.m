function score = gen_notes(filename)

score = []
score = [score "\\header{title = \"" filename "\"} {\\time 4/4 \n \\clef treble "]

fopen(filename)

[notes, beats] = textread(filename, '%s %s');

for i = 1:size(notes)(1)
	currentNote = regexprep(notes{i}, "\"", "");
	score = [score currentNote beats{i} ' '];
end

score = [score '}'];

fclose(filename)

theFile = strsplit(filename, ".");

theFileName = [theFile{1} '.ly'];

fileID = fopen(theFileName, 'w')


fprintf(fileID, '%s', score)

fclose(fileID)

end

