# Pattern Syntax

* [Pitches](#pitches)
* [Rhythm](#rhythm)
* [Chords](#chords)
* [Octave Transposition](#octave)
* [Alterations](#alterations)

## Pitches
Pitches are represented by numbers in hex format.
From `0` to `f` they are the steps numbers of the chosen scale.
For example in C-chromatic scale they are:

- 0  -  C
- 1  -  C#
- 2  -  D
- 3  -  D#
- 4  -  E
- 5  -  F
- 6  -  F#
- 7  -  G
- 8  -  G#
- 9  -  A
- a  -  A#
- b  -  B
- c  -  C
- d  -  C#
- e  -  D
- f  -  D#

In C-major scale:

- 0  -  C
- 1  -  D
- 2  -  E
- 3  -  F
- 4  -  G
- 5  -  A
- 6  -  B
- 7  -  C
- 8  -  D
- 9  -  E
- a  -  F
- b  -  G
- c  -  A
- d  -  B
- e  -  C
- f  -  D


`r` stays for (r)est. You can use it as a pitch to get a rest instead.

## Rhythm
The each note with a space after or before it is equal to 1 beat in duration. 
The 1 beat is usually equal to a quarter note, but it depends of the project's settings.

So for example (C-chromatic at G clef):

```Io
"0 0"
```

is

<img src="img/0001.png" height="70" />

But the next example is also 1 beat in duration:

```Io
"0"
```
<img src="img/0002.png" height="70" />

When there are few notes on the same beat, they share the beat between them proportionally:

```Io
"00 0"
```

<img src="img/0003.png" height="70" />

Such groups can be made with parenthesis also. All the notes inside parenthesis are sharing the beat:

```Io
"(00 0) 0"
```
<img src="img/0004.png" height="70" />

```Io
"00(00)0 r"
```
<img src="img/0005.png" height="70" />

Note that the above pattern is equal to:

```Io
"(0 0 (0 0) 0) r"
```

There are methods for rhythmic constructions:

* `+` is a tie. A note will be concatenated with another that has this sign instead of a pitch;
* `.` makes a dot. Prolongs a note's duration for a half of its size;
* `*` increases note's duration exponentially (i.e. doubles duration each time);
* `:` decreases note's duration exponentially.

#### Examples:

```Io
"0 + + 0" // (0 + 0 + 0) 0
```
<img src="img/0006.png" height="70" />

```Io
"0.0"
```
<img src="img/0007.png" height="70" />

```Io
"0++0"
```
<img src="img/0008.png" height="70" />

```Io
"0. 0: 0"
```
<img src="img/0009.png" height="70" />

```Io
"0:0."
```
<img src="img/0010.png" height="70" />

```Io
"0. 0. 0."
```
<img src="img/0011.png" height="70" />

```Io
"0**" // 1/4 * 2 * 2
```
<img src="img/0012.png" height="70" />

These methods can be combined in chains:
```Io
"0*. 0"
```
<img src="img/0013.png" height="70" />

And can be aplied to parenthesised groups:
```Io
"(00 0)**"
```
<img src="img/0018.png" height="80" />

## Chords
Inside of square brackets all the first-order beats will be played on one beat.
```Io
"[0 4 7]"
```
<img src="img/0014.png" height="70" />

Described above rhythmic rules also work here:
```Io
"[0 4 7b]"
```
<img src="img/0015.png" height="80" />

```Io
"[0 4 (7b 7)]"
```
<img src="img/0016.png" height="80" />

## Octave Transposition
To change octave you can use two `o`s between which you put a number of octaves to which you want to transpose.
Positive number will transpose up, a negative one — down.
This construct should be placed before a note which you want to transpose. All the next notes will be played in the new octave.

```Io
"o1o 234 o-1o 210"
```
In C-major scale (G clef) will be:

<img src="img/0017.png" height="80" />

## Alterations
To alterate a pitch put a floating point number between two `#` before the pitch, that you want to alter.
The number is a number of steps to alter. A positive one will alterate up, a negative — down. 

In C-major scale (G clef):
```Io
"#-1# 5 6"
```
<img src="img/0019.png" height="80" />

Microchromatic alterations are also possible here.
```Io
"2#0.5#3"
```
<img src="img/0020.png" height="80" />

