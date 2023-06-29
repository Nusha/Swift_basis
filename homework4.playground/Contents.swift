import Foundation
enum Topping {
    case pepperoni
    case tomatoes
    case cheese
    case pineapple
}
enum Crust {
    case thin
    case thick
}
struct 	Pizza : CustomStringConvertible {
    enum PizzaType {
        case margherita
        case pepperoni
        case hawaiian
        case vegetarian
        case meat}
    let price: Double
    let type: PizzaType
    let crusts: [Crust]
    let toppings: [Topping]
    var description: String {
           let typeName = String(describing: type)
           let crustsString = crusts.map({ String(describing: $0) }).joined(separator: ", ")
           let toppingsString = toppings.map({ String(describing: $0) }).joined(separator: ", ")
           
           return "Pizza(price: \(price), type: \(typeName), crusts: [\(crustsString)], toppings: [\(toppingsString)])"
       }
}

class Pizzeria {
    private var pizzas: [Pizza]
    
    init(pizzas: [Pizza]) {
        self.pizzas = pizzas
    }
    func addPizza(price: Double, type: Pizza.PizzaType, crusts: [Crust], toppings: [Topping]) {
        let pizza = Pizza(price: price, type: type, crusts: crusts, toppings: toppings)
        pizzas.append(pizza)
    }
    func getAllPizzas() -> [Pizza] {
        return pizzas
    }
}

    let margheritaPizza = Pizza(price: 600, type: .margherita, crusts: [.thin], toppings: [.cheese, .tomatoes])
    let pepperoniPizza = Pizza(price: 590, type: .pepperoni, crusts: [.thick], toppings: [.cheese, .pepperoni])

    let mario = Pizzeria(pizzas: [margheritaPizza, pepperoniPizza])

    mario.addPizza(price: 700, type: .hawaiian, crusts: [.thin], toppings: [.cheese, .tomatoes, .pineapple])

    let allPizzas = mario.getAllPizzas()
    print(allPizzas)

	
