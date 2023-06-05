import Cocoa

//Function parameter with default values
func printNumbers(from:Int,to:Int=100){
    if from > to {
        print("Invalid range")
        return
    }
    for index in from...to{
        print(index)
    }
}
printNumbers(from: 98,to: 103)
printNumbers(from: 101)


//error handling
enum CalculationError: Error {
    case divisionByZero
    case invalidInput
    case outOfRange
}

func performCalculation(_ value: Int) throws {
    if value == 0 {
        throw CalculationError.divisionByZero
    } else if value < 0 {
        throw CalculationError.invalidInput
    } else if value > 100 {
        throw CalculationError.outOfRange
    } else {
        let result = 100 / value
        print("Result: \(result)")
    }
}

func handleErrors() {
    let values = [50, 0, -10, 150]
    
    for value in values {
        do {
            try performCalculation(value)
        } catch CalculationError.divisionByZero {
            print("Error: Division by zero is not allowed.")
        } catch CalculationError.invalidInput {
            print("Error: Invalid input. Only positive values are allowed.")
        } catch CalculationError.outOfRange {
            print("Error: Value is out of range. It should be between 0 and 100.")
        } catch {
            print("An unknown error occurred.")
        }
    }
}

handleErrors()

//forced try
enum CustomError: Error {
    case exampleError
}

func performTask() throws {
    throw CustomError.exampleError
}

// Using try!
//let result = try! performTask()
//print("Result: \(result)")

// Using try?
let result1 = try? performTask()
if let unwrappedResult = result1 {
    print("Result: \(unwrappedResult)")
} else {
    print("An error occurred.")
}


//task
enum sqrtError:Error{
    case outOfBOunds
    case noRoot
}
func findSquareRoot(of number:Int)throws -> Int{
    if number < 1 || number > 10_000{
        throw sqrtError.outOfBOunds
    }else if number == 1{
        return 1
    }else{
        for index in 2...number/2{
            if index * index == number{
                print("SQRT of \(number) is \(index)")
                return index
            }
        }
        throw sqrtError.noRoot
    }
}

do{
    try findSquareRoot(of: 1)

}catch{
    print(error)
}
do{
    try findSquareRoot(of: 100)
}catch{
    print(error)
}
do{
    try findSquareRoot(of: 1000000)
}catch{
    print(error)
}

