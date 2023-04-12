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
# poly explained
let's take a look on the solution:        
```scheme
(define-datatype poly poly?
  (zero)
  (make-poly 
   (a integer?)
   (n integer?))
  (add-poly
   (q_x poly?)
   (t_x poly?)))
```
the predicate `poly?` is asking if the input is poly.       
each of the expressions is like a builder, that racket will choose from with some sort of a switch case. Let's write it in Java to better understand:
```java
public class poly{
    protected int a;
    protected int b;
    protected LinkedList<Poly> listOfPoly = new LinkedList<Poly>();

    public Poly(){
      this.a = 0;
      this.b = 0;
    }

    public Poly(int a, int b){
      this.a = a;
      this.b = b;
    }

    public Poly(Poly q_x, Poly p_x){
      this.listOfPoly.add(q_x);
      this.listOfPoly.add(p_x);
    }
}
```
The idea is that the `define-datatype` is a keyword to define structs in the programming language much like in c, similar to:
```python
my_obj = {}
```