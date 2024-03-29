:-consult(data).

/* utils */

list_size([], 0).
list_size([_|T], N):-
    list_size(T, ReturnedN),
    N is ReturnedN + 1.

list_append([], L, L).
list_append([H|T], L2, [H|NT]):-
    list_append(T, L2, NT).

list_member(_, []):- fail, !.
list_member(Element, [Element|_]):- !.
list_member(Element, [_|T]):- list_member(Element, T).

sumItemsPrices([], 0).
sumItemsPrices([H|T], Price):-
    sumItemsPrices(T, ReturnedPrice),
    item(H, _, ItemPrice),
    Price is ReturnedPrice + ItemPrice.
    
countAll([], 0).
countAll([_|T], Count):-
    countAll(T, RestCount),
    Count is RestCount + 1.

/* Q1 */

add_orders(CustID, Orders, Visited):-
    order(CustID, OrderID, Items),
    State = order(CustID, OrderID, Items),
    not(list_member(State, Visited)),
    list_append(Visited, [State], NewVisited),
    add_orders(CustID, Orders, NewVisited),
    !.

add_orders(_, Orders, Visited):-
    Orders = Visited.

list_orders(Name, Orders):- 
    customer(ID, Name),
    add_orders(ID, Orders, []).


/* Q2 */
countOrdersOfCustomer(CustomerName,Count):- 
    list_orders(CustomerName,Orders),
    Y = Orders,
    countAll(Y,Count).


/* Q3 */
getItemsInOrderById(CustomerName,OrderID,Items):- 
    customer(CustomerID,CustomerName),
    order(CustomerID,OrderID,Items),
    !.


/* Q4 */
getNumOfItems(CustomerName,OrderID,Count):- 
    getItemsInOrderById(CustomerName,OrderID,Items),
    countAll(Items,Count).


/* Q5 */
calcPriceOfOrder(CustomerName,OrderID,TotalPrice):- 
    getItemsInOrderById(CustomerName,OrderID,Items),
    sumItemsPrices(Items, TotalPrice).


/* Q6 */


isBoycott(Item):-
    item(Item, Company, _),
    boycott_company(Company, _),
    !.

isBoycott(Company):-
    boycott_company(Company, _).


/* Q7 */


whyToBoycott(Item, Justification):-
    item(Item, Company, _),
    boycott_company(Company, Justification),
    !.


whyToBoycott(Company, Justification):-
    boycott_company(Company, Justification).


/* Q8 */


filterBoycottedItems([], []).
filterBoycottedItems([Item|Reminder], Filtered):-
    (
        isBoycott(Item)
        -> filterBoycottedItems(Reminder, Filtered)
        ; Filtered = [Item|ReminderList],
        filterBoycottedItems(Reminder, ReminderList)
    ).

removeBoycottItemsFromAnOrder(UserName, OrderID, NewList):-
    getItemsInOrderById(UserName, OrderID, Items),
    filterBoycottedItems(Items, FilteredItems),
    NewList = FilteredItems.
    

/* Q9 */

replaceBoycott([], []):- !.

replaceBoycott([H|T], [H|ReturnedList]):-
    item(H, CompanyName, _),
    \+ boycott_company(CompanyName, _),
    replaceBoycott(T, ReturnedList),
    !.

replaceBoycott([H|T], [Alt|ReturnedList]):-
    alternative(H, Alt),
    replaceBoycott(T, ReturnedList),
    !.

replaceBoycott([H|T], ReturnedList):-
    \+ alternative(H, _),
    replaceBoycott(T, ReturnedList),
    !.

replaceBoycottItemsFromAnOrder(Name, OrderID, NewList):-
    getItemsInOrderById(Name, OrderID, Items),
    replaceBoycott(Items, NewList).


/* Q10 */

calcPriceAfterReplacingBoycottItemsFromAnOrder(Name, OrderID, NewList, TotalPrice):-
    replaceBoycottItemsFromAnOrder(Name, OrderID, NewList),
    sumItemsPrices(NewList, TotalPrice).

/* Q11 */

getTheDifferenceInPriceBetweenItemAndAlternative(Boycott, Alternative, DiffPrice):-
    alternative(Boycott, Alternative),
    item(Boycott, _, Price1),
    item(Alternative, _, Price2),
    DiffPrice is Price1 - Price2.


/* Q12 */
:- dynamic(item/3).
   add_item(ItemName, Company, Price) :-
     assert(item(ItemName, Company, Price)).

:-dynamic(alternative/2).
     add_alt(Alternative,Boycott):-
       assert(alternative(Alternative,Boycott)).

:-dynamic(boycott_company/2).
     add_boycott(CompanyName,Reason):-
       assert(boycott_company(CompanyName,Reason)).


:- dynamic(item/3).
   remove_item(ItemName, Company, Price) :-
     retract(item(ItemName, Company, Price)).

:-dynamic(alternative/2).
     remove_alt(Alternative,Boycott):-
       retract(alternative(Alternative,Boycott)).

:-dynamic(boycott_company/2).
     remove_boycott(CompanyName,Reason):-
       retract(boycott_company(CompanyName,Reason)).


