# Creating A FlxTimer

- Method:

```haxe
new FlxTimer().start(Time:Float, function(tmr:FlxTimer)
{
    // your code here
});
```

Example:

```haxe
new FlxTimer().start(3.5, function(tmr:FlxTimer)
{
    remove(dad);
    remove(gf);
    add(bf);
});
```

- Basically, it Will Wait 3.5 Seconds To Remove Dad & GF, And Add BF