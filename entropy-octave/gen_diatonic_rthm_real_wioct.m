function gen_diatonic_rthm_real_wioct(npitches, bpm, filename)
  bps = 16;
  sps = 8000;
  
  [name1,name2,piano] = textread('fullPiano.csv','%s %s %f');

  beatcount = 0;

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
    if (mod(beatcount,16)==0)
      b     = (binornd(4,0.25));
      nsecs = (2^(b-2))*60/bpm;
      len   = 2^(4-b);
    elseif (mod(beatcount,16)==2) % then can add 8th or 16ths
      b     = (binornd(1,0.65));
      nsecs = 0.25*(b+1);
      len   = 8*(b+1);
    else % can only add 16ths
      nsecs = (.25)*60/bpm;
      len   = 16;
    endif
    lens  = [lens; len]; %writes lilypond-style note length
    wave  = [wave, gen_wave(freq,nsecs)];
    beatcount = beatcount + (16*round(1/len)); 
  end

  wave = wave';

  %dlmwrite([filename '.score'], [notes, lens], ',');
  fid = fopen([filename '.score'],'w');
  for i = 1:npitches
    fprintf(fid,'%s\n', [notes{i} ' ' int2str(lens(i))]);
  end
  
  fclose(fid);


  wavwrite(wave, sps, bps, [filename '.wav']);

