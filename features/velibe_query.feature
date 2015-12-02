Feature: Querying the API
  In order to see if I can take a bike at a given station
  As a user of the velibe cli
  I want to be able to query the api through the velibe cli


# TODO: background: favorites set up


Scenario: By Default, my favorites are queried
  Given a file named "file.txt" with:
   """
   Hello World
   """
  Then the file "file.txt" should contain:
   """
   Hello World
   """


Scenario: I can specify the station i'm interested into




Scenario: Wrong arguments are ignored and warning is printed
