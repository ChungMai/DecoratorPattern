//: Playground - noun: a place where people can play

import UIKit

protocol IShape{
    func draw() -> String
}


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

class ShapeDecorator : IShape{
    var decoratedShape : IShape
    
    required init(decoratedShape : IShape){
        self.decoratedShape = decoratedShape
    }
    
    func draw() -> String {
        fatalError("Not Implemented")
    }
}

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


let roundRect = RoundedCornerShapeDecorator(decoratedShape: Rectangle())
let roundSquare = RoundedCornerShapeDecorator(decoratedShape: Square())
let message = roundRect.draw()
let messageSquare = roundSquare.draw()
print(message)
print(messageSquare)
