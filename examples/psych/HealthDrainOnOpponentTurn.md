# How to Make the Opponent Drain Your Health if It's Their Turn (Psych)

### 1 Edit `PlayState.hx`

on `function opponentNoteHit(note:Note):Void`
Below `var animToPlay:String = singAnimations[Std.int(Math.abs(note.noteData))] + altAnim;`

Add:

```haxe
health -= 0.003;
```

- If u Want One Specific Character to Drain Health Do This:

```haxe
if (dad.curCharacter == 'charactername')
    health -= 0.003;
```