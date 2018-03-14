When building up large lists, it is faster to prepend than
append. Therefore: It is sometimes best to prepend to the list
during iteration and call Enum.reverse/1 at the end, as it is quite
fast.

Example:

    list = list_so_far ++ [new_item]

    # refactoring it like this can make the code faster:

    list = [new_item] ++ list_so_far
    # ...
    Enum.reverse(list)

