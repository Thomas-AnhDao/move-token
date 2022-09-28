# Aptos SOTA Token

```
aptos move publish
```

initialize
```
aptos move run --private-key=<private-key> --function-id=0x3de5204951b436b3892a8bb40f742c0a359ad7ad0e84f3e4990809042e54fbbd::sotatoken::initialize
```

register
```
aptos move run --private-key=<private-key> --function-id=0x3de5204951b436b3892a8bb40f742c0a359ad7ad0e84f3e4990809042e54fbbd::sotatoken::register
```

mint
```
aptos move run --private-key=<private-key> --function-id=0x3de5204951b436b3892a8bb40f742c0a359ad7ad0e84f3e4990809042e54fbbd::sotatoken::mint --args address:0xef9e7bf51e66519d830ab4533241ff4102d01cba3a17e4aee68dff7d0c2c269e u64:1000000000
```

TO-DO: burn
```
aptos move run --private-key=<private-key> --function-id=0x70a51ea24f5432034a1504201a7c6f3dad5b7e6c5de4dfec4f22e527a9354202::sotatoken::burn
```

transfer:
```
aptos move run --private-key=<private-key> --function-id=0x3de5204951b436b3892a8bb40f742c0a359ad7ad0e84f3e4990809042e54fbbd::sotatoken::transfer --args address:0xef9e7bf51e66519d830ab4533241ff4102d01cba3a17e4aee68dff7d0c2c269e u64:50000000
```
