function score = gen_notes(filename)

score = []
score = [score "{\\time 2/4 \n \\clef bass"]

theFile = fopen(filename)

theMatrix = dlmread(filename)

for i = 1:size(theMatrix)(1)
	score = [score theMatrix(i, 1) theMatrix(i, 2) ' ']
end

score

end

