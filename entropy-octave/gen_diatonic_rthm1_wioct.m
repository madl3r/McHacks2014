function gen_diatonic_rthm1_wioct(npitches, bpm, filename)
  bps = 16;
  sps = 8000;
  
  [name1,name2,piano] = textread('fullPiano.csv','%s %s %f');


  wave  = [];
  notes = {};
  lens  = [];
  key   = 43;
  for i = 1:npitches
    keyo  = unidrnd(25)-13;
    key   = max(min((key + keyo),66),20);
    freq  = piano(key);
    if (rand(1)>0.5)
      note = name1{key};
    else
      note = name2{key};
    endif
    notes{i} = note;
    b     = (binornd(4,0.25));
    nsecs = (2^(b-2))*60/bpm;
    lens  = [lens; 2^(4-b)]; %writes lilypond-style note length
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  %dlmwrite([filename '.score'], [notes, lens], ',');
  fid = fopen([filename '.score'],'w');
  for i = 1:npitches
    fprintf(fid,'%s\n', [notes{i} ' ' int2str(lens(i))]);
  end
  
  fclose(fid);


  wavwrite(wave, sps, bps, [filename '.wav']);

