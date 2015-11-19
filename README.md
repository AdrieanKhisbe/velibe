VeLibe
======

*Wrapper for Velib api, for no-fuss cycling.*

[![Gem Version](https://badge.fury.io/rb/velibe.svg)](http://badge.fury.io/rb/velibe)
[![Build Status](https://travis-ci.org/AdrieanKhisbe/velibe.svg)](https://travis-ci.org/AdrieanKhisbe/velibe)
[![Coverage Status](https://coveralls.io/repos/AdrieanKhisbe/velibe/badge.svg?branch=master&service=github)](https://coveralls.io/github/AdrieanKhisbe/velibe?branch=master)
[![Code Climate](https://codeclimate.com/github/AdrieanKhisbe/velibe/badges/gpa.svg)](https://codeclimate.com/github/AdrieanKhisbe/velibe)

CLI tool included to help you see if there is bikes around.

So far *velibe* only support query of station. Handling of favorites, query by
address, and some stat collection is planed and might be implemented soon.

## Installation

Just install the gem, and you'll have access to this wonderful tool :D
     
    $ gem install Velibe

The cli relies on the JcDecaux API. You need an api token to be able to use it.
You can see the official site to get one [there]
(https://developer.jcdecaux.com/#/opendata/vls?page=dynamic).

This token is to be stored in the `VELIBE_TOKEN` variable environment.

## Usage

Basic usage of the commandline is to query the API to see
the status of some specific station:

     $ velibe 10042 18012

 

