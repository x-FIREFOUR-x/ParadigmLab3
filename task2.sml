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