function gen_music(npitches, low, high, filename)
  bps = 16;
  sps = 8000;
  
  wave  = [];
  freqs = [];
  lens  = [];
  for i = 1:npitches
    freq  = unifrnd(low,high);
    freqs = [freqs; freq];
    nsecs = exprnd(0.5);
    lens  = [lens; nsecs];
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';
  
  dlmwrite([filename '.score'], [freqs, lens], ',');
  wavwrite(wave, sps, bps, [filename '.wav']);
