# Add Parallax Effect (Camera Movement on Note Hit)

### 1. Add Shit (Yah, Very Self Explanatory, Right?)

Below PlayState.hx's `override function create()` Add:

```haxe
camMovement = FlxTween.tween(this, {}, 0);
```

### 2. Replace Cam Offset Code

Replace:

```haxe
if (camFollow.x != dad.getMidpoint().x + 150 && !PlayState.SONG.notes[Std.int(curStep / 16)].mustHitSection)
{
	var offsetX = 0;
	var offsetY = 0;
	#if windows
	if (luaModchart != null)
	{
		offsetX = luaModchart.getVar("followXOffset", "float");
		offsetY = luaModchart.getVar("followYOffset", "float");
	}
	#end
	camFollow.setPosition(dad.getMidpoint().x + 150 + offsetX, dad.getMidpoint().y - 100 + offsetY);
	#if windows
	if (luaModchart != null)
		luaModchart.executeState('playerTwoTurn', []);
	#end
	// camFollow.setPosition(lucky.getMidpoint().x - 120, lucky.getMidpoint().y + 210);

	switch (dad.curCharacter)
	{
		case 'mom':
			camFollow.y = dad.getMidpoint().y;
		case 'senpai':
			camFollow.y = dad.getMidpoint().y - 430;
			camFollow.x = dad.getMidpoint().x - 100;
		case 'senpai-angry':
			camFollow.y = dad.getMidpoint().y - 430;
			camFollow.x = dad.getMidpoint().x - 100;
	}

	if (dad.curCharacter == 'mom')
		vocals.volume = 1;
}

if (PlayState.SONG.notes[Std.int(curStep / 16)].mustHitSection && camFollow.x != boyfriend.getMidpoint().x - 100)
{
	var offsetX = 0;
	var offsetY = 0;
	#if windows
	if (luaModchart != null)
	{
		offsetX = luaModchart.getVar("followXOffset", "float");
		offsetY = luaModchart.getVar("followYOffset", "float");
	}
	#end
	camFollow.setPosition(boyfriend.getMidpoint().x - 100 + offsetX, boyfriend.getMidpoint().y - 100 + offsetY);

	#if windows
	if (luaModchart != null)
		luaModchart.executeState('playerOneTurn', []);
	#end

	switch (curStage)
	{
		case 'limo':
			camFollow.x = boyfriend.getMidpoint().x - 300;
		case 'mall':
			camFollow.y = boyfriend.getMidpoint().y - 200;
		case 'school':
			camFollow.x = boyfriend.getMidpoint().x - 200;
			camFollow.y = boyfriend.getMidpoint().y - 200;
		case 'schoolEvil':
			camFollow.x = boyfriend.getMidpoint().x - 200;
			camFollow.y = boyfriend.getMidpoint().y - 200;
	}
}		
```

For:

```haxe
getCamOffsets();

if (generatedMusic && PlayState.SONG.notes[Std.int(curStep / 16)] != null)
{
	#if windows
	if (luaModchart != null)
			luaModchart.setVar("mustHit", PlayState.SONG.notes[Std.int(curStep / 16)].mustHitSection);
	#end

	if (camFollow.x != dadPos[0] && !PlayState.SONG.notes[Std.int(curStep / 16)].mustHitSection)
	{
		camFollow.setPosition(dadPos[0], dadPos[1]);

		#if windows
		if (luaModchart != null)
			luaModchart.executeState('playerTwoTurn', []);
		#end
	}

	if (camFollow.x != bfPos[0] && PlayState.SONG.notes[Std.int(curStep / 16)].mustHitSection)
	{
		camFollow.setPosition(bfPos[0], bfPos[1]);

		#if windows
		if (luaModchart != null)
			luaModchart.executeState('playerOneTurn', []);
		#end
	}	
}
```

### 3. Add Parallax Effect Code (Finally Goddamn)

Above `var curLight:Int = 0;` (Whole Bottom of PlayState.hx) add:

```haxe
var camLerp:Float = 0.4;
var camFocus:String = "";
var camMovement:FlxTween;
var daFunneOffsetMultiplier:Float = 27;

var dadPos:Array<Float> = [0, 0];
var bfPos:Array<Float> = [0, 0];

function triggerCamMovement(num:Float = 0)
{
	camMovement.cancel();

	if (camFocus == 'bf')
	{
		switch (num)
		{
			case 2:
				camMovement = FlxTween.tween(camFollow, {y: bfPos[1] - daFunneOffsetMultiplier, x: bfPos[0]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
			case 3:
				camMovement = FlxTween.tween(camFollow, {x: bfPos[0] + daFunneOffsetMultiplier, y: bfPos[1]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
			case 1:
				camMovement = FlxTween.tween(camFollow, {y: bfPos[1] + daFunneOffsetMultiplier, x: bfPos[0]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
			case 0:
				camMovement = FlxTween.tween(camFollow, {x: bfPos[0] - daFunneOffsetMultiplier, y: bfPos[1]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
		}
	}
	else
	{
		switch (num)
		{
			case 2:
				camMovement = FlxTween.tween(camFollow, {y: dadPos[1] - daFunneOffsetMultiplier, x: dadPos[0]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
			case 3:
				camMovement = FlxTween.tween(camFollow, {x: dadPos[0] + daFunneOffsetMultiplier, y: dadPos[1]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
			case 1:
				camMovement = FlxTween.tween(camFollow, {y: dadPos[1] + daFunneOffsetMultiplier, x: dadPos[0]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
			case 0:
				camMovement = FlxTween.tween(camFollow, {x: dadPos[0] - daFunneOffsetMultiplier, y: dadPos[1]}, Conductor.crochet / 10000,
					{ease: FlxEase.circIn});
		}
	}
}

function getCamOffsets()
{
	dadPos[0] = dad.getMidpoint().x + 150 + dad.camOffset[0];
	dadPos[1] = dad.getMidpoint().y - 100 + dad.camOffset[1];

	bfPos[0] = boyfriend.getMidpoint().x - 100 + boyfriend.camOffset[0];
	bfPos[1] = boyfriend.getMidpoint().y - 100 + boyfriend.camOffset[1];
}
```

### 4. Call Da Functions

Below:

```haxe
switch (Math.abs(daNote.noteData))
{
	case 2:
		dad.playAnim('singUP' + altAnim, true);
	case 3:
		dad.playAnim('singRIGHT' + altAnim, true);
	case 1:
		dad.playAnim('singDOWN' + altAnim, true);
	case 0:
		dad.playAnim('singLEFT' + altAnim, true);
}
```

Add:

```haxe
if (camFocus == "dad")
	triggerCamMovement(Math.abs(daNote.noteData % 4));
```

Now Below:

```haxe
switch (direction)
{
	case 0:
		boyfriend.playAnim('singLEFTmiss', true);
	case 1:
		boyfriend.playAnim('singDOWNmiss', true);
	case 2:
		boyfriend.playAnim('singUPmiss', true);
	case 3:
		boyfriend.playAnim('singRIGHTmiss', true);
}
```

Add:

```haxe
if (camFocus == "bf")
	triggerCamMovement(direction % 4);
```

nOw bEloW:

```haxe
switch (note.noteData)
{
	case 2:
		boyfriend.playAnim('singUP', true);
	case 3:
		boyfriend.playAnim('singRIGHT', true);
	case 1:
		boyfriend.playAnim('singDOWN', true);
	case 0:
		boyfriend.playAnim('singLEFT', true);
}
```

aDd:

```haxe
if (camFocus == "bf")
	triggerCamMovement(note.noteData % 4);
```