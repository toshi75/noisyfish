#!/usr/bin/env bash

cat <<- '__DIR__' >$HOME/.config/user-dirs.dirs
XDG_DESKTOP_DIR="$HOME/dt"
XDG_DOWNLOAD_DIR="$HOME/dl"
XDG_TEMPLATES_DIR="$HOME/dotfiles/Template"
XDG_PUBLICSHARE_DIR="$HOME/shared"
XDG_DOCUMENTS_DIR="$HOME/dotfiles"
XDG_MUSIC_DIR="/usr/local/bin"
XDG_PICTURES_DIR="$HOME/pic"
XDG_VIDEOS_DIR="$HOME/Autosave"

__DIR__

cat <<- '__UPDTEDB__' >/tmp/updatedb.conf
PRUNE_BIND_MOUNTS = "yes"
PRUNEFS = "tmpfs vboxsf davfs"
PRUNENAMES = ".git .hg .svn"
PRUNEPATHS = "/home/toshi75/ex11/uraaka /home/toshi75/twi /home/toshi75/hd41/twi /home/toshi75/hd41/twitemp /afs /tmp /var/cache /var/db /var/dev  /var/dpkg /var/empty /var/games /var/lib /var/local /var/lock /var/log /var/mail /var/opt /var/run /var/spool /var/tmp /var/vagrant.d"

#PRUNE_BIND_MOUNTS = "yes"
#PRUNEFS = "9p afs anon_inodefs auto autofs bdev binfmt_misc cgroup cifs coda configfs cpuset cramfs debugfs devpts devtmpfs ecryptfs exofs ftpfs fuse fuse.encfs fuse.sshfs fusectl gfs gfs2 hugetlbfs inotifyfs iso9660 jffs2 lustre mqueue ncpfs nfs nfs4 nfsd pipefs proc ramfs rootfs rpc_pipefs securityfs selinuxfs sfs shfs smbfs sockfs sshfs sysfs tmpfs ubifs udf usbfs vboxsf"
#PRUNENAMES = ".git .hg .svn"
#PRUNEPATHS = "/afs /media /mnt /net /sfs /tmp /udev /var/cache /var/db /var/dev  /var/dpkg /var/empty /var/games /var/lib /var/local /var/lock /var/log /var/mail /var/opt /var/run /var/spool /var/tmp /var/vagrant.d"

__UPDTEDB__
sudo mv /tmp/updatedb.conf /etc

mkdir -p "$HOME/.config/yay"
cat <<- '__YAY__' >"$HOME/.config/yay/config.json"
{
  "aururl": "https://aur.archlinux.org",
  "buildDir": "/home/toshi75/.cache/yay",
  "absdir": "/home/toshi75/.cache/yay/abs",
  "editor": "vim",
  "editorflags": "",
  "makepkgbin": "makepkg",
  "makepkgconf": "",
  "pacmanbin": "pacman",
  "pacmanconf": "/etc/pacman.conf",
  "redownload": "no",
  "rebuild": "no",
  "answerclean": "",
  "answerdiff": "",
  "answeredit": "",
  "answerupgrade": "",
  "gitbin": "git",
  "gpgbin": "gpg",
  "gpgflags": "",
  "mflags": " -Cc ",
  "sortby": "votes",
  "searchby": "name-desc",
  "gitflags": "",
  "removemake": "yes",
  "sudobin": "sudo",
  "sudoflags": "",
  "requestsplitn": 150,
  "sortmode": 0,
  "completionrefreshtime": 7,
  "sudoloop": true,
  "timeupdate": false,
  "devel": false,
  "cleanAfter": false,
  "provides": true,
  "pgpfetch": true,
  "upgrademenu": true,
  "cleanmenu": true,
  "diffmenu": false,
  "editmenu": false,
  "combinedupgrade": false,
  "useask": true,
  "batchinstall": false
}

__YAY__

echo "permit nopass keepenv $USER" >/tmp/doas.conf
sudo chown root:root   /tmp/doas.conf
sudo chmod 600         /tmp/doas.conf
sudo mv /tmp/doas.conf /etc

mkdir -p "$HOME/.config/paru"
cat <<- '__PARU__' > "$HOME/.config/paru/paru.conf"
##########################################
#
# paru.conf - paru configuration file
# ~/.config/paru/paru.conf
# /etc/paru.conf
#
# See the paru.conf(5) manpage for options
##########################################

# SYNOPSIS
    # $PARU_CONF, $XDG_CONFIG_HOME/paru/paru.conf,
    # $HOME/.config/paru/paru.conf, /etc/paru.conf

# DESCRIPTION
    # Paru's config file. Based on the format used by pacman.conf(5)

    # Paru first attempts to read the file at $PARU_CONF. If $PARU_CONF is
    # not set, paru attempts to read from $XDG_CONFIG_HOME/paru/paru.conf.
    # If $XDG_CONFIG_HOME is not set, or the file doesn't exist, paru
    # attempts to read from $HOME/.config/paru/paru.conf. If that file
    # doesn't exist, it will read the system config from /etc/paru.conf.

    # Additionally, the Include directive can be used to copy paste files
    # into the config. This could be used to extend the system config by
    # including it in your user's config and then defining options.


# OPTIONS: Options belonging to the [options] section.
[options]
# BottomUp
BottomUp
    # Print search results from bottom to top. AUR results
    # will be printed first.

# AurOnly
    # Assume all targets are from the AUR. Additionally,
    # actions such as sysupgrade will only act on AUR
    # packages.

    # Note that dependency resolving will still act normally
    # and include repository packages.

# RepoOnly
    # Assume all targets are from the repositories.
    # Additionally, actions such as sysupgrade will only act
    # on repository packages.


# SudoLoop [= args...]
#SudoLoop
    # Periodically call sudo in the background to prevent it
    # from timing out during long builds.

    # Optionally args can be passed to choose how to loop the
    # command. This may be useful for doas where looping is
    # done differently.

# NoCheck
    # Don't resolve checkdepends or run the check function.

# InstallDebug
    # Also install debug packages when a package provides
    # them.

# Devel  During sysupgrade also check AUR development packages
    # for updates. Currently only Git packages are supported.

    # Devel checking is done using git ls-remote. The newest
    # commit hash is compared against the hash at install
    # time. This allows devel updates to be checked almost
    # instantly and not require the original PKGBUILD to be
    # downloaded.

# CleanAfter
CleanAfter
    # Remove untracked files after installation.

    # Untracked files are removed with the exception of
    # directories.  This allows VCS packages to easily pull an
    # update instead of having to reclone the entire repo.

# Provides
    # Look for matching providers when searching for AUR
    # packages. When multiple providers are found a menu will
    # appear prompting you to pick one. This increases
    # dependency resolve time although this should not be
    # noticeable.

PgpFetch
    # Prompt to import unknown PGP keys from the validpgpkeys
    # field of each PKGBUILD.

# CombinedUpgrade
    # During sysupgrade, paru will first perform a refresh,
    # then show its combined menu of repo and AUR packages
    # that will be upgraded. Then after reviewing the
    # PKGBUILDs, the repo and AUR upgrade will start with no
    # need for manual intervention.

    # If paru exits for any reason after the refresh without
    # upgrading, it will be the user's responsibility to
    # either resolve the reason paru exited or run a
    # sysupgrade through pacman directly.

# BatchInstall
    # When building and installing AUR packages; instead of
    # installing each package after building, queue each
    # package for install. Then once either all packages are
    # built or a package in the build queue is needed as a
    # dependency to build another package, install all the
    # packages in the install queue.

# NewsOnUpgrade
    # Print new news during sysupgrade.

# UseAsk Use pacman's --ask flag to automatically confirm package
    # conflicts. Paru lists conflicts ahead of time. It is
    # possible that paru does not detect a conflict, causing a
    # package to be removed without the user's confirmation.
    # However, this is very unlikely.

# SaveChanges
    # Commit changes to pkgbuilds made during review.

# Redownload [= all]
    # Always download PKGBUILDs of targets even when a copy is
    # available in cache. If set to all then this applies to
    # all packages, not only targets.

# Rebuild [= all]
    # Always build target packages even when a copy is
    # available in cache. If set to all, then all packages are
    # rebuilt, not only targets.

# RemoveMake [= ask]
RemoveMake
    # Remove makedepends after installing packages. If set to
    # ask, a menu will appear during builds allowing an option
    # to be chosen then.

# UpgradeMenu
    # Show a detailed list of updates in a similar format to
    # pacman's VerbosePkgLists option. (See pacman.conf(5)).
    # Upgrades can be skipped using numbers, number ranges, or
    # repo names.

    # Warning: It is not recommended to skip updates from the
    # repositories as this can lead to partial upgrades. This
    # feature is intended to easily skip AUR updates on the
    # fly that may be broken or have a long compile time.
    # Ultimately it is up to the user what upgrades they skip.

# AurUrl = URL
    # Set an alternative AUR URL. This is mostly useful for
    # users in China who wish to use
    # https://aur.tuna.tsinghua.edu.cn/.

# CloneDir = /path/to/dir
    # Directory used to download and run PKGBUILDs.

SortBy = popularity
    # <votes|popularity|name|base|submitted|modified|id|baseid>
    # Defaults to votes. Sort AUR results according to the
    # options in "Sort by" visible here:
    # https://aur.archlinux.org/packages/

# SearchBy =
    # <name|name-desc|maintainer|depends|checkdepends|makedepends|optdepends>
    # Defaults to name-desc. Search AUR packages according to
    # the options in "Search by" visible here:
    # https://aur.archlinux.org/packages/

# Limit = N
    # Limit the number of packages returned in a search to the
    # given amount. Defaults to 0 (no limit). This applies
    # separately to repo and AUR packages.

# CompletionInterval = N
    # Time in days to refresh the completion cache. Setting
    # this to 0 will cause the cache to be refreshed every
    # time, while setting this to -1 will cause the cache to
    # never be refreshed. Defaults to 7.

# PacmanConf = path/to/pacman.conf
    # The pacman config file to use.

# DevelSuffixes = Suffixes...
    # Suffixes that paru will use to decide if a package is a
    # devel package.  Used when determining if a pkgver bump
    # is used when the --needed option is set.

# NoWarn = Packages...
NoWarn = *
    # Don't warn when these packages are not in the aur, out
    # of date, or orphaned.

# LocalRepo [= Repos...]
    # Use a local repo to build and upgrade AUR packages.

    # Paru will act on packages in the enabled repos instead
    # of foreign packages.  The repo must already be declared
    # in pacman.conf but does not have to already exist on
    # disk.

    # Optionally a list of repos to use can be passed. By
    # default paru will consider all local repos, building new
    # packages into the fist listed repo and upgrading the
    # packages in other enabled repos.

# Chroot [= path/to/chroot]
    # Build packages in a chroot. This requires the LocalRepo
    # option to be enabled.  Optionally a directory may be
    # passed to specify where to create the chroot.

# Sign [= key]
    # Sign packages with gpg. Optionally indicate which key to
    # sign with.

# SignDb [= key]
    # Sign databases with gpg. Optionally indicate which key
    # to sign with.

SkipReview
    # Skip the review process.

# BIN:  Options belonging to the [bin] section.
[bin]
# Makepkg = path/to/makepkg
    # The command to use for makepkg calls. This can be a
    # command in PATH or an absolute path to the file.

# Pacman = path/to/pacman
    # The command to use for pacman calls. This can be a
    # command in PATH or an absolute path to the file.

# Git = path/to/git
    # The command to use for git calls. This can be a command
    # in PATH or an absolute path to the file.

# Asp = path/to/asp
    # The command to use for asp calls. This can be a command
    # in PATH or an absolute path to the file.

# Bat = path/to/bat
    # The command to use for bat calls. This can be a command
    # in PATH or an absolute path to the file.

Sudo = /usr/bin/doas
    # The command to use for sudo calls. This can be a command
    # in PATH or an absolute path to the file. The SudoLoop
    # option is not guaranteed to work with a custom sudo
    # command.

# FileManager = path/to/fm
    # This enables fm review mode, where PKGBUILD review is
    # done using the file manager specified by command.

MFlags = ' -Cc  '
    # Passes arguments to makepkg. These flags get passed to
    # every instance where makepkg is called by paru.
    # Arguments are split on whitespace before being passed to
    # makepkg.

# GitFlags = Flags...
    # Passes arguments to git. These flags get passed to every
    # instance where git is called by paru. Arguments are
    # split on whitespace before being passed to git.

# GpgFlags = Flags...
    # Passes arguments to gpg. These flags get passed to every
    # instance where gpg is called by paru. Arguments are
    # split on whitespace before being passed to gpg.

# BatFlags = Flags...
    # Passes arguments to bat. These flags get passed to every
    # instance where bat is called by paru. Arguments are
    # split on whitespace before being passed to bat.

# SudoFlags = Flags...
    # Passes arguments to sudo. These flags get passed to
    # every instance where sudo is called by paru. Arguments
    # are split on whitespace before being passed to sudo.

# FileManagerFlags = Flags...
    # Passes arguments to the file manager. These flags get
    # passed to every instance where file manager is called by
    # paru. Arguments are split on whitespace before being
    # passed to file manager.

# Pager = Command
    # Command to use for paging

# PreBuildCommand = Command
    # Command will be executed for each package before it is
    # build.

    # The command will be run via 'sh -c' and the command's
    # current directory will be set to the directory
    # containing the package's PKGBUILD. If a package is
    # already built then the build will be skipped but this
    # command will still be run for that package.

    # the variables PKGBASE and VERSION will be set for the
    # command to use.

# [ENV]
# Set environment variables.
# Key = Value
    # Sets the environment variable Key to Value.

__PARU__
