//
//  DivisibleSumPair.swift
//  LogicalReasoning
//
//  Created by Anand Upadhyay on 03/01/23.
//

import Foundation

func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    // Write your code here
    var count = 0
    for  i in 0..<n-1 {
            for j in i+1...<n {
                if (a[i]+a[j]) % k == 0
                    count +=1;
            }
        }
        print(count)
}
