# How to Make CPU (Opponent) Strums Invisible on a Song

### 1. Edit `PlayState.hx`

Replace

```haxe
switch (player)
{
	case 0:
		cpuStrums.add(babyArrow);
	case 1:
		playerStrums.add(babyArrow);
}
```

With:

```haxe
if (curSong.toLowerCase() == 'your-song-name-in-lowercase')
{
	switch (player)
	{
		case 0:
			babyArrow.visible = false;
			cpuStrums.add(babyArrow);
		case 1:
			playerStrums.add(babyArrow);
	}
}
else
{
    switch (player)
    {
        case 0:
            cpuStrums.add(babyArrow):
        case 1:
            playerStrums.add(babyArrow):
    }
}
```