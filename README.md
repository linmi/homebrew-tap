# Homebrew tap for Meso

```sh
brew install linmi/tap/meso
```

Installing it by its full name also tells Homebrew to trust this cask, so later `brew info meso`,
`brew uninstall meso` and the like work with the short name.

Meso updates itself (Sparkle), so `brew upgrade` leaves it alone unless you pass `--greedy`.
The cask follows stable releases only; betas come through Meso's own Beta channel (Settings › Updates).
Release notes: https://meso.ac/releases
