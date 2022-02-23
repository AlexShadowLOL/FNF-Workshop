# How to Remove the "Outdated Game" Screen on Psych

### 1. Edit `TitleState.hx`

Replace

```haxe
if (mustUpdate) {
    MusicBeatState.switchState(new OutdatedState());
} else {
    MusicBeatState.switchState(new MainMenuState());
}
closedState = true;
```

With:

```haxe
MusicBeatState.switchState(new MainMenuState());
closedState = true;
```