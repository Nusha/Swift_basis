// Almost the same, that previous task. Sorry I'm tired with virtual mac, that s why didn't switched to russian
var k = 9
for number in 10...50 where number % 2 != 0 {
    if (number + k) % 2 == 0 {
        k += 1
        print(k)
    }
    else {
      print("next")
      print("iteration finished" )
      break
      
    }
}

// Или так
k=9
for number in stride(from: 11, to: 50, by: 2) {
    if (number + k) % 2 == 0 {
        k = k+1
        print(k)
    }
    else {print("next")
        print("iteration finished" )
        break    }
}

// for committ
