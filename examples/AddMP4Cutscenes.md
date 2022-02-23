# Adding MP4 Cutscenes
**BORROWED FROM THE README LOL**

### 1. Download The MP4 Shit
Download The [MP4 Support Repository](https://github.com/brightfyregit/Friday-Night-Funkin-Mp4-Video-Support)
And Add Every File on It's Respective Folder

### 2. Edit `Project.xml`

Above:

```xml
<assets path="assets/preload"  rename="assets"  exclude="*.ogg" if="web"/>
```

Add:

```xml
<assets path="assets/preload/videos" rename="assets/videos" include="*mp4" embed='false'/>

<assets path="assets/videos" exclude="*.mp3" if="web"/>
<assets path="assets/videos" exclude="*.ogg" unless="web"/>

<assets path="plugins/" rename='' if="windows"/>
<assets path="dlls/" rename='' if="windows"/>
```

### 3. Edit `Paths.hx`
Anywhere Below the Class, Add:

```haxe
inline static public function video(key:String, ?library:String)
{
	return getPath('videos/$key.mp4', BINARY, library);
}
```

### 4. Adding Play Cutscene Functions
First, add (if it doesn't exists) at The Top of PlayState.hx:

```haxe
var isCutscene:Bool = false;
```

Add This Above `var curLight:Int = 0;`

```haxe
var video:MP4Handler;

function playStartCutscene(name:String)
{
	inCutscene = true;

	video = new MP4Handler();
	video.finishCallback = function()
	{
		startCountdown();
	}

	video.playVideo(Paths.video(name));
}

function playEndCutscene(name:String)
{
	inCutscene = true;

	video = new MP4Handler();
	video.finishCallback = function()
	{
		SONG = Song.loadFromJson(storyPlaylist[0].toLowerCase());
		LoadingState.loadAndSwitchState(new PlayState());
	}

	video.playVideo(Paths.video(name));
}
```

### 5. Play Cutscene
- Play Start Cutscene

Find This Somewhere on PlayState.hx `override function create()`
And Edit It Like This

```haxe
switch (curSong.toLowerCase())
{
	case 'bopeebo':
		playStartCutscene('bopeeboStart');
	case 'fresh':
		playStartCutscene('freshStart');
	case 'dad-battle':
		playStartCutscene('dadBattleStart');
	default:
		startCountdown();
}
```

-  Play End Cutscene

Add This on PlayState.hx `endSong()` function

```haxe
if (curSong.toLowerCase() == 'bopeebo')
	playEndCutscene('bopeeboEnd');
else if (curSong.toLowerCase() == 'fresh')
	playEndCutscene('freshEnd');
else if (curSong.toLowerCase() == 'dad-battle')
	playEndCutscene('dadBattleEnd');
```

### Should Look Like This (endSong Cutscene)

```haxe
else
{
	var difficulty:String = "";

	if (storyDifficulty == 0)
		difficulty = '-easy';

	if (storyDifficulty == 2)
		difficulty = '-hard';

	trace('LOADING NEXT SONG');
	trace(PlayState.storyPlaylist[0].toLowerCase() + difficulty);					

	prevCamFollow = camFollow;
	
	if (curSong.toLowerCase() == 'bopeebo')
	    playEndCutscene('bopeeboEnd');
    else if (curSong.toLowerCase() == 'fresh')
	    playEndCutscene('freshEnd');
    else if (curSong.toLowerCase() == 'dad-battle')
	    playEndCutscene('dadBattleEnd');
```


