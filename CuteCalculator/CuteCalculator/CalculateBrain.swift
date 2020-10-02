//
//  CalculateBrain.swift
//  CuteCalculator
//
//  Created by 신효근 on 2020/09/30.
//

import Foundation

class CalculateBrain
{
    private var accumulator = 0.0
    private var internalProgram = [Any]()
    
    func setOperand(operand: Double) {
        accumulator = operand
        internalProgram.append(operand)
    }
    
    func performOperation(symbol:String){
        internalProgram.append(symbol)
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = Pending(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation()
    {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
        }
    }
    private var pending : Pending?
    
    private struct  Pending {
        var binaryFunction : (Double,Double) -> Double
        var firstOperand : Double
    }
    
    typealias Propertylist = AnyObject
        
    var program : Propertylist {
        get{
            return internalProgram as AnyObject
        }
        set{
            clear()
            if let arrayOfOps = newValue as? [AnyObject]{
                for op in arrayOfOps{
                    if let operand = op as? Double{
                     setOperand(operand: operand)
                    } else if let operation = op as? String {
                     performOperation(symbol: operation)
                    }
                }
            }
        }
    }
    
    func clear(){
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var operations : Dictionary<String,Operation> = [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation({$0*$1}),
        "÷" : Operation.BinaryOperation({$0/$1}),
        "+" : Operation.BinaryOperation({$0+$1}),
        "−" : Operation.BinaryOperation({$0-$1}),
        "=" : Operation.Equals
    ]
    //연산자들의 큰 종류다.
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double) -> Double)
        case Equals
    }
    
    var result : Double{
        get{
            return accumulator
        }
    }
    
}
