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

A search pattern used to match text.
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

"The dog chased the cat. The cat chased the mouse. The mouse bit the dog while __the dog chased the cat.__"
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
__i__ - case insensitive

__g__ - global matching, instead of find first
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
__(__ and __)__ - a group

__|__ - or
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
__\\b__ - word boundary, includes spaces and punctuations.
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
__.__ - any character
--
### A little lie
/The dog chased the cat__.__/

"__The dog chased the cat.__ The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
--
### A little lie
/The dog chased the cat__.__/

"__The dog chased the cate__rpillar. The cat chased the mouse. The mouse bit the dog while the dog chased the cat."
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
__*__ - 0 or more

__+__ - 1 or more
--
### + vs *
/img (.*)/ will match "img "

/img (.+)/ will not match "img " but will match "img cat"
--
### * Example
/the .*/gi

"__The mouse bit the dog over there, while the dog chased the cat.__"
--
### Most Important Rule
__Regular Expressions will match the longest possible solution__
--
### Use our word boundaries
/the \b.+\b/gi

"__The mouse__ bit __the dog__ over there, while __the dog__ chased __the cat__."
--
### Find all the mice
The hungry mouse bit the dog. The dog barked at the mouse.
--
### Find all the mice
/the .* mouse/i

__The hungry mouse bit the dog. The dog barked at the mouse__.
--
### Don't be so greedy
/the .*? mouse/i

__The hungry mouse__ bit the dog. The dog barked at the mouse.
--
### Don't be so greedy
/the .*? mouse/__g__i

__The hungry mouse__ bit __the dog. The dog barked at the mouse__.
--
### Lazy matchers
__*?__ - 0 or more, fewest characters possible

__+?__ - 1 or more, fewest characters possible
--
### Multiple lines
The dog chased the cat. 
The cat chased the mouse. 
The mouse bit the dog while the dog chased the cat.
--
### Multiple lines
/.*/

__The dog chased the cat.__   
The cat chased the mouse.  
The mouse bit the dog while the dog chased the cat.
--
### m flag
/.*/m

__The dog chased the cat.__   
__The cat chased the mouse.__  
__The mouse bit the dog while the dog chased the cat.__
--
### Start and End of lines
__^__ - start of line

__$__ - end of line
--
### Start and End of lines
/^The .* cat\\.$/

__The dog chased the cat.__   
The cat chased the mouse.  
__The mouse bit the dog while the dog chased the cat.__
--
### Expected characters
__.__ matches any character including spaces, letters, numbers, punctuation, etc...

Credit Cards only have numbers  
Phone numbers have numbers (and some have letters)  
Names only have letters
--
### Expected characters
__[__ and __]__ - a range of values to match

[0123456789] - only numbers accepted  
[abcdefghijklmnopqrstuvwxyz]  
--
### Shorthand
__[__ and __]__ - a range of values to match

[0-9] - only numbers accepted  
[a-z] and [A-Z] - lowercase and uppercase
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
### Unicode characters
__\\u00A9__	- ©
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
### What if they don't use __-__
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
__i__ - case insensitive  
__g__ - global matching  
__m__ - '.' matches across lines

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
### Review thus far
__*?__ - 0 or more, fewest characters possible  
__+?__ - 1 or more, fewest characters possible  

__^__ - start of line  
__$__ - end of line
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
"The mouse bit the the dog while the dog chased the cat."
--
### Use the result of a group in the search
/(\w+)\s\1/g

"The mouse bit __the the__ dog while the dog chased the cat."

Match: the the
Group 1: the (the first one)
--
### Review
__(abc)__ - a capture group  
__(?:abc)__ - a non-capture group  
__(?=abc)__ - positive lookahead  
__(?!abc)__ - negatvie lookahead

Groups are counted __(__ from left to right
### Questions
--
### URL Example
_^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?!10(?:\\.\d{1,3}){3})(?!127(?:\\.\d{1,3}){3})(?!169\\.254(?:\\.\d{1,3}){2})(?!192\\.168(?:\\.\d{1,3}){2})(?!172\\.(?:1[6-9]|2\d|3[0-1])(?:\\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\\.(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\\.(?:[a-z\x{00a1}-\x{ffff}]{2,})))(?::\d{2,5})?(?:/[^\s]*)?$_iuS
--
### URL Example
/^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?!10(?:\\.\d{1,3}){3})(?!127(?:\\.\d{1,3}){3})(?!169\\.254(?:\\.\d{1,3}){2})(?!192\\.168(?:\\.\d{1,3}){2})(?!172\\.(?:1[6-9]|2\d|3[0-1])(?:\\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\\.(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\\.(?:[a-z\x{00a1}-\x{ffff}]{2,})))(?::\d{2,5})?(?:/[^\s]*)?$/iuS
--
### URL Example
/^(?:(?:https?|ftp)://)(?:\S+(?::\S*)?@)?(?:(?!10(?:\\.\d{1,3}){3})(?!127(?:\\.\d{1,3}){3})(?!169\\.254(?:\\.\d{1,3}){2})(?!192\\.168(?:\\.\d{1,3}){2})(?!172\\.(?:1[6-9]|2\d|3[0-1])(?:\\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(?:\\.(?:[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(?:\\.(?:[a-z\x{00a1}-\x{ffff}]{2,})))(?::\d{2,5})?(?:/[^\s]*)?$/__iuS__

u - utf8  
S - optimization
--
### Ignore Capture Groups
/^(__?:__(__?:__https?|ftp)://)(__?:__\S+(__?:__:\S*)?@)?(__?:__(?!10(__?:__\\.\d{1,3}){3})(?!127(__?:__\\.\d{1,3}){3})(?!169\\.254(__?:__\\.\d{1,3}){2})(?!192\\.168(__?:__\\.\d{1,3}){2})(?!172\\.(__?:__1[6-9]|2\d|3[0-1])(__?:__\\.\d{1,3}){2})(__?:__[1-9]\d?|1\d\d|2[01]\d|22[0-3])(__?:__\\.(__?:__1?\d{1,2}|2[0-4]\d|25[0-5])){2}(__?:__\\.(__?:__[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(__?:__(__?:__[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(__?:__\\.(__?:__[a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(__?:__\\.(__?:__[a-z\x{00a1}-\x{ffff}]{2,})))(__?:__:\d{2,5})?(__?:__/[^\s]*)?$/
--
### Start and End Characters
__/^__((https?|ftp)://)(\S+(:\S*)?@)?((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))(:\d{2,5})?(/[^\s]*)?__$/__
--
### URL Example
((https?|ftp)://)(\S+(:\S*)?@)?((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))(:\d{2,5})?(/[^\s]*)?
--
### http, https, ftp
__((https?|ftp)://)__(\S+(:\S*)?@)?((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))(:\d{2,5})?(/[^\s]*)?
--
### username:password@
((https?|ftp)://)__(\S+(:\S*)?@)?__((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))(:\d{2,5})?(/[^\s]*)?
--
### The Domain
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))__|__(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))
--
### Don't match localhost
__((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})__([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))
--
### IP Address
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})__([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))__|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))
--
### Subdomain / Domain
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|__(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)__
(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.([a-z\x{00a1}-\x{ffff}]{2,})))
--
### More Subdomains
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)
__(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*__
(\\.([a-z\x{00a1}-\x{ffff}]{2,})))
--
### .com, .org, .gov, etc...
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*__(\\.([a-z\x{00a1}-\x{ffff}]{2,})))__
--
### Repeated Pattern
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|__(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)(\\.([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+)*(\\.__([a-z\x{00a1}-\x{ffff}]{2,})))
--
### Refactored
((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|__(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+\\.)+__(([a-z\x{00a1}-\x{ffff}]{2,})))
--
### Port
((https?|ftp)://)(\S+(:\S*)?@)?((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+\\.)+(([a-z\x{00a1}-\x{ffff}]{2,})))__(:\d{2,5})?__(/[^\s]*)?
--
### The rest of the URL
((https?|ftp)://)(\S+(:\S*)?@)?((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+\\.)+(([a-z\x{00a1}-\x{ffff}]{2,})))(:\d{2,5})?__(/[^\s]*)?__
--
### \S = [^\s]
((https?|ftp)://)(\S+(:\S*)?@)?((?!10(\\.\d{1,3}){3})(?!127(\\.\d{1,3}){3})(?!169\\.254(\\.\d{1,3}){2})(?!192\\.168(\\.\d{1,3}){2})(?!172\\.(1[6-9]|2\d|3[0-1])(\\.\d{1,3}){2})([1-9]\d?|1\d\d|2[01]\d|22[0-3])(\\.(1?\d{1,2}|2[0-4]\d|25[0-5])){2}(\\.([1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(([a-z\x{00a1}-\x{ffff}0-9]+-?)*[a-z\x{00a1}-\x{ffff}0-9]+\\.)+(([a-z\x{00a1}-\x{ffff}]{2,})))(:\d{2,5})?__(/\S*)?__
--
### Questions ?
--