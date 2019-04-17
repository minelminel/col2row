# col2row
### a very hack-y solution to reshaping

-
*function will output 'char' no matter the input type*

-
Matlab uses a column-down index reference when transforming arrays. We may have a column of differing length values stored as chars, or ints, that we collect from a stream of non-delimited uint8. We now require a simple mechanism of reshaping while ensuring that appropriate padding is present.
The inverse operation is trivial, as we simply access through a split(length) function

-
It should be noted this is essentially just a decorator for the documented char(reshape(array)) function, and is not optimized for multithreading within the native environment. For *very very* long inputs, ie. Hard drive volume encrypts, performance may be non-ideal.

col2row(column), where column is of format:
- char
padding:  *single blank space*
- double
padding:  *zeros*
- uint8
padding:  *zeros*
- logical
*single bit, no pad*

function will **Pass** on error and print warning, returning **self(input)**

This is a result of several bit of boilerplate I found myself needing throughout the development of some basic encryption experiments, where bit length conformity was a necessity with errors raised.


### Recipes
###### case 'char'
```
str = char("hello")
hex = dec2hex(str)
row = col2row(hex)

>> str =
>>    'hello'
>> hex =
>>  5×2 char array
>>    '68'
>>    '65'
>>    '6C'
>>    '6C'
>>    '6F'
>> row =
>>    '68656C6C6F'
```

###### case 'double'
```
% we pick a string that converts to binary
% values with preceding zeros

str = char("$ymb1")
bin = str2num(dec2bin(str))
row = col2row(bin)

>> str =
>>     '$ymb1'
>> bin =
>>       100100
>>      1111001
>>      1101101
>>      1100010
>>       110001
>> row =
>>     '01001001111001110110111000100110001'
```


###### case 'uint8'
```
nums = uint8('hell0')'
row = col2row(nums)

>> nums =
>>   5×1 uint8 column vector
>>    104
>>    101
>>    108
>>    108
>>     48
>> row =
>>     '104101108108048'
```


###### type == 'logical'
```
you get the idea
```












<!--  -->
