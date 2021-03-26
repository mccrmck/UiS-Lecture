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


Synth(\grainPlayback,[\bufnum,~violin,\grainDur,0.01,\pos,0.45])


(
Pdef(\grainer,
	Pbind(
		\instrument, \default,
		\dur, Pseq([1/8],inf),
		\note,Pwrand([0,2,5,8],[0.4,0.2,0.2,0.2],inf),
		\legato,0.1,
		\amp,0.2,
		\tempo,60/60,
		\pan, 0,
		\outBus,0
	)
).play
)


Pdef(\grainer).fadeTime = nil
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


