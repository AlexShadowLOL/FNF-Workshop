# Making a Custom "Now Playing: Song" Box

### 1. Make Your Image

Draw it And Everything and Put Your Song Name And Composer, etc. (make multiple boxes if u have more songs)

### 2. Adding the Image

Same as Adding a Sprite (check AddingASprite.md)

But, Replace `curSongBox = new FlxSprite(xAxis, yAxis).loadGraphic(Paths.image('replace this for you image path'));`

with:

```haxe
switch (curSong.toLowerCase())
{
    case 'bopeebo':
        curSongBox = new FlxSprite(xAxis, yAxis).loadGraphic(Paths.image('replace this for you box image path with the respective name'));
    case 'fresh':
        curSongBox = new FlxSprite(xAxis, yAxis).loadGraphic(Paths.image('replace this for you box image path with the respective name'));
    case 'dad-battle':
        curSongBox = new FlxSprite(xAxis, yAxis).loadGraphic(Paths.image('replace this for you box image path with the respective name'));
}
```

### 3. Add a Function

Below The Whole `startCountdown` function
Add:

```haxe
function nowPlayingCurSong()
{
    // goes in
	FlxTween.tween(curSongBox, {x: curSongBox.x + 300}, 1); // adjust the start movement value if u want

    // goes away
	new FlxTimer().start(2.5, function(tmr:FlxTimer)
	{
		FlxTween.tween(curSongBox, {x: curSongBox.x}, 2); // adjust the end movement value if u want
	});
}
```

### 4. Call the Function on Song Start

Below `function startSong():Void` Add:

```haxe
nowPlayingCurSong();
```

- Should Kinda Look Like This:

```haxe
function startSong():Void
{
	startingSong = false;
	songStarted = true;
	previousFrameTime = FlxG.game.ticks;
	lastReportedPlayheadPosition = 0;

    nowPlayingCurSong();

    // more function code here...
```