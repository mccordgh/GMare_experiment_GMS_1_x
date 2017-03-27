/// scr_string_copy_words(string, index, count)

// string
var str = argument[0];
// where to start copying
var index = argument[1];
// set the current count position
var count = ceil(argument[2]);

// get the character at current count position
var character = string_char_at(str, count);

// check for end of word or string itself
while (character != " " and character != "") {
    count++;
    // get the character at current count position
    character = string_char_at(str, count);
}

// return the last word of the string
return string_copy(str, index, count);
