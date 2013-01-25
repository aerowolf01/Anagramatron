Written by Cooper LeBrun <cooperlebrun@gmail.com>

Anagramatron.rb
============
It is actually functional now, but I need to make it usable.

wwf.ana
=======
A formatted anagram list of the enable dictionary's word list.
Has a lot of not really helpful words.
Also known as the basis for the words with friends dictionary.
http://code.google.com/p/dotnetperls-controls/downloads/detail?name=enable1.txt



Epic bug:
========
you cannot use h = Hash.new([])
because every key will point to that one array, and everything you add will be in one array.
Hash.new {[]} is similarly unproductive.
just overall its really wierd.
seems like this would have come up before somewhere, but I couldn't find anything on it.
