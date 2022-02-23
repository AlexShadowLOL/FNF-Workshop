# Adding A New Week (Vanilla, Kade Supported)

### 1. Add Your Songs

Replace The WeekData Array For This:

```haxe
var weekData:Array<Dynamic> = [
	['Song-Name', 'Song-Name', 'Song-Name'] // do the same process if u wanna add more songs
];
```

**IF U WANNA ADD ANOTHER WEEK, BE SURE TO PUT A COMMA AFTER THE ] OF THE LAST ONE**

EX:

```haxe
var weekData:Array<Dynamic> = [
	['Song-Name', 'Song-Name', 'Song-Name'],
    ['Song-Name', 'Song-Name', 'Song-Name']
];
```

### 2. Unlock The Week (OPTIONAL)

Replace the weekUnlocked Array For This:

```haxe
public static var weekUnlocked:Array<Bool> = [
	true
];
```

**IF U ADD ANOTHER WEEK ADD THIS**

```haxe
public static var weekUnlocked:Array<Bool> = [
	true,
    true
];
```

### 3. Add Your Story Week Character

Replace The weekCharacter Array For This:

```haxe
var weekCharacters:Array<Dynamic> = [
	['dad', 'bf', 'gf'] // these are by default
];
```

**IF U ADD ANOTHER WEEK ADD THIS**

```haxe
var weekCharacters:Array<Dynamic> = [
	['dad', 'bf', 'gf'],
    ['dad', 'bf', 'gf']
];
```

### 4. Add Your Week Name (OPTIONAL)

Replace The weekNames Array For This:

```haxe
var weekNames:Array<String> = [
	"DADDY DEAREST" // Leave In Black (" ") If u Don't Want a Week Name
];
```

```haxe
var weekNames:Array<String> = [
	"DADDY DEAREST",
    "DADDY DEAREST"
];
```