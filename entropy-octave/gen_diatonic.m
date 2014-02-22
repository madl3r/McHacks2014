function wave = gen_diatonic_randl(npitches, filename)
  bps = 16;
  sps = 8000;
  
  piano = dlmread('piano.csv');

  wave = [];
  for i = 1:npitches
    key   = unidrnd(88);
    freq  = piano(key);
    nsecs = exprnd(0.5);
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  wavwrite(wave, sps, bps, filename);
