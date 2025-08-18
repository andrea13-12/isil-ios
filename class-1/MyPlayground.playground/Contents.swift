//var e usa para definir variables
// let = constante


//declarcion impricita|| swift deduce el tipo de dato por el valor asignado
var greeting = "Hello, playground"

//age:int || entero
var age = 23

// una Constante se quedara co ese valor par sienpre
let name = "Jorge Antonio"

//declaracion explicita : se indica el tipo de dato
let apples: Int
apples = 10

//Manejo de cadenas
let orange = 15

//para juntar un int dentro de una cadena

let appleSumary = "I have " + String(apples) + " apples."
let orangeSumary = "I have  \(orange)  orange."
let fruitSumary =  "I have  \(orange + apples)  fruits."

//array conjiunto de elementos del ismo tipo
var names = ["Carlos","Alberto","Ana", "Maria"]
names.append("Luisa")

//bucle
for name in names{
    print(name)
}

//funciones
func add(number1: Int, number2: Int) -> Int{  //para que retorne un INT se coloca ->
     number1 + number2 //se puede omitir colocarle return
    
}

add(number1: 50, number2: 36)

func multiply(_ number1:Int, with number2:Int) -> Int{
    number1 * number2
}

multiply(5, with: 9)

func multiply(_ number1:Int, _ number2:Int) -> Int{
    number1 * number2
}

multiply(8, 3)


//cloures = bloque de codigo o funcion anonima
//basic cloures
let sayHi = {
    print("Hi, ISIL ")
}

sayHi()

//extrincica
let saidHI: () -> () = {
    print("Hi, ISIL ")
}

saidHI()


//closures con retornos y psrametros
typealias Operation = (Int, Int) -> Int


let sum: (Int, Int) -> Int
sum = { a, b in
    
    return a + b
    
}

sum(5, 6)

let multiplication: (Int, Int) -> Int
multiplication = {
    $0 * $1
}

multiplication(8,6)

//use operetion insted of type all the fuction
let rest: Operation
rest = {
    $0 - $1
}

rest(5,1)

//closure as a parameter of a fuction
func performOperation(a: Int, b: Int, operation: Operation) -> Int{
    return operation(a, b)
}

performOperation(a: 7, b: 5) { a, b in
    a-b
}

performOperation(a: 8, b: 4, operation: sum)

performOperation(a: 50, b: 66, operation: multiplication)
//var e usa para definir variables
// let = constante


//declarcion impricita|| swift deduce el tipo de dato por el valor asignado
var greeting = "Hello, playground"

//age:int || entero
var age = 23

// una Constante se quedara co ese valor par sienpre
let name = "Jorge Antonio"

//declaracion explicita : se indica el tipo de dato
let apples: Int
apples = 10

//Manejo de cadenas
let orange = 15

//para juntar un int dentro de una cadena

let appleSumary = "I have " + String(apples) + " apples."
let orangeSumary = "I have  \(orange)  orange."
let fruitSumary =  "I have  \(orange + apples)  fruits."

//array conjiunto de elementos del ismo tipo
var names = ["Carlos","Alberto","Ana", "Maria"]
names.append("Luisa")

//bucle
for name in names{
    print(name)
}

//funciones
func add(number1: Int, number2: Int) -> Int{  //para que retorne un INT se coloca ->
     number1 + number2 //se puede omitir colocarle return
    
}

add(number1: 50, number2: 36)

func multiply(_ number1:Int, with number2:Int) -> Int{
    number1 * number2
}

multiply(5, with: 9)

func multiply(_ number1:Int, _ number2:Int) -> Int{
    number1 * number2
}

multiply(8, 3)


//cloures = bloque de codigo o funcion anonima
//basic cloures
let sayHi = {
    print("Hi, ISIL ")
}

sayHi()

//extrincica
let saidHI: () -> () = {
    print("Hi, ISIL ")
}

saidHI()


//closures con retornos y psrametros
typealias Operation = (Int, Int) -> Int


let sum: (Int, Int) -> Int
sum = { a, b in
    
    return a + b
    
}

sum(5, 6)

let multiplication: (Int, Int) -> Int
multiplication = {
    $0 * $1
}

multiplication(8,6)

//use operetion insted of type all the fuction
let rest: Operation
rest = {
    $0 - $1
}

rest(5,1)

//closure as a parameter of a fuction
func performOperation(a: Int, b: Int, operation: Operation) -> Int{
    return operation(a, b)
}

performOperation(a: 7, b: 5) { a, b in
    a-b
}

performOperation(a: 8, b: 4, operation: sum)

performOperation(a: 50, b: 66, operation: multiplication
