# How to Do a Camera Flash Mid Song

### 1. Edit `PlayState.hx`

Below `override function stepHit()` Add:

```haxe
if (curSong.toLowerCase() == 'your-song-name-in-lowercase')
{
	switch (curStep)
	{
		case 100:
			camHUD.flash(FlxColor.WHITE, 0.5);
	}
}
```