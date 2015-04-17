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
/\\bthe\\b/gi

"__The__ mouse bit __the__ dog over there, while __the__ dog chased __the__ cat."
--
### Special Backslash Characters
__\\b__ represents a word boundary, which includes spaces and punctuations.
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
### * Example
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
--
### The importance of + vs *
/img (.*)/i vs /img (.+)/i
--
### The importance of + vs *
/img (.*)/i will match "img "

/img (.+)/i will not match "img "
--
### Expected characters
__.__ matches any character including spaces, letters, numbers, punctuation, etc...

Credit Cards only have numbers  
Phone numbers have numbers (and some have letters)  
Names only have letters
--
### Expected characters
__[__ and __]__ represent a range of values to match

[0123456789] - only numbers accepted  
[abcdefghijklmnopqrstuvwxyz]  
--
### Unicode characters
__\\u00A9__	- ©
--
### Shorthand
__[__ and __]__ represent a range of values to match

[0-9] - only numbers accepted  
[a-z] and [A-Z]
--
### Combining
__[__ and __]__ represent a range of values to match

[0-9a-zA-Z] - only numbers, lowercase and uppercase letters
--
### Even shorterhand
__\d__ - Digit, equalivalent to [0-9]

__\w__ - Word, equivalent to [0-9a-zA-Z_]

__\s__ - Space, equivalent to [ \\t\\r\\n]
--
### Unwanted characters
"The mouse bit the dog over there, while the dog chased the cat."
--
### Unwanted characters
/[^,.]+/g

"__The mouse bit the dog over there__, __while the dog chased the cat__."
--
### Word boundary
__\b__ - [^,.\s]
--
### Unwanted shorthand
__\D__ - [^\d]

__\W__ - [^\w]

__\S__ - [^\s]
--
### Phone number example
"555-555-5555"
--
### Phone number example
/\d+-\d+-\d+/

"__555-555-5555__"
--
### Phone number example
/\d+-\d+-\d+/

"You can call my cell __555-555-5555__ at any time"
--
### What if they don't use -
"5555555555"
--
### Optional characters
__?__ - matches 0 or 1 instance
--
### Phone number example
/\d+-?\d+-?\d+/g

"You can call my cell __5555555555__ or my home __555-555-5555__ at any time"
--
### Repeated groups
/(/d+-?)+/

"You can call my cell __5555555555__ or my home __555-555-5555__ at any time"
--
### Miss matching
/(/d+-?)+/

"You can call my cell __5555555555__ with your credit card __4444-4444-4444__-4444"
--
### Matching specific number of characters
{3} - matches 3 and only 3 characters

{3,4} - matches 3 to 4 characters
--
### Phone number example
/\d{3}-?\d{3}-?\d{4}/

"You can call my cell __5555555555__ with your credit card 4444-4444-4444-4444"
--
### Review thus far
__i__ and __g__ - case insensitive and global matching

__(abc)__ - group matches "abc"
__(ab|bc)__ - group matching "ab" or "bc" 

--
### Review thus far
__.__ - matches all characters  
__[a-z]__ - match a set of characters

__\\b__, __\\w__, __\\d__, __\\s__ - convenient shorthand
__\\.__, __\\\\__, __\\[__, __\\)__ - escape special characters
--
### Review thus far
__+__ -  1 or more
__*__ - 0 or more
__?__ - 0 or 1
__{2,5}__ - at least 2 but no more than 5
--
### Questions?
--
### But wait theres more
So far we've only talked about testing for existance, now let's find things!
--
### Phone number example
/\d{3}-?\d{3}-?\d{4}/g - proves existance of a phone number
--
### But what is that phone number
Match - the individual result of a regex

/\d{3}-?\d{3}-?\d{4}/g

"You can call my cell __5555555555__ or my home __555-555-5555__ at any time"

Match #1: 5555555555  
Match #2: 555-555-5555
--
### Get phone number with label
/cell \d{3}-?\d{3}-?\d{4}/g

"You can call my __cell 5555555555__ or my home 555-555-5555 at any time"

Match: cell 5555555555
--
### Use groups
/cell (\d{3}-?\d{3}-?\d{4})/g

"You can call my __cell 5555555555__ or my home 555-555-5555 at any time"

Match: cell 5555555555
Group 1: 5555555555
--
### Group 0
/cell (\d{3}-?\d{3}-?\d{4})/g

"You can call my __cell 5555555555__ or my home 555-555-5555 at any time"

Match: cell 5555555555
Group 1: 5555555555
Group 0: cell 5555555555
--
### Combined groups
/cell ((\d{3})-?\d{3}-?\d{4})(.*)/g

"You can call my __cell 3135555555 or my home 555-555-5555 at any time__"

Group 1: 3135555555
Group 2: 313
Group 3: " or my home 555-555-5555 at any time"
--
### Named groups*
/cell ((?<areaCode>\d{3})-?\d{3}-?\d{4})/g

"You can call my __cell 3135555555__ or my home 555-555-5555 at any time"

Group 1: 3135555555
Group 2: 313
Group areaCode: 313

_* named groups aren't supported on every platform_
--
### Ignore group (non-capturing group)
/cell (__?:__(\d{3})-?\d{3}-?\d{4})/g

"You can call my __cell 3135555555__ or my home 555-555-5555 at any time"

Group 1: 313
--
### Postive lookahead
__(?=abc)__

/\d{3}-?\d{3}-?\d{4}(?= x\d+)/g

"Work: __313-555-5555__ x345, Home: 248-555-5555"

Match: 313-555-5555
--
### Negative lookahead
__(?!abc)__

/\d{3}-?\d{3}-?\d{4}(?! x\d+)/g

"Work: 313-555-5555 x345, Home: __248-555-5555__"

Match: 248-555-5555
--
### Use the result of a group in the search
"The dog chased the cat. The cat chased the mouse. The mouse bit the the dog while the dog chased the cat."
--
### Use the result of a group in the search
/(\w+)\s\1/g

"The dog chased the cat. The cat chased the mouse. The mouse bit __the the__ dog while the dog chased the cat."

Match: the the
Group 1: the (the first one)
--
