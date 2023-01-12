// private func willTheClassBeCancelled(test cases: [[[Int]]]){
//     for test in cases{
//         var studentsOnTime = 0
//         for student in test[1] {
//             if student <= 0 { studentsOnTime += 1}
//         }
//         print(studentsOnTime < test[0][1] ? "YES" : "NO")
//     }
// }

// //usage
// willTheClassBeCancelled(test: testCases)

//For single case at a time
func angryProfessor(k: Int, a: [Int]) -> String {
    // Write your code here
    var sOnTime = 0
    for sArrival in a {
        if sArrival <= 0 { sOnTime += 1}
    }
    return (sOnTime < k) ? "YES" : "NO"
    
}

print(angryProfessor(k: 3, a: [-1,-3,4,2]))//YES
print(angryProfessor(k: 2, a: [-0,-1,2,1]))//NO
