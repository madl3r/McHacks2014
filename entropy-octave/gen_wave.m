function wave = gen_wave(freq,nsecs)
  bps = 16;
  sps = 8000;

  nsamples = sps*nsecs;

  time = linspace(0, nsecs, nsamples);
  wave = sin(time*2*pi*freq);

endfunction

