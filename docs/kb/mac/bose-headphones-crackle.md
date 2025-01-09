---
title: Bose Headphones Crackle when connected to mac via bluetooth
---

# Bose Headphones Crackle when connected to mac via bluetooth

As a first step, try only connecting the headphones to your Mac, and not another device like your phone.

## Update the defaults

```shell
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 48
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 40
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 40
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 58
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 58
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 48
```

## Kill bluetoothd

```shell
sudo pkill bluetoothd
```

## Still crackling?

```shell
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80
```

followed by

```shell
sudo pkill bluetoothd
```

## See your defaults

```shell
defaults read com.apple.BluetoothAudioAgent
```

## Sources

* [Lifehacker.com](https://lifehacker.com/fix-your-bluetooth-audio-in-yosemite-with-this-terminal-1670380974)
* [Stack Exchange](https://apple.stackexchange.com/questions/167245/yosemite-bluetooth-audio-is-choppy-skips/179209#179209)

## Still not fixed

=== "Intel Mac"

    [Reset Pram](https://www.guidingtech.com/30498/what-is-pram-smc-mac-reset/)

=== "M1 Mac"

    !!! note "You will need another mac"
        This is because it needs to use the applie configurator package
    [Restore firmware](https://support.apple.com/en-in/guide/apple-configurator-mac/apdd5f3c75ad/mac)
