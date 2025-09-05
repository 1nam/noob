#!/bin/bash

# List of commands and their explanations
commands=(
  "ls: Lists the contents of a directory."
  "pwd: Prints the current working directory."
  "cat filename.txt: Displays the content of a file."
  "echo Hello World: Prints 'Hello World' to the terminal."
  "rm file.txt: Deletes the specified file."
  "cp file1.txt file2.txt: Copies content from file1.txt to file2.txt."
  "man ls: Displays the manual (help) for the 'ls' command."
)

# Pick a random command from the list
random_command="${commands[$RANDOM % ${#commands[@]}]}"

# Output the random command and its description
echo "Command: ${random_command%%:*}"
echo "Explanation: ${random_command#*:}"
echo ""
echo "Type this command in the terminal to try it out!"
