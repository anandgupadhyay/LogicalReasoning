private func willTheClassBeCancelled(test cases: [[[Int]]]){
    for test in cases{
        var studentsOnTime = 0
        for student in test[1] {
            if student <= 0 { studentsOnTime += 1}
        }
        print(studentsOnTime < test[0][1] ? "YES" : "NO")
    }
}

//usage
willTheClassBeCancelled(test: testCases)
