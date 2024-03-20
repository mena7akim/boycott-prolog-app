# Online Store Management System

This system provides functionalities for managing orders, customers, items, and boycott companies. It includes various predicates to perform actions such as listing orders, counting orders, retrieving items in an order, calculating prices, managing boycotts, and more.

## Facts (data.pl file)

The data file contains facts about customers, items, orders, boycott companies, and their alternatives.

### Required Predicates

1. **List Orders of a Specific Customer**: `list_orders(CustomerID, OrdersList)`
   - Example: `list_orders(shahd_ghazal2002, OrdersList)`

2. **Count Orders of a Specific Customer**: `countOrdersOfCustomer(CustomerID, Count)`
   - Example: `countOrdersOfCustomer(shahd_ghazal2002, Count)`

3. **Get Items in a Specific Customer Order**: `getItemsInOrderById(CustomerID, OrderID, ItemsList)`
   - Example: `getItemsInOrderById(shahd_ghazal2002, 1, ItemsList)`

4. **Get Number of Items in a Specific Customer Order**: `getNumOfItems(CustomerID, OrderID, Count)`
   - Example: `getNumOfItems(shahd_ghazal2002, 2, Count)`

5. **Calculate Price of a Given Order**: `calcPriceOfOrder(CustomerID, OrderID, TotalPrice)`
   - Example: `calcPriceOfOrder(shahd_ghazal2002, 2, TotalPrice)`

6. **Check if an Item or Company Needs to be Boycotted**: `isBoycott(ItemOrCompanyName)`
   - Examples: `isBoycott(sunbites)`, `isBoycott(biskrem)`

7. **Find Justification for Boycotting a Company or Item**: `whyToBoycott(ItemOrCompanyName, Justification)`
   - Example: `whyToBoycott(dasani, Justification)`

8. **Remove Boycott Items from an Order**: `removeBoycottItemsFromAnOrder(CustomerID, OrderID, UpdatedOrderList)`
   - Example: `removeBoycottItemsFromAnOrder(abu_juliaa, 1, UpdatedOrderList)`

9. **Replace Boycott Items from an Order with Alternatives**: `replaceBoycottItemsFromAnOrder(CustomerID, OrderID, UpdatedOrderList)`
   - Example: `replaceBoycottItemsFromAnOrder(abu_juliaa, 1, UpdatedOrderList)`

10. **Calculate Price After Replacing Boycott Items with Alternatives**: `calcPriceAfterReplacingBoycottItemsFromAnOrder(CustomerID, OrderID, UpdatedOrderList, TotalPrice)`
    - Example: `calcPriceAfterReplacingBoycottItemsFromAnOrder(abu_juliaa, 1, UpdatedOrderList, TotalPrice)`

11. **Get the Difference in Price Between an Item and its Alternative**: `getTheDifferenceInPriceBetweenItemAndAlternative(ItemOrCompanyName, AlternativeItem, PriceDifference)`
    - Example: `getTheDifferenceInPriceBetweenItemAndAlternative(lipton, AlternativeItem, PriceDifference)`

### Bonus Predicate

12. **Insert/Remove Item, Alternative, or New Boycott Company**: 
    - To add an item: `add_item(ItemName, CompanyName, Price)`
    - To remove an item: `remove_item(ItemName, CompanyName, Price)`
    - Example: `add_item(alpella_wafer, 'Alpella', 4)`

## How to Use

1. Ensure you have `data.pl` file with the required facts.
2. Load the file into your Prolog environment.
3. Execute the desired predicate using the provided examples.

## Contributors

- [Your Name](link to your profile or contact information)
- [Another Contributor](link to their profile or contact information)


