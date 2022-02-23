# How to Make the Opponent Drain Your Health if It's Their Turn (Psych)

### 1 Edit `PlayState.hx`

Replace:

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

With:

```haxe
switch (Math.abs(daNote.noteData))
{
	case 2:
		dad.playAnim('singUP' + altAnim, true);
        health -= 0.003;
	case 3:
		dad.playAnim('singRIGHT' + altAnim, true);
        health -= 0.003;
	case 1:
		dad.playAnim('singDOWN' + altAnim, true);
        health -= 0.003;
	case 0:
		dad.playAnim('singLEFT' + altAnim, true);
        health -= 0.003;
}
```

- If u Want One Specific Character to Drain Health Replace it For This:

```haxe
switch (Math.abs(daNote.noteData))
{
	case 2:
		dad.playAnim('singUP' + altAnim, true);
        if (dad.curCharacter == 'charactername')
            health -= 0.003;
	case 3:
		dad.playAnim('singRIGHT' + altAnim, true);
        if (dad.curCharacter == 'charactername')
            health -= 0.003;
	case 1:
		dad.playAnim('singDOWN' + altAnim, true);
        if (dad.curCharacter == 'charactername')
            health -= 0.003;
	case 0:
		dad.playAnim('singLEFT' + altAnim, true);
        if (dad.curCharacter == 'charactername')
            health -= 0.003;
}
```