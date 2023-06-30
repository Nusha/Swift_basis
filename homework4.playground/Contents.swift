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
// ***
//Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность.
//Должностей пока может быть две: или кассир, или повар.
//Добавить в класс пиццерии массив с работниками.
//
//Создать класс столика. В нём должны быть свойство, в котором содержится количество мест, и функция, которая на вход принимает количество гостей, которое хотят посадить, возвращает true, если места хватает, и false, если места не хватает. Изначальное количество мест задаётся в инициализаторе.
//Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.

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

struct Employee: CustomStringConvertible {
    enum Position {
    case cashier
    case cook
    }
    var name: String
    var salary: Double
    var position: Position
    var description: String {
        let empName = String(describing: name)
        let positionString = String(describing: position)
        return "Employee(name: \(empName), position: \(positionString), salary: \(salary))"
    }
    
}

class Table {
    var capacity: Int
    weak var cafe: Pizzeria?
    
    init(capacity: Int, cafe: Pizzeria?) {
        self.capacity = capacity
        self.cafe = cafe
    }
    func checkAvailability(forGuests guests: Int) -> Bool {
            return guests <= capacity
        }
}

class Pizzeria {
    private var menu: [MenuItem] = []
    private var employees: [Employee] = []
    fileprivate var tables: [Table] = []
    init(menu: [MenuItem], employees: [Employee], tables: [Table]) {
        self.menu = menu
        self.employees = employees
        self.tables = tables
    }

    func addMenuItem(_ item: MenuItem) {
        menu.append(item)
    }

    func getAllItems() -> [String] {
        return menu.map({ String(describing: $0) })
    }
    func addEmployee(_ employee: Employee) {
            employees.append(employee)
        }

        func getAllEmployees() -> [Employee] {
            return employees
        }

    func addTable(_ capacity: Int) {
            let table = Table(capacity: capacity, cafe: self)
            tables.append(table)
        }

        func getAllTables() -> [Table] {
            return tables
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

let employee1 = Employee(name: "Маша", salary: 25000, position: .cashier)
let employee2 = Employee(name: "Коля", salary: 45000, position: .cook)
let employee3 = Employee(name: "Вася", salary: 23000.99, position: .cashier)

let table1 = Table(capacity: 4, cafe: nil)
let table2 = Table(capacity: 8, cafe: nil)



let mario = Pizzeria(menu: [margheritaPizza, pepperoniPizza], employees: [employee1, employee2], tables: [table1, table2])

mario.addMenuItem(frenchFries)
mario.addEmployee(employee3)
mario.addTable(5)
let table3 = mario.tables.last



mario.open()

let allItems = mario.getAllItems()
for item in allItems {
    print(item)
}

let allEmployees = mario.getAllEmployees()
for employee in allEmployees {
    print(employee)
}

let allTables = mario.getAllTables()
for (index, table) in allTables.enumerated() {
    print("Table#: \(index+1), capacity: \(table.capacity)")
}

print(table1.checkAvailability(forGuests: 5), table1.capacity)
print(table3!.checkAvailability(forGuests: 5), table3!.capacity)


////Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания
//func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
//    return a - b
//}
//let res = subtract(10, 5.5)
//print("Результат: ", res)
