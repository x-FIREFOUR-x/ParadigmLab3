use "task1.sml";

    (*test task 1 a*)
val test1_1a = all_except_option( "ddd", ["3", "ddd", "1" , "2"]);
val test2_1a = all_except_option( "ddd", ["3", "ddd1", "1" , "2"]);
val test3_1a = all_except_option( "ddd", ["ddd"]);


    (*test task 1 b*)
val test1_1b = get_substitutions1([],"Jack");
val test2_1b = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff");
val test3_1b = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Olexandr");


    (*test task 1 c*)
val test1_1c = get_substitutions2([],"Jack");
val test2_1c = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff");
val test3_1c = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Olexandr");


    (*test task 1 d*)
val test1_1d = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Fred", middle="W", last="Smith"});
val test2_1d = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
{first="Olexandr", middle="W", last="Smith"});
val test3_1d = similar_names([],{first="Olexandr", middle="W", last="Smith"});