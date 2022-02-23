# How to Make a Unlockable Song on Freeplay After Beating a Week (Kade Only)

### 1. Edit `KadeEngineData.hx`

Anywhere on the `initSave()` function
Add:

```haxe
if (FlxG.save.data.unlockedSong == null)
    FlxG.save.data.unlockedSong = false;
```

### 2. Edit `PlayState.hx`

Replace the `FlxG.save.flush();` of The `if (isStoryMode)` If Statement of The `endSong()` function
With:

```haxe
if (curSong.toLowerCase() == 'your-song-name-in-lowercase')
{
    FlxG.save.data.unlockedSong = true;
    FlxG.save.flush();
}
else
{
    FlxG.save.flush();
}
```

### 3. Make a Separated `freeplaySongList.txt` File

on `assets/preload/data`, Make a Copy of the `freeplaySongList.txt` File
And Rename it To `unlockedFreeplaySongList.txt` And Edit The File Content and Add Your 4th Song

### 4. Edit `FreeplayState.hx`

On FreeplayState.hx, Replace the Line:

```haxe
var initSongList = CoolUtil.coolTextFile(Paths.txt('freeplaySongList'));
```

With:

```haxe
if (!FlxG.save.data.unlockedSong)
{
    var initSongList = CoolUtil.coolTextFile(Paths.txt('freeplaySongList'));
}
else
{
    var initSongList = CoolUtil.coolTextFile(Paths.txt('unlockedFreeplaySongList'));
}
```