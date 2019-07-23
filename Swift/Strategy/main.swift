//
//  Strategy.swift
//  Swift
//
//  Created by Dohyun Kim on 23/07/2019.
//

import Foundation

// MARK: - Strategy
protocol FlyBehavior {
    func fly()
}

protocol QuackBehavior {
    func quack()
}

// MARK: - Client
protocol Duck {
    // 구성(Composition)
    // 행동을 위임 받는다.
    // A에는 B가 있다.
    var flyBehavior: FlyBehavior { get set }
    var quackBehavior: QuackBehavior { get set }
    
    // Execute Strategy
    func performFly()
    func performQuack()
    func swim()
    func display()
}

extension Duck {
    func performFly() {
        flyBehavior.fly()
    }
    
    func performQuack() {
        quackBehavior.quack()
    }
    
    func swim() {
        print("Floating on water")
    }
}

// MARK: - Concrete Strategy
// 캡슐화된 행동
class FlyWithWings: FlyBehavior {
    func fly() {
        print("Flying")
    }
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("Can't fly")
    }
}

class FlyRocketPowered: FlyBehavior {
    func fly() {
        print("Fly with a rocket")
    }
}

class Quack: QuackBehavior {
    func quack() {
        print("Quack")
    }
}

class Squeak: QuackBehavior {
    func quack() {
        print("Squeak")
    }
}

class MuteQuack: QuackBehavior {
    func quack() {
        print("Slience")
    }
}

// MARK: - Concrete Client
class MallardDuck: Duck {
    var flyBehavior: FlyBehavior
    var quackBehavior: QuackBehavior
    
    init() {
        flyBehavior = FlyWithWings()
        quackBehavior = Quack()
    }
    
    func display() {
        print("\nMallardDuck")
    }
}

class ModelDuck: Duck {
    var flyBehavior: FlyBehavior
    var quackBehavior: QuackBehavior
    
    init() {
        flyBehavior = FlyNoWay()
        quackBehavior = Quack()
    }
    
    func display() {
        print("\nModelDuck")
    }

}

// MARK: - Run
let mallard = MallardDuck()
mallard.display()
mallard.performQuack()
mallard.performFly()
mallard.swim()

let model = ModelDuck()
model.display()
model.performFly()
model.flyBehavior = FlyRocketPowered() // 알고리즘 변경
model.performFly()

/*
 
 Output:
 
 MallardDuck
 Quack
 Flying
 Floating on water
 
 ModelDuck
 Can't fly
 Fly with a rocket
 
 */
