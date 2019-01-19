## Loop control
In this section, we will learn two statements that are used to control shell loops−

- The **break** statement

- The **continue** statement

### The infinite Loop

All the loops have a limited life and they come out once the condition is false or true depending on the loop.  A loop may continue forever if the required condition is not met.

A loop that executes forever without terminating executes for an infinite number of times. For this reason, such loops are called infinite loops.

Example
Here is a simple example that uses the while loop to display the numbers zero to nine −
```
#!/bin/sh

a=10

until [ $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
```

This loop continues forever because a is always greater than or equal to 10
and it is never less than 10.




## Command substitution

Command substitution is the mechanism by which the shell performs a given set of commands and then substitutes their output in the place of the commands. When performing the command substitution make sure that you use the backquote, not the single quote character.

Syntax
The command substitution is performed when a command is given as −

`command`

### Example
Command substitution is generally used to assign the output of a command to a variable. Each of the following examples

```
#!/bin/sh

DATE=`date`
echo "Date is $DATE"

USERS=`who | wc -l`
echo "Logged in user are $USERS"

UP=`date ; uptime`
echo "Uptime is $UP"
```
