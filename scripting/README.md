


# Shell scripting
A shell is a command-line interpreter and typical operations performed by shell scripts include file manipulation, program execution, and printing text.

A shell script is a computer program designed to be run by the Unix/Linux shell which could be one of the following:

- The Bourne Shell
- The C Shell
- The Korn Shell
- The GNU Bourne-Again Shell

## Shell Variables
Shell variables in Unix are a character string that the developer can be assigned a value. The value assigned could be a number, text, filename, device, or any other type of data.

In fact, a variable is nothing more than a pointer to the actual data. The shell enables you to create, assign, and delete variables.

### Variable Names
The name of a variable can contain only letters (a to z or A to Z), numbers ( 0 to 9) or the underscore character ( _ ).  By convention, Unix shell variables will have their names in UPPERCASE.

The following examples are valid variable names −
 -
 -

## Operators

There are various operators supported by each shell. However for this discuss we will focus on the Bourne shell. Here are the following available operators
− Arithmetic Operators
- Relational Operators
- Boolean Operators
- String Operators
- File Test Operators

Here are a few

### Arithmetic Operators

| Operator      |	Description   |	Example |
| ------------- | ------------- | ------- |
| + (Addition)    |	Adds values on either side of the operator |	`expr $a + $b` will give 30 |
| - (Subtraction) |	Subtracts right hand operand from left hand operand	 | `expr $a - $b` will give -10 |
| * (Multiplication) |	Multiplies values on either side of the operator | 	`expr $a \* $b` will give 200 |
| = (Assignment) |	Assigns right operand in left operand	 | a = $b would assign value of b into a
| == (Equality)	 | Compares two numbers, if both are same then returns true. |	[ $a == $b ] would return false. |
| != (Not Equality) |	Compares two numbers, if both are different then returns true. |	[ $a != $b ] would return true. |

> It is very important to understand that all the conditional expressions should be **inside square braces** with spaces around them,
> for example [ $a == $b ] is correct
> while [$a==$b] is **incorrect.**


### Relational Operators
Bourne Shell supports the following relational operators that are specific to numeric values. These operators do not work for string values unless their value is numeric.

For example, following operators will work to check a relation between 10 and 20 as well as in between "10" and "20" but not in between "ten" and "twenty".

Assume variable a holds 10 and variable b holds 20 then −

Show Examples


| Operator	 | Description | 	Example |
| ------------- | ------------- | ------- |
| -eq	| Checks if the value of two operands are equal or not; if yes, then the condition becomes true. |	[ $a -eq $b ] is not true.
| -ne	| Checks if the value of two operands are equal or not; if values are not equal, then the condition becomes true.	 | [ $a -ne $b ] is true. |
| -gt	| Checks if the value of left operand is greater than the value of right operand; if yes, then the condition becomes true.	 | [ $a -gt $b ] is not true. |
| -lt	| Checks if the value of left operand is less than the value of right operand; if yes, then the condition becomes true. |	[ $a -lt $b ] is true. |
| -ge	| Checks if the value of left operand is greater than or equal to the value of right operand; if yes, then the condition becomes true. |	[ $a -ge $b ] is not true. |
| -le |	Checks if the value of left operand is less than or equal to the value of right operand; if yes, then the condition becomes true.	| [ $a -le $b ] is true. |


## String Operators
The following string operators are supported by Bourne Shell.

Assume variable a holds **"abc"** and
variable b holds **"efg"** then −

Show Examples

| Operator |	Description	| Example |
| ------------- | ------------- | ------- |
| =	Checks if the value of two operands are equal or not; if yes, then the condition becomes true.	[ $a = $b ] is not true. |
| !=	Checks if the value of two operands are equal or not; if values are not equal then the condition becomes true.	| [ $a != $b ] is true. |
| -z	Checks if the given string operand size is zero; if it is zero length, then it returns true. |	[ -z $a ] is not true. |
| -n	Checks if the given string operand size is non-zero; if it is nonzero length, then it returns true.	 | [ -n $a ] is not false. |
| str |	Checks if str is not the empty string; if it is empty, then it returns false. | [ $a ] is not false. |



## File Test Operators
Here are few operators that can be used to test various file properties associated with a Unix file.

The examples below assume a variable file holds an existing file name **"test"** which is 100 bytes in size and has read, write and execute permissions.

| Operator |	Description |	Example     |
| ------------- | ------------- | ------- |
| -d file	 | Checks if file is a directory; if yes, then the condition becomes true. |	[ -d $file ] is not true. |
| -f file	 | Checks if file is an ordinary file as opposed to a directory or special file; if yes, then the condition becomes true. |	[ -f $file ] is true. |
| -r file	 | Checks if file is readable; if yes, then the condition becomes true. |	[ -r $file ] is true. |
| -w file |	Checks if file is writable; if yes, then the condition becomes true.	 | [ -w $file ] is true. |
| -x file |	Checks if file is executable; if yes, then the condition becomes true. |	[ -x $file ] is true. |
| -s file |	Checks if file has size greater than 0; if yes, then condition becomes true. |	[ -s $file ] is true. |
| -e file	Checks if file exists; is true even if file is a directory but exists. |	[ -e $file ] is true. |
