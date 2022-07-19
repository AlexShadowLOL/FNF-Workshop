# Changing Application Name in Kade Engine

### 1. Add This on Any State You Want
first we import our shit if its not imported:

`import openfl.Lib;`

Now Anywhere on the `override function create()` function add this:

**LETS SAY WE WANT TO CHANGE IT LIKE INDIE CROSS ON EVERY SONG**

Ex: Imminent Demise (add the code in playstate.hx)
```haxe
Lib.application.window.title = "Indie Cross - Saru & CDMusic - " + SONG.song + "[" + CoolUtil.difficultyString() + "]";
```