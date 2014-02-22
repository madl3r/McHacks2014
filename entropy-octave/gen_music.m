function wave = gen_music(npitches, filename)
  bps = 16;
  sps = 8000;
  
  wave = [];
  for i = 1:npitches
    freq  = unifrnd(20,4200);
    nsecs = exprnd(0.5);
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';

  wavwrite(wave, sps, bps, filename);
