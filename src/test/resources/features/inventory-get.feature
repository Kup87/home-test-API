Feature: Inventory API - GET
    As a User browsing the menu
    I want to view all available items with their details
    So that I can make an informed order

    Background:
        * url baseUrl

    Scenario: Get all menu items
        Given path 'api', 'inventory'
        When method get
        Then status 200
        * assert response.data.length >= 9
        And match each response.data ==
            """
            {
            id:    "#present",
            name:  "#present",
            price: "#present",
            image: "#present"
            }
            """


    Scenario: Filter by id = 3 returns the 'Baked Rolls x 8'
        Given path 'api', 'inventory', 'filter'
        And param id = 3
        When method get
        Then status 200
        * def item = response
        And match item contains
            """
            {
            id: '3',
            name: 'Baked Rolls x 8',
            price: '$10',
            image: 'roll.png'
            }
            """
