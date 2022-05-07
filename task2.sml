use "hw02.sml";


    (*2.a*)
fun card_color(card) = 
    case card of
    (Clubs, _) => Black
    |(Spades, _) => Black
    |_ => Red
;

card_color((Hearts, Num 2));
card_color((Clubs, Jack));
card_color((Spades, Num 2));
card_color((Diamonds, Jack));



  (*2.b*)
fun card_value(card) = 
    case card of
    (_, Num x) => x
    |(_, Ace) => 11
    |_ => 10
;

card_value((Hearts, Num 9));
card_value((Clubs, Jack));
card_value((Spades, Ace));
card_value((Diamonds, King));



    (*2.c*)
fun remove_card (cs, c, e) =
    let fun in_fun (curCards, resCards) =
        case curCards of
        [] => raise e
        | hd::tl => if hd = c
                    then resCards @ tl
                    else in_fun(tl, hd :: resCards)
    in
        in_fun(cs, [])
    end
;

remove_card([(Hearts, Num 10), (Hearts, Num 9), (Diamonds, King), (Spades, Ace)],
(Spades, Ace), Empty);
remove_card([(Hearts, Num 9), (Hearts, Num 9), (Diamonds, King), (Spades, Ace)],
(Hearts, Num 9), Empty);
remove_card([(Hearts, Num 10), (Hearts, Num 9), (Diamonds, King), (Spades, Ace)],
(Hearts, Ace), Empty);



    (*2.d*)
fun all_same_color (cards) =
    let val color = case cards of
                    [] => Black
                    |hd::tl => card_color(hd)
    fun in_fun(list, color) =
        case list of
        [] => true
        |hd::tl => if card_color(hd) = color
                   then in_fun(tl, color)
                   else false
    in
        in_fun(cards, color)
    end
;

all_same_color([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)]);
all_same_color([(Diamonds, Num 10),(Diamonds, Jack),(Spades, Ace)]);
all_same_color([]);



    (*2.e*)
fun sum_cards(cards) =
    let fun in_fun(cards, sum) =
        case cards of
        [] => sum
        | hd::tl => in_fun(tl, card_value(hd) + sum)
    in
        in_fun(cards, 0)
    end
;

sum_cards([]);
sum_cards([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)]);



    (*2.f*)
fun score(cards, goal) =
    let val preScore = if sum_cards(cards) > goal
                       then 3 * (sum_cards(cards) - goal)
                       else (goal - sum_cards(cards))
    in 
        if all_same_color(cards)
        then preScore div 2
        else preScore
    end
;

score([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)], 20);
score([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)], 34);
score([(Diamonds, Num 10),(Spades, Jack),(Hearts, Ace)], 20);
score([(Diamonds, Num 10),(Spades, Jack),(Hearts, Ace)], 34);



    (*2.g*)
fun officiate(cards, moves, goal) =
    let fun next_move(handCards, curCards, curMoves) =
        if sum_cards(handCards) > goal
        then score(handCards, goal)
        else case curMoves of
                [] => score(handCards, goal)
                |hdMoves::tlMoves => case hdMoves of
                                        Discard card => next_move(remove_card(handCards, card, IllegalMove), curCards, tlMoves)
                                        |Draw => case curCards of
                                                    [] => score(handCards, goal)
                                                    | hdCard::tlCards => next_move(hdCard :: handCards, tlCards, tlMoves)
    in
        next_move([], cards, moves)
    end
;

officiate([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)],
[Draw, Draw],
20);
officiate([(Diamonds, Num 10), (Spades, Jack), (Diamonds, Ace),(Hearts, Ace)],
[Draw, Draw, Discard (Spades, Jack), Draw],
21);
officiate([(Diamonds, Num 10), (Spades, Ace), (Spades, Jack), (Hearts, Ace)],
[Draw, Draw, Discard (Diamonds, Ace)],
20);