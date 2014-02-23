function gen_music_wioct(npitches, low, high, filename)
  bps = 16;
  sps = 8000;
  
  wave  = [];
  freqs = [];
  lens  = [];
  freq  = 10^(unifrnd(log10(low),log10(high)));
  for i = 1:npitches
    %highN = min(freq*2,high);
    %lowN  = max(freq/2,low );
    %mn    = sqrt(highN*lowN);
    %freq  = max(min(exprnd(mn),highN),lowN);
    freq  = 10^(unifrnd(log10(max(freq/2,low)),log10(min(freq*2,high))));
    freqs = [freqs; freq];
    nsecs = exprnd(0.5);
    lens  = [lens; nsecs];
    wave  = [wave, gen_wave(freq,nsecs)];
  end

  wave = wave';
  
  dlmwrite([filename '.score'], [freqs, lens], ',');
  wavwrite(wave, sps, bps, [filename '.wav']);

