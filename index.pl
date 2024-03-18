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

/* Q1 */








/* Q2 */










/* Q3 */









/* Q4 */











/* Q5 */











/* Q6 */












/* Q7 */










/* Q8 */














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












/* Q12 */
