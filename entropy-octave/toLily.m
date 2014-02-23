function score = gen_notes(filename)

score = []
score = [score "\\header{title = \"" filename "\"} {\\time 4/4 \n \\clef bass "]

fopen(filename)

[notes, beats] = textread(filename, '%s %s')

for i = 1:size(notes)(1)
	%currentNote = substr(notes{i}, 2, size(notes{i}) - 2)
	currentNote = regexprep(notes{i}, "\"", "")
	score = [score currentNote beats{i} ' ']
end

score = [score '}']

fclose(filename)

theFile = fopen([filename '.ly'], 'w')

fprintf(theFile, '%s', score)



fclose(theFile)

end

