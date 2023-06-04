for number in 0 ... 100 where number % 2 == 0 {
print(number)}
// Как вариант
for number in stride(from: 0, to: 102, by: 2) {
    print(number)
}
//Еще вариант
var numbers = [Int]()
for number in 0 ... 100 {
    if (number % 2 == 0) {
        numbers.append(number)
    }
}
    print(numbers)

