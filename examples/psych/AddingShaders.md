# How to Add Shaders on Psych Engine

### 1. Download my Shaders.hx File on the extraMDStuff folder in the repo & Add It to Your source folder with the other .hx files

### 2. Edit PlayState.hx
Below `package;` add:

```haxe
import Shaders;
```
after that go in the section with the other variables and initialize the shader variable (in this case we will eb adding the chromatic aberration shader)

```haxe
var chromAberration:ChromaticAberrationEffect = new ChromaticAberrationEffect();
```

then now go anywhere in the `override function create()` function and add this:

```haxe
camGame.setFilters([new ShaderFilter(chromAberration.shader)]);
camHUD.setFilters([new ShaderFilter(chromAberration.shader)]);

chromAberration.setChrome(0.004);
```

**IF YOU WANT IT TO BE LESS INTENSE OR MORE INTENSE THEN MAKE A HIGHER OR LOWER NUMBER DEPENDING OF HOW INTENSE YOU WANT IT TO BE**

Done :D