# FlxTween Examples

### Tweening an Object's Opacity

- Method:

```haxe
FlxTween.tween(Sprite:FlxSprite, {Alpha:Float}, Duration:Float);
```

EX:

```haxe
FlxTween.tween(mySweetTea, {alpha: 0.1}, 2);
``` 

**Warning: The Sprite Variable Should be Set at The Top of The State or else It Will Give You an "Unknown Identifier" Error When Compiling**

### Tweening an Object's Position

- Method:

```haxe
FlxTween.tween(Sprite:FlxSprite, {X:Float, Y:Float}, Duration:Float);
```

EX:

```haxe
FlxTween.tween(mySweetTea, {x: 300, y: -200}, 2);
``` 

**Warning: The Sprite Variable Should be Set at The Top of The State or else It Will Give You an "Unknown Identifier" Error When Compiling**

### Tweening an Object's Angle

- Method:

```haxe
FlxTween.tween(Sprite:FlxSprite, {FromAngle:Float, ToAngle:Float}, Duration:Float);
```

EX:

```haxe
FlxTween.tween(mySweetTea, {FromAngle: 180, ToAngle: 90}, 2);
``` 

**Warning: The Sprite Variable Should be Set at The Top of The State or else It Will Give You an "Unknown Identifier" Error When Compiling**

### Tweening an Object's Color

- Method:

```haxe
FlxTween.tween(Sprite:FlxSprite, Duration:Float, FromColor:FlxColor, ToColor:FlxColor);
```

EX:

```haxe
FlxTween.tween(mySweetTea, 2, FromColor:0x000000, ToColor:0xFFFFFF);
``` 

- You Can Also Do:

```haxe
FlxTween.tween(mySweetTea, 2, FromColor:FlxColor.fromRBG(255, 255, 255), ToColor:FlxColor.fromRBG(0, 255, 0));
``` 

**Warning: The Sprite Variable Should be Set at The Top of The State or else It Will Give You an "Unknown Identifier" Error When Compiling**