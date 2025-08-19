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