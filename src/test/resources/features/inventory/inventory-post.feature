Feature: Inventory API - POST
    As a user managing the inventory
    I want to add items with proper validation
    so that the API enforces correct data and avoids duplicates.

    Background:
        * url baseUrl
        * def validItem =
            """
            {
                "id": "10",
                "name": "Hawaiian",
                "image": "hawaiian.png",
                "price": "$14"
            }
            """

    Scenario: Add item for non-existent id -> 200
        Given path 'api', 'inventory', 'add'
        And request validItem
        When method post
        Then status 200

    Scenario: Add item for existent id -> 400
        Given path 'api', 'inventory', 'add'
        And request validItem
        When method post
        Then status 400

    Scenario Outline: Add item with missing <field> -> 400
        * copy payload = validItem
        * remove payload[<field>]
        Given path 'api', 'inventory', 'add'
        And request payload
        When method post
        Then status 400
        And match response == 'Not all requirements are met'

        Examples:
            | field   |
            | 'id'    |
            | 'name'  |
            | 'image' |
            | 'price' |

    Scenario: Validate recent added item is present in the inventory -> 200
        Given path 'api', 'inventory'
        When method get
        Then status 200
        * def items = response.data
        And match items contains
            """
            {
            id:    #(validItem.id),
            name:  #(validItem.name),
            price: #(validItem.price),
            image: #(validItem.image)
            }
            """