function wave = gen_diatonic_wioct(npitches, filename)
  bps = 16;
  sps = 8000;
  
  piano = dlmread('piano.csv');

  wave  = [];
  freqs = [];
  lens  = [];
  key   = unidrnd(43)+22;
  for i = 1:npitches
    keyo  = unidrnd(25)-13;
    key   = max(min((key + keyo),66),20);
    freq  = piano(key);
    freqs = [freqs; freq];
    nsecs = exprnd(0.5);
    lens  = [lens; nsecs];
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  dlmwrite([filename '.score'], [freqs, lens], ',');
  wavwrite(wave, sps, bps, [filename '.wav']);