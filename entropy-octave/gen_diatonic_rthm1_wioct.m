function gen_diatonic_rthm1_wioct(npitches, bpm, filename)
  bps = 16;
  sps = 8000;
  
  piano = dlmread('piano.csv');

  wave  = [];
  freqs = [];
  lens  = [];
  key   = 43;
  for i = 1:npitches
    keyo  = unidrnd(25)-13;
    key   = max(min((key + keyo),66),20);
    freq  = piano(key);
    freqs = [freqs; freq];
    nsecs = (2^(-binornd(4,0.25)))*bpm/60;
    lens  = [lens; 4*round(1/nsecs)]; %writes lilypond-style note length
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  dlmwrite([filename '.score'], [freqs, lens], ',');
  wavwrite(wave, sps, bps, [filename '.wav']);

