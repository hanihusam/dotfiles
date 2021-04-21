# Zain's personal dotfiles

If you are not familiar with what dotfiles are, you can read [this article](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) about them.

My dotfiles setup is heavily inspired by [Dries Vints'](https://github.com/driesvints) [Getting Started with Dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/).

## Dependencies

- [yadm](https://yadm.io) to manage the installation of these dotfiles into my local machine.
- [Zinit](https://zdharma.github.io/zinit/wiki/) to manage the Zsh plugins.

## Background story

I have been using dotfiles for quite some time, but the setup was not ideal because back then I was a newbie in the UNIX ecosystem.
Here are the things that I resent from my previous setup:

1. Slow performance. See the [Zsh benchmark before improvements](#before-improvements) below.
2. Exposed secrets. I was a newbie, so I didn't have a clear idea about what should be hidden from the user of my dotfiles. Even if I knew, I didn't know how I could hide them properly. That's the reason I'm unable to make my old dotfiles repository public.
3. Limited coverage. It didn't cover [things that I still had to do manually](https://github.com/zainfathoni/macOS-Initial-Setup), such as installing apps.

### Zsh benchmark

#### Before improvements

![zsh benchmark before improvements](https://user-images.githubusercontent.com/6315466/115213496-25d4b380-a134-11eb-81ef-500efcc794b5.gif)

#### After improvements

![zsh benchmark after improvements](https://user-images.githubusercontent.com/6315466/115155860-4c530a00-a0b4-11eb-8756-089ddef6a7c1.gif)

## How to use

1. Install yadm using Homebrew and clone this repository.

   ```shell
   $ brew install yadm
   ==> Downloading https://github.com/TheLocehiliosan/yadm/archive/3.1.0.tar.gz
   ==> Downloading from https://codeload.github.com/TheLocehiliosan/yadm/tar.gz/3.1.0
   ==> make install PREFIX=/usr/local/Cellar/yadm/3.1.0
   ==> Caveats
   zsh completions have been installed to:
     /usr/local/share/zsh/site-functions
   ==> Summary
   🍺  /usr/local/Cellar/yadm/3.1.0: 21 files, 194.7KB, built in 6 seconds

   $ yadm clone git@github.com:zainfathoni/dotfiles.git
   Cloning into 'repo.git'...
   remote: Enumerating objects: 527, done.
   remote: Counting objects: 100% (527/527), done.
   remote: Compressing objects: 100% (326/326), done.
   remote: Total 527 (delta 292), reused 388 (delta 163), pack-reused 0
   Receiving objects: 100% (527/527), 1.32 MiB | 1.21 MiB/s, done.
   Resolving deltas: 100% (292/292), done.
   **NOTE**
   Local files with content that differs from the ones just
   cloned were found in /Users/zain. They have been left
   unmodified.

   Please review and resolve any differences appropriately.
   If you know what you're doing, and want to overwrite the
   tracked files, consider 'yadm checkout "/Users/zain"'.

   Found /Users/zain/.config/yadm/bootstrap
   It appears that a bootstrap program exists.
   Would you like to execute it now? (y/n)
   y

   ...

   ```

2. Run `yadm bootstrap` if it's not run automatically.

   ```shell
   $ yadm bootstrap
   ```

3. Compare your files that are managed by yadm and update them accordingly.

   ```shell
   $ yadm status
   On branch main
   Your branch is up to date with 'origin/main'.

   Changes not staged for commit:
   (use "git add <file>..." to update what will be committed)
   (use "git restore <file>..." to discard changes in working directory)
      typechange: .hushlogin
      typechange: .ssh/config
      typechange: .zshrc

   no changes added to commit (use "git add" and/or "git commit -a")

   $ yadm checkout HEAD -- .hushlogin .ssh/config .zshrc

   $ yadm status
   On branch main
   Your branch is up to date with 'origin/main'.

   nothing to commit, working tree clean
   ```

4. Import your GPG secret & public keys into GPG Suite.
   GPG Suite app should have been installed by the `yadm bootstrap` command above.
   You can import the keys by [copying them from wherever you're storing them and pasting them to the GPG Keychain app](https://gpgtools.tenderapp.com/kb/gpg-keychain-faq/how-to-find-public-keys-of-your-friends-and-import-them).

5. Decrypt encrypted files

   ```shell
   $ yadm decrypt
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
2. When configuring a new app make sure to run `mackup backup` to save the preferences
3. When changing a macOS setting, try setting it through the `macos` file
4. Always save documents through a cloud storage like iCloud, Dropbox, or something else

## References

- [SSH generation](https://github.com/kentcdodds/dotfiles/blob/main/.macos)
- [zsh benchmark](https://github.com/ri7nz/.dotifiles/blob/master/scripts/bin/benchmark-zsh)
- [mackup usage](https://github.com/lra/mackup#usage)
