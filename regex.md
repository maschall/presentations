title: Regular Expressions
author:
    name: Mark Schall
    twitter: mark_schall
    url: http://maschall.com
output: regex.html
controls: false

--
# Regular Expressions

--
### What is a Regular Expression?

A pattern used for searching within strings.
--
### The Format
/pattern/flags

new Regex(pattern, flags)

[NSRegularExpression regularExpressionWithPattern:pattern options:flags];
--
### The Sample
"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."

--
### Exact Searches
/The dog chased the cat./

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Exact Searches
/The dog chased the cat./

"__The dog chased the cat.__ The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Exact Searches
/the dog chased the cat./

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Exact Searches
/the dog chased the cat./

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while __the dog chased the cat.__"
--
### Case Insensitvie Searches
/the dog chased the cat./i

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Case Insensitvie Searches
/the dog chased the cat./i

"__The dog chased the cat.__ The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### What about this match?
/the dog chased the cat./i

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while __the dog chased the cat.__"
--
### Global Searches
/the dog chased the cat./gi

"__The dog chased the cat.__ The cat chased the mouse. The mouse bit the dog while __the dog chased the cat.__"
--
### Flags
__i__ represents case insensitive

__g__ represents global matching, instead of find first
--
### Find the Animals
"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Find the Animals
/(dog|cat|mouse)/gi

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Find the Animals
/(dog|cat|mouse)/gi

"The __dog__ chased the __cat__. The __cat__ chased the __mouse__. The __mouse__ bit the __dog__ while the __dog__ chased the __cat__."
--
### Meta Characters: (, ), |
__(__ and __)__ represent a "group"

__|__ represents "or"
--
### Escaping Special Characters
/(mark@detroitlabs.com)/i

"Mark Schall (__mark@detroitlabs.com__) | awesome presenter."
--
### Escaping Special Characters
/__\\__(mark@detroitlabs.com__\\__)/i

"Mark Schall __(mark@detroitlabs.com)__ | awesome presenter."
--
### Find all instances of "the"
"The mouse bit the dog over there, while the dog chased the cat."
--
### Find all instances of "the"
/the/gi

"The mouse bit the dog over there, while the dog chased the cat."
--
### Find all instances of "the"
/the/gi

"__The__ mouse bit __the__ dog over __the__re, while __the__ dog chased __the__ cat."
--
### "the" not "there"
/\bthe\b/gi

"__The__ mouse bit __the__ dog over there, while __the__ dog chased __the__ cat."
--
### Special Backslash Characters
__\b__ represents a word boundary, which includes spaces and punctuations.
--
### Find all "the __"
"The mouse bit the dog over there, while the dog chased the cat."
--
### Find all "the __"
/the (dog|cat|mouse)/gi

"__The mouse__ bit __the dog__ over there, while __the dog__ chased __the cat__."
--
### Find all "the __"
/the \b(dog|cat|mouse)\b/gi

"__The mouse__ bit __the dog__ over there, while __the dog__ chased __the cat__."
--
### The magical __.__
__.__ represents any character
--
### A little lie
/The dog chased the cat__.__/

"__The dog chased the cat.__ The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### A little lie
/The dog chased the cat__\\.__/

"__The dog chased the cat.__ The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### Put it to use
/the ./gi

"__The m__ouse bit __the d__og over there, while __the d__og chased __the c__at."
--
### Matching more than one character
__*__ represents 0 or more

__+__ represents 1 or more
--
### Example
/the .*/gi

"__The mouse bit the dog over there, while the dog chased the cat.__"
--
### Same Results
/the .+/gi

"__The mouse bit the dog over there, while the dog chased the cat.__"
--
### Use our word boundaries
/the \b.+\b/gi

"__The mouse__ bit __the dog__ over there, while __the dog__ chased __the cat__."
