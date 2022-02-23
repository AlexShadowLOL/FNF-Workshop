# Adding an Animated Spritesheet Example with Flixel Animation Support

**WARNING: These Are Only for Friday Night Funkin' Some .hx Files Like `Paths.hx` & `MusicBeatState.hx` Doesn't Exists on Flixel Projects**

### 1. Import FlxSprite
**Only If The Import It's Not on The Current State or You Are Making a New State**

Below `package;` add

```haxe
import flixel.FlxSprite;
```

### 2. Add Your Spritesheet Variable
Below `class ClassName` or `class ClassName extends ClassName` (depends)
Add:

```haxe
var ballsBalls:FlxSprite;
```

**REMEMBER: Variables Can't Start With Uppercase it Should Be on Lowercase**

### 3. Load Your Spriteheet
Adding an Animated Spritesheet is a Bit Different from Adding a Normal Image/Sprite
Below `override function create()` or `public function new()` (depends)

Add:

```haxe
ballsBalls = new FlxSprite(xAxis, yAxis);
ballsBalls.frames = Paths.getSparrowAtlas('spritesheet path here');
```

- Spritesheet Path Example Is The Same as Adding a Normal Image/Sprite (check it on AddingASprite.md File)

### 4. Add Your Animation
Below of What we Added Recently, Add:

```haxe
ballsBalls.animation.addByPrefix('play', 'animation name on xml', 24);
```

### 5. Make the Animation Play
Bellow of What we Added Recently, Add:

```haxe
ballsBalls.animation.play('play');
```

- An Animated Sprite has All of FlxSprite Basic Variables so It's Not Necessary to Re-Add it Here (check them on AddingASprite.md File)

# A Full Example of How It Can Look (In A Whole New State)

```haxe
package;

import flixel.FlxSprite;

class MyTeaState extends MusicBeatState
{
	var ballsBalls:FlxSprite;

	override function create()
	{
		super.create();

		ballsBalls = new FlxSprite(784, 181);
		ballsBalls.frames = Paths.getSparrowAtlas('deezNuts/balls', 'shared');
		ballsBalls.animation.addByPrefix('play', 'Balls Idle', 24);
		ballsBalls.animation.play('play');
		ballsBalls.antialiasing = true;
		ballsBalls.screenCenter();
		add(ballsBalls);
	}

    // we dont talk about update
	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
```
