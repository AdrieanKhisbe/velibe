VeLibe
======

*Wrapper for Velib api, for no-fuss cycling.*

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

 

