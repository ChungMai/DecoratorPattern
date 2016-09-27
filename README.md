## Decorator Pattern in Swift
  The main object of this pattern is dynamically adding new functionalities to the object. The interface of the object will 
  not be modified. This pattern is a alternative to the addition of a subclass that add a functionalities to its parent class.
  The key implementation poin in the Decorator pattern is that decorators both inherit the original class and contain an
  instantiation of it.
  
## When we use this pattern
  * A system adds dynamically new functionalities to the object, without having to motify its interface, which means without 
  having to motify the clien of the object.
  * A system manages the behavior that can be dynamically removed.
  * The use of inheritance is not good option because of already complex class hierachy.
 
## Implementation
  **Scenario:** Let suppose that you have a drawing software that enables you to draw some shapes on screen: a rectangle and
  a square.And now, you need to improve your system, you need to new functionality that will add a rounded angle to your shape.
  
  * Create a AbstractComponent: This is the common interface to components and decorators.
  We will create the interface that defines the shapes. We will simulate Draw() operation. The function only return a string
  that tell us what is drawn:
  ```swift
  protocol IShape{
    func draw() -> String
  }
```

  * Create ConcreteComponent: This is the main object which we want to add new functionalities/behavior
  We will create two concrete class that implement the *Shape* interface. We will create a Rectangle and Square class. 
  Both of them implement *draw()* method. This function will return what the shape is currently drawn
  ```swift
  class Square:IShape{
    func draw() -> String {
        return "Drawing shape: Square"
    }
  }

  class Rectangle:IShape{
      func draw() -> String{
          return "Drawing shape: Rectangle"
      }
  }
  ```
  
  * Create AbstractDecorator: This abstract class containts a reference to a component
  Now, we prepare our abstract AbstractDecorator class that define the structure of our future concrete decorator. This class 
  implement IShape interface too. The ShapeDecorator is not used by the client itself. The client will call the ConcreteDecorator
  to add the new functionality to its shapes:
  ```swift
  class ShapeDecorator : IShape{
    var decoratedShape : IShape
    
    required init(decoratedShape : IShape){
        self.decoratedShape = decoratedShape
    }
    
    func draw() -> String {
        fatalError("Not Implemented")
    }
  }
  ```
  
  * Create ConcreteDecorator: It is the concrete subclass of AbstractDecorator. The class implement the functionalities added
  to the component.
  We create the concrete decorator class that inherit from ShapeDecorator abstract class. We add a new *setRoundedCornerShape*
  functionality to this class and override the *draw()* function to return the shape that is drawns.
  ```swift
  class RoundedCornerShapeDecorator : ShapeDecorator{
    required init(decoratedShape:IShape){
        super.init(decoratedShape: decoratedShape)
    }
    
    override func draw() -> String {
        return decoratedShape.draw() + " - " + setRoundedCornerShape(decoratedShape: self.decoratedShape)
    }
    
    func setRoundedCornerShape(decoratedShape : IShape) -> String{
        return "Corners are rounded"
    }
  }
  ```
  
  ## Usage:
  * We want to have some shapes with rounded corner. To do this, we simply call the concrete decorate class that we interest,
  the *RoundedCornerShapeDecorator* class and pass new shape (Rectangle or Square) as an argument of the constructor:
  ```swift
  let roundRect = RoundedCornerShapeDecorator(decoratedShape: Rectangle())
  let roundSquare = RoundedCornerShapeDecorator(decoratedShape: Square())
  let message = roundRect.draw()
  let messageSquare = roundSquare.draw()
  print(message)
  print(messageSquare)
  ```
  
  
