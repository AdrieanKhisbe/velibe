Feature: Playing with favorites
  In order to see not specify each time wich station i'm interested in
  As a user of the velibe cli
  I want to be handle to manage favorite


Background: Favorites Exists
  Given my favorites stations are 22, 42, 68

Scenario Outline: List favorites by default
  When I successfully run `velibe <favorite_cmd>`
  Then the output should contain exactly "Favorites Stations: 22, 42, 68"
  Examples:
    |favorite_cmd|
    | favorite   |
    | fav        |
    | f          |

Scenario Outline: Add a Favorite
  When I successfully run `velibe <favorite_cmd> <add_cmd> <station>`
  And I successfully run `velibe <favorite_cmd>`
  Then the output should contain "Favorites Stations:"
  And the output should contain "22"
  And the output should contain "<station>"

  Examples:
    |favorite_cmd|add_cmd|station|
    | favorite   | add   |  33   |
    | fav        | a     |  16   |
    | f          | a     |  81   |

Scenario Outline: Force Reset of favorites
  When I successfully run `velibe <favorite_cmd> <reset_cmd>  <flag>`
  And I successfully run `velibe <favorite_cmd>`
  Then the output should contain "Favorites Stations were reset"
  And the output should contain "No favorites so far, you can add some with `velibe favorite add <your> <number>`."

Examples:
|favorite_cmd|reset_cmd|  flag   |
| favorite   | setup   | --force |
| fav        | reset   | --force |
| f          | reset   |  -f    |
 # Favorites not empty, you need to add --force/-f flag if you really want to reset
