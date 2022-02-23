# Adding Healthbar Colors Based on curCharacter

### 1. Edit `Character.hx`

Add `public static var iconColor:FlxColor;` at The Top of The Class

Now, On BF/Your Custom Character Code, Add: `iconColor = 0x2A8CBD;` (change the hex color if u want)

### 2. Edit `PlayState.hx`

Replace:

```haxe
healthBar.createFilledBar(0xFFFF0000, 0xFF66FF33);
```

with

```haxe
healthBar.createFilledBar(dad.iconColor, bf.iconColor);
```