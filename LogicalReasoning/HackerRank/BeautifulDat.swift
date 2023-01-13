//Beautiful day at the movies
//reverse Numer and find differrence if its divisible by k (number of )
let i = 20
let j = 23
let k = 6
let reversI = Int(String(String(i).reversed())) ?? 0
print(reversI)


private func reverseInt(_ number: Int) -> Int {
    var temp = number
    var reversed = 0
    var remainer = 0
    while (temp > 0){
        remainer = temp % 10
        reversed = reversed * 10 + remainer
        temp = temp / 10
    }
    return reversed
}

var count = 0
for i in i...j {
    if  abs(reverseInt(i)-i) % k == 0  {
        count+=1
    }
}
print(count)
