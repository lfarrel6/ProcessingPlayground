## Visualisation of the [Collatz Conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture)

The sketch generates the sequence of steps from a given number to reach one, storing them in a list.
The list is reversed to start with 1, and end with the original number.
This list is then used to create a visualisation.
  - For each number in the list, a line of constant distance is drawn.
    - If the number is odd the line draws after a rotation to the left. (-angle)
    - If the number is even the line draws after a rotation to the right. (+angle)
    
By making the lines slightly transparent, the more prevalent 'subsequences' are made brighter.
