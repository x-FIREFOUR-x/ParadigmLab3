use "task2.sml";

    (*test task 2 a*)
val test1_2a = card_color((Hearts, Num 2));
val test2_2a = card_color((Clubs, Jack));
val test3_2a = card_color((Diamonds, Ace));


    (*test task 2 b*)
val test1_2b = card_value((Hearts, Num 9));
val test2_2b = card_value((Clubs, Jack));
val test3_2b = card_value((Spades, Ace));


    (*test task 2 c*)
val test1_2c = remove_card([(Hearts, Num 10), (Hearts, Num 9), (Diamonds, King), (Spades, Ace)],
(Spades, Ace), IllegalMove);
val test2_2c = remove_card([(Hearts, Num 9), (Hearts, Num 9), (Diamonds, King), (Spades, Ace)],
(Hearts, Num 9), IllegalMove);
val test3_2c = remove_card([(Hearts, Num 10), (Hearts, Num 9), (Diamonds, King), (Spades, Ace)],
(Hearts, Ace), IllegalMove);


    (*test task 2 d*)
val test1_2d = all_same_color([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)]);
val test2_2d = all_same_color([(Diamonds, Num 10),(Diamonds, Jack),(Spades, Ace)]);
val test3_2d = all_same_color([]);


    (*test task 2 e*)
val test1_2e = sum_cards([]);
val test2_2e = sum_cards([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)]);


    (*test task 2 f*)
val test1_2f = score([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)], 20);
val test2_2f = score([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)], 34);
val test3_2f = score([(Diamonds, Num 10),(Spades, Jack),(Hearts, Ace)], 20);
val test4_2f = score([(Diamonds, Num 10),(Spades, Jack),(Hearts, Ace)], 34);


    (*test task 2 g*)
val test1_2g = officiate([(Diamonds, Num 10),(Diamonds, Jack),(Hearts, Ace)],
[Draw, Draw],
20);
val test2_2g = officiate([(Diamonds, Num 10), (Spades, Jack), (Diamonds, Ace),(Hearts, Ace)],
[Draw, Draw, Discard (Spades, Jack), Draw],
21);
val test3_2g = officiate([(Diamonds, Num 10), (Spades, Ace), (Spades, Jack), (Hearts, Ace)],
[Draw, Draw, Discard (Diamonds, Ace)],
20);