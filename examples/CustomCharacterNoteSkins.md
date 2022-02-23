# Adding Custom Character Note Skins (Non Pixel)

### 1. Adding & Editing Image Paths

Add on **Shared** Folder a new Folder Called **notes**
On There, Move `NOTE_assets.png` to That Folder and Rename it To `normal.png`

- PlayState.hx

on The `generateStaticArrows` function
Replace `normal` & `default` Cases Image Paths With:

```haxe
if (player == 0) {
	babyArrow.frames = Paths.getSparrowAtlas('notes/' + dad.noteSkin, 'shared');
}
else {
	babyArrow.frames = Paths.getSparrowAtlas('notes/' + boyfriend.noteSkin, 'shared');
}
```

- Note.hx

Add/Replace the whole `public var noteType` variable with `public var noteType:String = 'normal';`

Now Replace the Whole

`public function new`

with

`public function new(strumTime:Float, noteData:Int, ?prevNote:Note, ?sustainNote:Bool = false, ?noteType:String = 'normal', ?noteSkin:String = 'normal')`

**NOTE: CHANGE IT TO THIS IF U GET A "Unknown Identifier: inCharter" ERROR WHEN COMPILING**

`public function new(strumTime:Float, noteData:Int, ?prevNote:Note, ?sustainNote:Bool = false, ?noteType:String = 'normal', ?inCharter, ?noteSkin:String = 'normal')`

now Replace the

`frames = Paths.getSparrowAtlas` line on the `default:` case

with

`frames = Paths.getSparrowAtlas('notes/' + noteSkin, 'shared');`

### 2. Changing up Non-Sustain/Sustain Note Code

on PlayState.hx

Replace

```haxe
var sustainNote:Note = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true);
```

with:

```haxe
var sustainNote:Note;

if (gottaHitNote)
{
	sustainNote = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true, daType, boyfriend.noteSkin);
}
else
{
	sustainNote = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + Conductor.stepCrochet, daNoteData, oldNote, true, daType, dad.noteSkin);
}
```

Now Replace

```haxe
var swagNote:Note = new Note(daStrumTime, daNoteData, oldNote);
```

with:

```haxe
var daType = songNotes[3];
var swagNote:Note;
					
if (gottaHitNote)
{
	swagNote = new Note(daStrumTime, daNoteData, oldNote, false, daType, boyfriend.noteSkin);
}
else
{
	swagNote = new Note(daStrumTime, daNoteData, oldNote, false, daType, dad.noteSkin);
}
```

### 3. Setting Character NoteSkin

- Character.hx

Add This With the Other Variables at The Top
`public var noteSkin:String = 'normal';`

Now, Add This On Your Character Code: `noteSkin = 'bf';`

- 'bf' should be the noteSkin image name, basically in shared (apart from the normal.png, dont delete that) there should also be a image named `bf.png` (`dad.png` for dad)

## EX With BF & DAD:

```haxe
case 'bf':
	var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
	noteSkin = 'bf'; // noteskin
	frames = tex;

	trace(tex.frames.length);

	animation.addByPrefix('idle', 'BF idle dance', 24, false);
	animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
	animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
	animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
	animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
	animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
	animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
	animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
	animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	animation.addByPrefix('hey', 'BF HEY', 24, false);

	animation.addByPrefix('firstDeath', "BF dies", 24, false);
	animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
	animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

	animation.addByPrefix('scared', 'BF idle shaking', 24);

	addOffset('idle', -5);
	addOffset("singUP", -29, 27);
	addOffset("singRIGHT", -38, -7);
	addOffset("singLEFT", 12, -6);
	addOffset("singDOWN", -10, -50);
	addOffset("singUPmiss", -29, 27);
	addOffset("singRIGHTmiss", -30, 21);
	addOffset("singLEFTmiss", 12, 24);
	addOffset("singDOWNmiss", -11, -19);
	addOffset("hey", 7, 4);
	addOffset('firstDeath', 37, 11);
	addOffset('deathLoop', 37, 5);
	addOffset('deathConfirm', 37, 69);
	addOffset('scared', -4);

	playAnim('idle');

	flipX = true;

case 'dad':
	// DAD ANIMATION LOADING CODE
	tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
	noteSkin = 'dad'; // noteskin
	frames = tex;

	animation.addByPrefix('idle', 'Dad idle dance', 24);
	animation.addByPrefix('singUP', 'Dad Sing Note UP', 24);
	animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24);
	animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24);
	animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24);

	addOffset('idle');
	addOffset("singUP", -6, 50);
	addOffset("singRIGHT", 0, 27);
	addOffset("singLEFT", -10, 10);
	addOffset("singDOWN", 0, -30);

	playAnim('idle');
```

