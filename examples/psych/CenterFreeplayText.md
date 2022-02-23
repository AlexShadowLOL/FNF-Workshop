# How to Set The Freeplay Song Text at The Center of The Screen

### 1. Edit `Alphabet.hx`

Anywhere on the `override function update(elapsed:Float)` 
Add:

```haxe
screenCenter(X);
```

**WARNING: THIS CHANGE WILL APPLY TO EVERY TEXT THAT USES ALPHABET**