# Changing Stage Mid-Song

### 1. Add Your Second Stage
Below Your Current Stage, Add The Stage You Want To Change It To, And Make It Invisible

EX:

```haxe
// current stage
myimage = new FlxSprite().loadGraphic(Paths.image('myimage', 'shared'));
myimage.setGraphicSize(Std.int(myimage.width * 1.6));
myimage.updateHitbox();
myimage.antialiasing = true;
myimage.scrollFactor.set(1, 0.9);
add(myimage);

// next stage
myimage2 = new FlxSprite().loadGraphic(Paths.image('myimage2', 'shared'));
myimage2.setGraphicSize(Std.int(myimage2.width * 1.6));
myimage2.updateHitbox();
myimage2.visible = false;
myimage2.antialiasing = true;
myimage2.scrollFactor.set(1, 0.9);
add(myimage2);
```

**THE VARIABLES SHOULD BE SET BELOW OF THE CLASS BEFORE CREATE OR ELSE IT WILL GIVE YOU A UNKNOWN IDENTIFIER ERROR WHEN COMPILING**

### 2. Create a Stage Change Function
Above `var curLight:Int = 0;` (On The Whole Bottom of PlayState.hx) Add This Function:

```haxe
function changeStage()
{
	myimage2.visible = true;
	myimage.visible = false;
}
```

### 3. Call The Function
Below `override function stepHit()` Add:

```haxe
if (curSong.toLowerCase() == 'your-song-name-in-lowercase')
{
	switch (curStep)
	{
		case 100:
			changeStage();
	}
}
```

**YOU CAN SEE THE CURSTEP ON THE CHART EDITOR**
