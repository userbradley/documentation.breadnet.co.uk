---
title: Enforce English Subtitles and Audio Tracks using mkvmerge
---

## Why

If for example you get an mkv file that has additional soundtracks and subtitles in it, but you do not care for them
(eg: You only speak English and will never use other variants) it's worth while removing the additional tracks

## How

### Install mkvmerge

```shell
brew install mkvtoolnix
```

* [Homebrew Formulae](https://formulae.brew.sh/formula/mkvtoolnix)
* [mkvmerge homepage](https://mkvtoolnix.download)

### Command

`mkvmerge` accepts some inputs we need to change

* `-o`: This is the output file
* `--audio-tracks`: What Audio track to Preserve
* `--subtitle-tracks`: What subtitle track to Preserve

An example file named `Mr.Inbetween.S03E05.Prima.che.andassi.in.guerra.ITA.ENG.1080p.AMZN.WEB-DL.DDP5.1.H.264-MeM.GP.mkv`, we can remove the other tracks and then rename it to `Mr.Inbetween.S03E05.mkv` using the below

```shell
mkvmerge \
-o Mr.Inbetween.S03E05.mkv
--audio-tracks eng
--subtitle-tracks eng
Mr.Inbetween.S03E05.Prima.che.andassi.in.guerra.ITA.ENG.1080p.AMZN.WEB-DL.DDP5.1.H.264-MeM.GP.mkv
```
