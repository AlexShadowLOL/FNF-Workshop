# Adding a Countdown MidSong like In Da Sonic.exe Mod

### 1. Edit `PlayState.hx`

Below `override function stepHit()` Add:

```haxe
if (curSong.toLowerCase() == 'your-song-name-in-lowercase')
{
	switch (curStep)
	{
		case 100:
			FlxG.sound.play(Paths.sound('intro3', 'shared'), 0.6);
		case 104:
			var ready:FlxSprite = new FlxSprite().loadGraphic(Paths.image('ready', 'shared'));
			ready.scrollFactor.set();
			ready.updateHitbox();
			ready.screenCenter();
			add(ready);

			FlxTween.tween(ready, {y: ready.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			ease: FlxEase.cubeInOut,
			onComplete: function(twn:FlxTween)
			    {
			        ready.destroy();
			    }
	        });
		    FlxG.sound.play(Paths.sound('intro2', 'shared'), 0.6);
	    case 108:
		    var set:FlxSprite = new FlxSprite().loadGraphic(Paths.image('set', 'shared'));
		    set.scrollFactor.set();
		    set.screenCenter();
		    add(set);

		    FlxTween.tween(set, {y: set.y += 100, alpha: 0}, Conductor.crochet / 1000, {
			    ease: FlxEase.cubeInOut,
			    onComplete: function(twn:FlxTween)
			    {
				    set.destroy();
			    }
		    });
		    FlxG.sound.play(Paths.sound('intro1', 'shared'), 0.6);
	    case 112:
		    var go:FlxSprite = new FlxSprite().loadGraphic(Paths.image('go', 'shared'));
		    go.scrollFactor.set();
		    go.updateHitbox();
		    go.screenCenter();
		    add(go);
            
		    FlxTween.tween(go, {y: go.y += 100, alpha: 0}, Conductor.crochet / 1000, {
		    ease: FlxEase.cubeInOut,
		    onComplete: function(twn:FlxTween)
		        {
			        go.destroy();
		        }		
            });

		    FlxG.sound.play(Paths.sound('introGo', 'shared'), 0.6);
	}
}
```

Yep... That's It