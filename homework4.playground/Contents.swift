import Foundation
//enum Topping {
//    case pepperoni
//    case tomatoes
//    case cheese
//    case pineapple
//}
//enum Crust {
//    case thin
//    case thick
//}
//struct 	Pizza : CustomStringConvertible {
//    enum PizzaType {
//        case margherita
//        case pepperoni
//        case hawaiian
//        case vegetarian
//        case meat}
//    let price: Double
//    let type: PizzaType
//    let crusts: [Crust]
//    let toppings: [Topping]
//    var description: String {
//           let typeName = String(describing: type)
//           let crustsString = crusts.map({ String(describing: $0) }).joined(separator: ", ")
//           let toppingsString = toppings.map({ String(describing: $0) }).joined(separator: ", ")
//
//           return "Pizza(price: \(price), type: \(typeName), crusts: [\(crustsString)], toppings: [\(toppingsString)])"
//       }
//}
//
//class Pizzeria {
//    private var pizzas: [Pizza]
//
//    init(pizzas: [Pizza]) {
//        self.pizzas = pizzas
//    }
//    func addPizza(price: Double, type: Pizza.PizzaType, crusts: [Crust], toppings: [Topping]) {
//        let pizza = Pizza(price: price, type: type, crusts: crusts, toppings: toppings)
//        pizzas.append(pizza)
//    }
//    func getAllPizzas() -> [Pizza] {
//        return pizzas
//    }
//}
//
//    let margheritaPizza = Pizza(price: 600, type: .margherita, crusts: [.thin], toppings: [.cheese, .tomatoes])
//    let pepperoniPizza = Pizza(price: 590, type: .pepperoni, crusts: [.thick], toppings: [.cheese, .pepperoni])
//
//    let mario = Pizzeria(pizzas: [margheritaPizza, pepperoniPizza])
//
//    mario.addPizza(price: 700, type: .hawaiian, crusts: [.thin], toppings: [.cheese, .tomatoes, .pineapple])
//
//    let allPizzas = mario.getAllPizzas()
//    print(allPizzas)


//В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
//Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню
//Создайте протокол, в котором будут содержаться функции открытия и закрытия
//Написать расширение для класса пиццерии, в  котором будет реализован протокол из пункта 3


protocol MenuItem {
    var price: Double { get }
    var item: String { get }
}

protocol OpenableCloseble {
    func open()
    func close()
}

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

struct Pizza: CustomStringConvertible, MenuItem {
    var item: String

    enum PizzaType {
        case margherita
        case pepperoni
        case hawaiian
        case vegetarian
        case meat
    }

    let price: Double
    let type: PizzaType
    let crusts: [Crust]
    let toppings: [Topping]

    var description: String {
        let typeName = String(describing: type)
        let crustsString = crusts.map({ String(describing: $0) }).joined(separator: ", ")
        let toppingsString = toppings.map({ String(describing: $0) }).joined(separator: ", ")

        return "Pizza(item: \(item), price: \(price), type: \(typeName), crusts: [\(crustsString)], toppings: [\(toppingsString)])"
    }
}

struct Fries: CustomStringConvertible, MenuItem {
    var price: Double
    var item: String

    var description: String {
        let itemName = String(describing: item)
        return "Fries(item: \(itemName), price: \(price))"
    }
}

class Pizzeria {
    private var menu: [MenuItem] = []

    init(menu: [MenuItem]) {
        self.menu = menu
    }

    func addMenuItem(_ item: MenuItem) {
        menu.append(item)
    }

    func getAllItems() -> [String] {
        return menu.map({ String(describing: $0) })
    }
}

extension Pizzeria : OpenableCloseble {
    func open() {
        print("Пиццерия открыта")
    }
    func close() {
        print("Пиццерия закрыта")
    }
}

let margheritaPizza = Pizza(item: "Маргарита", price: 600, type: .margherita, crusts: [.thin], toppings: [.cheese, .tomatoes])
let pepperoniPizza = Pizza(item: "Пепперони", price: 590, type: .pepperoni, crusts: [.thick], toppings: [.cheese, .pepperoni])
let frenchFries = Fries(price: 250, item: "Картошка фри")

let mario = Pizzeria(menu: [margheritaPizza, pepperoniPizza])

mario.addMenuItem(frenchFries)

mario.open()

let allItems = mario.getAllItems()
for item in allItems {
    print(item)
}

////Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания
func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
    return a - b
}
let res = subtract(10, 5.5) // result1 is of type Int, value is 5
print("Результат: ", res)
