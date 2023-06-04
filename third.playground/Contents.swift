
var k = 9
for number in 10...50 where number % 2 != 0 {
    if (number + k) % 2 == 0 {
        k += 2
        print(k)	
    }
    else {
        print("next")
    }
}
// Или так
k=9
for number in stride(from: 11, to: 50, by: 2) {
    if (number + k) % 2 == 0 {
        k = k+2
        print(k)
    }
    else {print("next")}
}
// Вот, чтобы красиво было и дошли до некст = 9
k=9
for number in 10...50 {
    if (number + k) % 2 == 0 {
        k += 2
        print(k)
    }
    else {
        print("next")
    }
}
// Но нужно убрать условие, что ходим только по нечетным
// lets  commit
