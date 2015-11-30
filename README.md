VeLibe
======

*Wrapper for Velib api, for no-fuss cycling.*

[![Gem Version](https://badge.fury.io/rb/velibe.svg)](http://badge.fury.io/rb/velibe)
[![Build Status](https://travis-ci.org/AdrieanKhisbe/velibe.svg)](https://travis-ci.org/AdrieanKhisbe/velibe)
[![Coverage Status](https://coveralls.io/repos/AdrieanKhisbe/velibe/badge.svg?branch=master&service=github)](https://coveralls.io/github/AdrieanKhisbe/velibe?branch=master)
[![Code Climate](https://codeclimate.com/github/AdrieanKhisbe/velibe/badges/gpa.svg)](https://codeclimate.com/github/AdrieanKhisbe/velibe)
[![Dependency Status](https://gemnasium.com/AdrieanKhisbe/velibe.svg)](https://gemnasium.com/AdrieanKhisbe/velibe)

CLI tool included to help you see if there is bikes around.

So far *velibe* only support query of station. Handling of favorites, query by
address, and some stat collection is planed and might be implemented soon.

## Installation

Just install the gem, and you'll have access to this wonderful tool :D
     
    $ gem install velibe

The cli relies on the JcDecaux API. You need an api token to be able to use it.
You can see the official site to get one [there]
(https://developer.jcdecaux.com/#/opendata/vls?page=dynamic).
You'll need to create an [account](https://developer.jcdecaux.com/#/account),
and an acces token will be then granted

This token is to be stored in the `VELIBE_TOKEN` variable environment, or in the yaml config
file under the `token` key.

## Usage

Basic usage of the commandline is to query the API to see
the status of some specific station:

     $ velibe 10042 18012 13020
       Velibe >> Stations 10042, 18012, 13020:
               > Station 10042 - poissonnière - enghien:  15 Velo(s) libre(s) pour 17 places libres
               > Station 18012 - doudeauville stephenson:  1 Velo(s) libre(s) pour 33 places libres
               > Station 13020 - mendes france:  25 Velo(s) libre(s) pour 17 places libres

Velibe handle storing of favorites stations, those would be the one
that will be querried when no argument is provided.

You can control favorites with the `favorite` subcommand (which can be shorten
to `fav` or `f`.
This accept different subcommands:

- `a`/`add <sta1> <sta2>` : add stations to favorites
- `reset`/`setup [--force|-f]` : setup the config version, or reset it.
  you will need to add the *force flag* to erase existing config
- if none is provided, just output current favorites.

Configuration is stored in `~/.velib.yaml` which you can also edit by hand
 and eventually version in you *dotfiles* repo.

    $ cat ~/.velib.yaml
    ---
    favorites: [10035, 19003, 19004, 10031]
    token: <this-is-your-token-string>