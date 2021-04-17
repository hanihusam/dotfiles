# Zain's personal dotfiles

If you are not familiar with what dotfiles are, you can read [this article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) about them.

My dotfiles setup is heavily inspired by [Dries Vints'](https://github.com/driesvints) [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/).

I use [dotbot](https://github.com/anishathalye/dotbot/) as a [Git Submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to easily install the necessary dotfiles through symlink.

## Preview

![benchmark zsh](https://user-images.githubusercontent.com/6315466/115122050-72ab7380-9fe8-11eb-9bde-d74e01bdee53.gif)

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
