//
//  BubbleSort.swift
//  LogicalReasoning
//
//  Created by Anand Upadhyay on 21/12/22.
//

import Foundation

struct BubbleSort{
    
    func bubbleSort(_ array: [Int]) -> [Int] {
            var arr = array
            for _ in 1..<arr.count{
                for j in 0..<arr.count-1{
                    if(arr[j]>arr[j+1]){
                        let temp = arr[j]
                        arr[j] = arr[j+1]
                        arr[j+1] = temp
                    }
                }
            }
            return arr
    }
}
