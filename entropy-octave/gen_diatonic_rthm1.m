function gen_diatonic_rthm1(npitches, bpm, filename)
  bps = 16;
  sps = 8000;
  
  piano = dlmread('piano.csv');

  wave  = [];
  freqs = [];
  lens  = [];
  for i = 1:npitches
    key   = unidrnd(43);
    freq  = piano(key+22);
    freqs = [freqs; freq];
    nsecs = (2^(-binornd(4,0.25)))*bpm/60;
    lens  = [lens; 4*round(1/nsecs)]; %writes lilypond-style note length
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  dlmwrite([filename '.score'], [freqs, lens], ',');
  wavwrite(wave, sps, bps, [filename '.wav']);
