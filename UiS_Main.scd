// Hei!!!



~violin = Buffer.readChannel(s,"/Users/mikemccormick/Documents/GitHub/CLCWebinar/violin.aiff",channels:[0])
~violin.play


(
SynthDef(\grainPlayback,{
	var bufnum = \bufnum.kr;
	var env = Env.sine(\grainDur.kr(0.1)).kr(2);
	var frames = BufFrames.kr(bufnum) - 1;
	var sig = PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum) * \rate.kr(1),startPos:frames * \pos.kr(0),loop:1);
	sig = Pan2.ar(sig * env,\pan.kr(0),\amp.kr(1));
	Out.ar(\outBus.kr(0),sig);
}).add;
)


Synth(\grainPlayback,[\bufnum,~violin,\grainDur,0.1,\pos,0.45])

b.play


(
Pdef(\grainer,
	Pbind(
		\instrument, \grainPlayback,
		\dur, Pseq([0.05],inf),
		\bufnum, ~violin,
		\grainDur,0.6,
		\pos,Pseries(0.4,0.0002,inf) + Pwhite(0.0001,0.003,inf),
		\rate,Pseq([[0.25,0.5,1,2]],inf),
		\amp,0.5,
		\pan,0,
		\outBus,0
	)
).play
)


Pdef(\grainer).fadeTime = 4
Pdef(\grainer).stop


Score

/* --- Electronic music examples --- */

// https://open.spotify.com/playlist/1iBVxZhOmewbgd7ekHr51J?si=d5995c637eb24b9e

/* --- You can find some of my music here --- */

// YAWN - metal w/ live processing, synthesis, in-ear clicks
// https://www.youtube.com/watch?v=xQB6l7PKONM

// ternOP - improvising laptop/contrabass duo
// https://soundcloud.com/mike-mccormick-music/sets/ternop

// EIDOLON - interactive improvisation algorithm
// https://mikemccormickmusic.com/music/eidolon/

// SCJournals - "live coded" multimedia pieces
// https://www.youtube.com/playlist?list=PLj-xkY-L6IYkg6RrJxi7t2OivP2uSKuMH


/* --- SC resources --- */

// https://supercollider.github.io/
// https://github.com/madskjeldgaard/awesome-supercollider
// scsynth.org
// https://www.facebook.com/groups/supercollider/
// https://github.com/MccormickMike/UiS-Lecture

