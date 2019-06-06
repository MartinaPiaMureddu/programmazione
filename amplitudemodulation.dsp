import("stdfaust.lib");

modulator = hgroup("[01] MODULATOR", os.oscsin(frq) : *(amp): +(offset))
  with{ 
    
    frq = vslider("[01] FREQ [style:knob] [unit:Hz]", 1.0,0.1,20000.0,0.1); 
    amp = vslider("[02] AMP [style:knob]", 0.5,0.0,1.0,0.01);
    offset = vslider("[03] OFFSET[style:knob]", 0.5,0.0,5.0,0.01);
};

 
carrier = hgroup("[01] AMPLITUDE MODULATION", hgroup("[01] CARRIER", os.oscsin(frq)) : *(modulator))
  with{
    frq = vslider("[01] FREQ [style:knob] [unit:Hz]", 440,20,20000,1);        
};

process = carrier ;
