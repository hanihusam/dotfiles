# Zain's personal dotfiles

If you are not familiar with what dotfiles are, you can read [this article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) about them.

My dotfiles setup is heavily inspired by [Dries Vints'](https://github.com/driesvints) [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/).

## Dependencies

- [yadm](https://yadm.io) to manage the installation of these dotfiles into my local machine.
- [Zinit](https://zdharma.github.io/zinit/wiki/) to manage the Zsh plugins.

## Preview

### Before improvements

![zsh benchmark before improvements](https://user-images.githubusercontent.com/6315466/115205892-9a0b5900-a12c-11eb-96a9-52fc6dd9469f.gif)

### After improvements

![zsh benchmark after improvements](https://user-images.githubusercontent.com/6315466/115155860-4c530a00-a0b4-11eb-8756-089ddef6a7c1.gif)

## How to use

1. Clone this repository

   ```shell
   $ git clone git@github.com:zainfathoni/dotfiles.git $HOME/.dotfiles
   ```

2. Run `setup.sh`

   ```shell
   $ cd $HOME/.dotfiles
   $ ./setup.sh
   ```

3. Follow the instructions preceded by ⚠️ emoji. e.g.,

   ```shell
   ⚠️ Install the recommended fonts for Powerlevel10k theme from assets/fonts folder
   ```

### Backup Applications Preferences using mackup

```shell
mackup backup
```

### Restore Applications Preferences using mackup

```shell
mackup restore
```

## Maintaining this dotfiles

1. When installing a new app, tool or font, try to install it with Homebrew and add it to the `Brewfile`
2. When configuring a new app make sure to run `mackup backup -f` to save the preferences
3. When changing a macOS setting, try setting it through the `macos` file
4. Always save documents through a cloud storage like iCloud, Dropbox, or something else

## References

- [SSH generation](https://github.com/kentcdodds/dotfiles/blob/main/.macos)
- [zsh benchmark](https://github.com/ri7nz/.dotifiles/blob/master/scripts/bin/benchmark-zsh)
- [mackup usage](https://github.com/lra/mackup#usage)
