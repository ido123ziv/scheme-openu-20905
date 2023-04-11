# prefix-output-explained
the main goal is to convert the expression to an AST.     
For example, the expression: `(- - 3 2 - 4 - 12 7)`
Is translated to the tree:
```console
      -
    /   \
  -       -  
 / \     / \
3   2   4   -
           / \
          12  7
```