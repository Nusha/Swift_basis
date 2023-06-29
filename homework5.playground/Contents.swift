
protocol MenuItem {
    var price: Double { get }
    var item: String { get }
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

let margheritaPizza = Pizza(item: "Маргарита", price: 600, type: .margherita, crusts: [.thin], toppings: [.cheese, .tomatoes])
let pepperoniPizza = Pizza(item: "Пепперони", price: 590, type: .pepperoni, crusts: [.thick], toppings: [.cheese, .pepperoni])
let frenchFries = Fries(price: 250, item: "Картошка фри")

let mario = Pizzeria(menu: [margheritaPizza, pepperoniPizza])

mario.addMenuItem(frenchFries)

let allItems = mario.getAllItems()
for item in allItems {
    print(item)
}

