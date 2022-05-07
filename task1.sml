use "hw02.sml";

    (*1.a*)
fun all_except_option(str, strlist) = 
    let fun in_fun(strlist, resList, isFound) =
        case strlist of
            [] => (resList, isFound)
            |(hd::tl) => if (same_string(hd, str)) 
                            then in_fun(tl, resList, true) 
                            else in_fun(tl, hd::resList, isFound)
    in
        let fun rev_list(lst, resList) =
            case lst of
            [] => resList
            | hd::tl => rev_list(tl, hd::resList)
        in
            case in_fun(strlist, [], false) of
            (hd::tl, true) => SOME(rev_list(hd::tl, []))
            |(list, false) => NONE
            |([], true) => SOME([])
        end
    end
;

all_except_option( "ddd", ["3", "ddd", "1" , "2"]);
all_except_option( "ddd", ["3", "ddd1", "1" , "2"]);
all_except_option( "ddd", ["ddd"]);



    (*1.b*)
fun get_substitutions1(strListList, str) =
    case strListList of
    [] => []
    |hd::td => case all_except_option(str, hd) of
            SOME list  => list @ get_substitutions1 (td, str)
            |NONE=> get_substitutions1(td, str)
;

get_substitutions1([],"Jack");
get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Jeff");
get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]], "Olexandr");




