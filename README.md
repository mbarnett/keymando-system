System
============

A simple plugin for controlling the Mac OS X System Properties (right now, volume and play/pause) via Keymando.


Basic Usage
===========

The volume is set on a scale from 0 (off) to 100 (full volume).

Increase volume
---------------

``` ruby
    System.increase
```
Defaults to an increase of 10 units. A different increment step can be specified instead:

``` ruby
    System.increase 33
```

Decrease volume
---------------

``` ruby
    System.decrease
```
Defaults to an decrease of 10 units. A different decrement step can be specified instead:

``` ruby
    System.decrease 33
```

Play/Pause
-----------

``` ruby
    System.toggle_pause
```
