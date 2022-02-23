# How to Click Something With Your Mouse

### 1. Make The Mouse Visible

Anywhere on The `override function create()` of your state
Add:

```haxe
FlxG.mouse.visible = true;
```

### 2. Add The Code (No Shit Sherlock)

Now Anywhere on `override function update(elapsed:Float)`
Add:

```haxe
if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(sprite))
{
    // your code here
}
```

**Sprite Should be Your Sprite Variable Name**

EX:

If

```haxe
var iLoveDogs:FlxSprite;
```

Then

```haxe
if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(iLoveDogs))
{
    FlxG.switchState(new MainMenuState());
}
```