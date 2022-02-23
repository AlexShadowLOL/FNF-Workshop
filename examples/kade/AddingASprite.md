# Adding a Sprite Example with FlxSprite

**WARNING: These Are Only for Friday Night Funkin' Some .hx Files Like `Paths.hx` & `MusicBeatState.hx` Doesn't Exists on Flixel Projects**

### 1. Import FlxSprite
**Only If The Import It's Not on The Current State or You Are Making a New State**

Below `package;` add

```haxe
import flixel.FlxSprite;
```

### 2. Add Your Sprite Variable
Below `class ClassName` or `class ClassName extends ClassName` (depends)
Add:

```haxe
var iLoveTea:FlxSprite;
```

**REMEMBER: Variables Can't Start With Uppercase it Should Be on Lowercase**

### 3. Load Your Sprite
Below `override function create()` or `public function new()` (depends)

Add:

```haxe
iLoveTea = new FlxSprite(xAxis, yAxis).loadGraphic(Paths.image('replace this for you image path'));
```

**Image Path EX: ('characters/BOYFRIEND', 'shared')**
**Basically: ('Folder/Image', 'Library')**

**X Axis & Y Axis EX: (100, 450)**

**X Axis (Lower Value) = Left**
**X Axis (Higher Value) = Right**
**Y Axis (Lower Value) = Up**
**Y Axis (Higher Value) = Down**

### 4. Add Your Sprite
To Add Your Sprite
Add:

```haxe
add(iLoveTea);
```

# Basic FlxSprite Variables
- If You Want Your Image/Sprite To Be Smoothed (Can Slightly Affect Performance) Add:

```haxe
iLoveTea.antialiasing = true;
```

if Not:

```haxe
iLoveTeam.antialiasing = false;
```

- If You Want To Change Your Image/Sprite Opacity Add:

```haxe
iLoveTeam.alpha = 0.6; // 0 = invisible, 1 = visible
```

- If You Want To Make Your Image/Sprite Invisible Add:

```haxe
iLoveTea.visible = false;
```

- If You Want to Tint Your Image/Sprite to Another Color Add:

```haxe
iLoveTea.color = 0xFFFFFF; // (0xRRGGBB format)
```

- If You Want To Flip Your Image/Sprite on The X/Y Axis Add:

```haxe
iLoveTea.flipX = true;
```

```haxe
iLoveTea.flipY = true;
```

- If You Want to Center Your Image/Sprite Add:

**Both X/Y Axis**
```haxe
iLoveTea.screenCenter();
```

**X Axis**
```haxe
iLoveTea.screenCenter(X);
```

**Y Axis**
```haxe
iLoveTea.screenCenter(Y);
```

- If You Want To Change Your Image/Sprite's Size Add:

**THIS FIRST METHOD CAN DECREASE RENDERING PERFORMANCE**
```haxe
iLoveTea.scale(1.1, 1.1);
iLoveTea.updateHitbox(); // since with scale, the hitbox it's not automatically adjusted
```

**IMPORT: `import flixel.FlxG;` BELOW `package;` TO USE THIS**
```haxe
iLoveTea.setGraphicSize(FlxG.width, FlxG.width); // resizing it to the game screen size
```

- If You Want to Remove Your Sprite at Anytime, You Can Do:

```haxe
remove(iLoveTea);
```

# A Full Example of How It Can Look (In A Whole New State)

```haxe
package;

import flixel.FlxSprite;
import flixel.FlxG;

class MyTeaState extends MusicBeatState
{
	var iLoveTea:FlxSprite;

    // we dont talk about create
	override function create()
	{
		super.create();

		iLoveTea = new FlxSprite(247, 190).loadGraphic(Paths.image('miscStuff/teaCup', 'shared'));
		iLoveTea.antialiasing = true;
		iLoveTea.screenCenter();
		iLoveTea.setGraphicSize(FlxG.width, FlxG.width); // resizing it to the game screen size
		add(iLoveTea);
	}

    // we dont talk about update
	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
```