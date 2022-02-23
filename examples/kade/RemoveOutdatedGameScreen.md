# How to Remove the "Outdated Game" Screen on Kade

### 1. Edit `TitleState.hx`

Replace

```haxe
if (!MainMenuState.kadeEngineVer.contains(returnedData[0].trim()) && !OutdatedSubState.leftState && MainMenuState.nightly == "")
{
	trace('outdated lmao! ' + returnedData[0] + ' != ' + MainMenuState.kadeEngineVer);
	OutdatedSubState.needVer = returnedData[0];
	OutdatedSubState.currChanges = returnedData[1];
	FlxG.switchState(new OutdatedSubState());
}
else
{
	FlxG.switchState(new MainMenuState());
}
```

With:

```haxe
FlxG.switchState(new MainMenuState());
```