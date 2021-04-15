# Zain's personal dotfiles

If you are not familiar with what dotfiles are, you can read [this article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) about them.

My dotfiles setup is heavily inspired by [Dries Vints'](https://github.com/driesvints) [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/).

I use [dotbot](https://github.com/anishathalye/dotbot/) as a [Git Submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to easily install the necessary dotfiles through symlink.

## Preview

![zsh benchmark preview](https://user-images.githubusercontent.com/6315466/114795510-48c43800-9dc1-11eb-9174-8f16ae29e381.gif)

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

## References

- [SSH generation](https://github.com/kentcdodds/dotfiles/blob/main/.macos)
- [zsh benchmark](https://github.com/ri7nz/.dotifiles/blob/master/scripts/bin/benchmark-zsh)
