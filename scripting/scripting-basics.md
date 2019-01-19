

## Scripting Basics
In shell, there are a few different conditional or (decision making) statements in shell can be used to allow your code to make correct decisions and perform the right actions.

Here are two decision-making statements that we will focus on

  - The if...else statement

  - The case...esac statement

### The if...else statements
If else statements are useful decision-making statements which can be used to select an option from a given set of options.  Unix Shell supports following forms of if…else statement

 > if...fi statement
 > if...else...fi statement
 > if...elif...else...fi statement

### The case...esac Statement
You can use multiple if...elif statements to perform a multiway branch. However, this is not always the best solution, especially when all of the branches depend on the value of a single variable.

Unix Shell supports case...esac statement which handles exactly this situation, and it does so more efficiently than repeated if...elif statements. There is only one form of case...esac statement which has been described in detail here −

> case...esac statement

## Shell Loop Types

A loop is a powerful programming tool that enables you to execute a set of commands repeatedly. In this section we will examine the following types of loops available to shell programmers −

- The while loop
- The for loop
- The until loop
- The select loop

Each loops is often used in different loops based on the situation. For example, the while loop executes the given commands until the given condition remains true; the until loop executes until a given condition becomes true.

Once you have good programming practice you will gain the expertise and thereby, start using appropriate loop based on the situation.

### Example
Here is a simple example of loop nesting. Let's add another countdown loop inside the loop that you used to count to nine −

```
#!/bin/sh

a=0
while [ "$a" -lt 10 ]    # this is loop1
do
   b="$a"
   while [ "$b" -ge 0 ]  # this is loop2
   do
      echo -n "$b "
      b=`expr $b - 1`
   done
   echo
   a=`expr $a + 1`
done
```

This will produce the following result. It is important to note how echo -n works here. Here -n option lets echo avoid printing a new line character.
