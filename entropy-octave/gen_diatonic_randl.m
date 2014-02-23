function gen_diatonic_randl(npitches, filename)
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
    nsecs = exprnd(0.5);
    lens  = [lens; nsecs];
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  dlmwrite([filename '.score'], [freqs, lens], ',');
  wavwrite(wave, sps, bps, filename);
