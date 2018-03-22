BowlingGame
============

This should be a class with two methods:

```
BowlingGame#roll(n): Record a roll of n pins. No output or return value.

BowlingGame#score:   Return the final score, based on previous calls to
                     the #roll(n) method.
```

Rules of Ten-Pin Bowling
------------------------

A complete game consists of ten **frames.** Each frame gives the player
up to two chances to knock down ten pins.

If they knock them all down on the first try, it's a **strike.** If they
knock them all down on the second try, it's a **spare.**

If any pins are left standing, the score for the frame is simply the
number of pins knocked down (e.g. if I roll 3 then 4, my score is 7).

If a spare is rolled, then the first roll of the next frame is added to
this frame's score (as well as to the next frame's). If a strike is
rolled, then the next two rolls are added.

So if I roll 5, 5, then 3 (where 3 will actually be part of the next
frame), my score for the first frame is 13, and my score so far is 16.

If I roll 10, 3, then 4, my score for the first frame is 17, and my
score so far is 24.
