use "hw02.sml";


    (*2.a*)
fun card_color(card) = 
    case card of
    (Clubs, _) => Black
    |(Spades, _) => Black
    |_ => Red
;

card_color((Hearts, 2));
card_color((Clubs, Jack));
card_color((Spades, 2));
card_color((Diamonds, Jack));