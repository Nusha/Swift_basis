//Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить её в виде массива видов чая, которые хотят заказать). Необходимо последовательно выводить в консоль сколько заплатит покупатель (необходимо вывести его номер по порядку, чай, который он заказал и стоимость).
import Foundation

enum TeaType: String, CaseIterable {
    case black = "Черный"
    case green = "Зеленый"
    case fruit = "Фруктовый"
}

let teaMenu: [TeaType: Int] = [.black: 80, .green: 100, .fruit: 120]
let customerQueue: [TeaType] = [.green, .green, .black, .fruit, .green, .black]

for (index, order) in customerQueue.enumerated() {
    let price = teaMenu[order] ?? 0
    print("Покупатель \(index + 1): заказал \(order.rawValue), стоимость - \(price) рублей.")
}

//Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. Необходимо создать новый массив, который будет состоять из элементов старого, но не должно быть nil, не должно быть 0 и 4, а также массив должен быть отсортирован по возрастанию.

var inArray = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]
let sortedArray = inArray.compactMap{$0}.filter{$0 != 0 && $0 != 4}.sorted()
// Наверное решение формально правильное - попала -4, но можно добавить && $0 != -4
print("Sorted:", sortedArray)

//Написать функцию, которая на вход принимает целое число, а возвращает массив, который сформирован по следующим правилам: количество элементов соответствует переданному числу, массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.

func makeArray(number: Int) -> [Int] {
    var result = [Int]()
    
    for i in 1...number {
        let element = Int(pow(2.0, Double(i-1)))
        result.append(element)
    }
    
    return result
}
print("Столько оперативки хочу: ", makeArray(number: 10))
