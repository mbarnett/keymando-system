SystemVolume
============

A simple interface for controlling the Mac OS X System Volume via Keymando.


Basic Usage
===========

The volume is set on a scale from 0 (off) to 100 (full volume).

Current Volume
--------------

``` ruby
    SystemVolume.current
```

Increase volume
---------------

``` ruby
    SystemVolume.increase
```
Defaults to an increase of 10 units. A different increment step can be specified instead:

``` ruby
    SystemVolume.increase 33
```

Decrease volume
---------------

``` ruby
    SystemVolume.decrease
```
Defaults to an decrease of 10 units. A different decrement step can be specified instead:

``` ruby
    SystemVolume.decrease 33
```

Set volume
----------

``` ruby
    SystemVolume.set 75
```


Muting / Unmuting
-----------------

``` ruby
    SystemVolume.toggle_mute
```

Muted?
------

``` ruby
    SystemVolume.muted?
```

