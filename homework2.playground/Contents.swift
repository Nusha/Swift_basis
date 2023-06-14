//Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент — это годовой процент, третий аргумент — это срок функция возвращает сколько денег получит пользователь по итогу.
import Foundation
func calcInterest(ammount: Double, interest: Double, days: Double) ->  Double {
    let result = ammount+(ammount*days*interest/100/365.00)
    return result
}
var summ = calcInterest(ammount: 4200000, interest: 11, days:365 )
var ammount: Double = 4200000
print(String(format: "%.2f", summ))
print(summ - ammount)

//Создать перечисление, которое содержит 3 вида пиццы, и создать переменные с каждым видом пиццы.

enum Pizza: String {
    case margretha = "Марго"
    case meat
    case pepperoni
}
//Добавить возможность получения названия пиццы через rawValue.

var myMargretha = Pizza.margretha.rawValue
var myPepperony = Pizza.pepperoni
var myMeat = Pizza.meat

print(myMargretha, myPepperony)
//Git committ!
