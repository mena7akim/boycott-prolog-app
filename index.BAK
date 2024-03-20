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
   list_orders(X, L):-
    customer(ID,X),
    list_orders_helper(ID, [], L).

list_orders_helper(ID, L, Orders):-
    order(ID, OrderID, Items),
    not(list_member(order(ID, OrderID, Items), L)),
    list_append(L, [order(ID, OrderID, Items)], NewL),
    list_orders_helper(ID, NewL, Orders).

list_orders_helper(_, L, L).






/* Q2 */

    countOrdersOfCustomer(CustomerName,Count):- list_orders(CustomerName,Orders),Y = Orders , countAll(Y,Count).







/* Q3 */
   getItemsInOrderById(CustomerName,OrderID,Items):- customer(CustomerID,CustomerName),order(CustomerID,OrderID,Items).





/* Q4 */
  getNumOfItems(CustomerName,OrderID,Count):- getItemsInOrderById(CustomerName,OrderID,Items),countAll(Items,Count).










/* Q5 */
   calcPriceOfOrder(CustomerName,OrderID,TotalPrice):- getItemsInOrderById(CustomerName,OrderID,Items),sumItemsPrices(Items, TotalPrice).










/* Q6 */



isBoycott(Item):-
    item(Item, Company, _),
    boycott_company(Company, _).

isBoycott(Company):-
    boycott_company(Company, _).



/* Q7 */



whyToBoycott(Item, Justification):-
    item(Item, Company, _),
    boycott_company(Company, Justification).


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


replaceBoycottHelper([], _):- !.

replaceBoycottHelper([H|T], NewList):-
    item(H, CompanyName, _),
    \+ boycott_company(CompanyName, _),
    replaceBoycottHelper(T, ReturnedList),
    list_append(ReturnedList, [H], NewList),
    !.

replaceBoycottHelper([H|T], NewList):-
    item(H, CompanyName, _),
    boycott_company(CompanyName, _),
    alternative(H, Alt),
    replaceBoycottHelper(T, ReturnedList),
    list_append(ReturnedList, [Alt], NewList),
    !.

replaceBoycottHelper([H|T], NewList):-
    item(H, CompanyName, _),
    boycott_company(CompanyName, _),
    \+ alternative(H, _),
    replaceBoycottHelper(T, ReturnedList),
    list_append(ReturnedList, [], NewList),
    !.

replaceBoycottItemsFromAnOrder(Name, OrderID, NewList):-
    getItemsInOrderById(Name, OrderID, Items),
    replaceBoycottHelper(Items, NewList).



/* Q10 */

calcPriceAfterReplacingBoycottItemsFromAnOrder(Name, OrderID, NewList, TotalPrice):-
    replaceBoycottItemsFromAnOrder(Name, OrderID, NewList),
    sumItemsPrices(NewList, TotalPrice).

/* Q11 */
   getTheDifferenceInPriceBetweenItemAndAlternative(Alternative,Boycott,DiffPrice):-
              alternative(Alternative,Boycott),item(Alternative,_,Price1),item(Boycott,_,Price2),DiffPrice is Price1 - Price2.











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


