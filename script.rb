require 'pry-byebug'

def caesar_cipher(string, shift_amount)
    arr = string.split("")
    arr_num = arr.map { |val| val.ord}
    arr_new_num = arr_num.map { |val| letter?(val.chr) ? shift_letter(val, shift_amount) : val}
    arr_new_letters = arr_new_num.map { |val| val.chr }
    new_string = arr_new_letters.join()
    new_string
end

def letter?(item)
    item.match?(/[[:alpha:]]/)
end

def shift_letter(letter, shift_amount)
    # Converts any negative shift_amount to positive value, reduces loops for large amounts
    i = shift_amount % 26
    while i > 0
        letter += 1
        i -= 1
        # If check wraps z back to a
        if letter == 91 || letter == 123
            letter -= 26
        end
    end
    letter
end

caesar_cipher("What a string!", 5)