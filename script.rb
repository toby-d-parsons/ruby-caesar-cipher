require 'pry-byebug'

def caesar_cipher(string, shift_amount)
    arr_char_code = string.split("").map { |val| val.ord }
    arr_char_code_shifted = arr_char_code.map { |val| letter?(val.chr) ? shift_letter(val, shift_amount) : val}
    string_shifted = arr_char_code_shifted.map { |val| val.chr }.join()
    string_shifted
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