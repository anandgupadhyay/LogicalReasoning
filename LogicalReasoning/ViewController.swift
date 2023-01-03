//
//  ViewController.swift
//  LogicalReasoning
//
//  Created by Anand Upadhyay on 21/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print("\n====================\n")
//        findAngelOfHourandMinute()
//        print("\n====================\n")
//        testArrayAsHeapTreePrint();
//        print("\n====================\n")
//        testBubbleSort()
          print("\n====================\n")
//          testBinaryTree()
        
        print("Square root:\(getSquareroot(number: 16))")
        let number = 15
        print("is \(number) is a perfecte Square:\(isPerfectSquare(number: number) ? "YES" : "NO")")
        
        let stringArray1 = ["Anand", "Niti", "Foram"]
        let stringArray2 = ["Anand", "Upadhyay", "Niti"]
        let stringArray3 = combine(stringArray1,stringArray2)
        print("Combined Array:\(stringArray3)")
        let sortedNames = stringArray3.sorted{
            $0.count > $1.count
        }
        print("Sorted: \(sortedNames)")
        print(String(format: "-%04d-", 55))
        print(String(format: "-%.2f-", 55.533245))

        let array: [Any] = [1,2,3,4,"5"]
        let square = array.map{ return $0 as? Int}
        print(square)
        
//        Contextual closure type '(Any) throws -> Int' expects 1 argument, but 2 were used in closure body
        
//        //Kangaroo Jump
//        let x1 = 4
//        let v1 = 2
//        let x2 = 0
//        let v2 = 3
//
//        if x1<x2 && v1<v2 {
//            print("NO")
//        }else if v1 != v2 && ((x2-x1)%(v2-v1) == 0){
//            print("YES")
//        }else{
//            print("NO")
//        }
    }
    
    func combine<T>(_ arrays: Array<T>?...) -> Set<T> {
        return arrays.compactMap{$0}.compactMap{Set($0)}.reduce(Set<T>()){$0.union($1)}
    }

    func testArrayAsHeapTreePrint(){
        let values = [7,5,9,1,6]
        values.printHeapTree()
    }
    
    func findAngelOfHourandMinute(){
        let clock1 = Clock(h: 16, m: 64)
        print("Angle of \(clock1.hour) and \(clock1.minute) is \(clock1.calculateAngel())")
    }
    
    func testBubbleSort(){
        let buble = BubbleSort()
        print(buble.bubbleSort([5,2,7,3,9,1,4]))
    }
    
    func testBinaryTree(){
//        var node1 = BinaryTree(value: 1)
//        var node2 = BinaryTree(value: 2)
//        var node3 = BinaryTree(value: 3)
//        var node4 = BinaryTree(value: 4)
//        var node5 = BinaryTree(value: 5)
//        var node6 = BinaryTree(value: 6)
//        var node7 = BinaryTree(value: 7)
//        var node8 = BinaryTree(value: 8)
//        var node9 = BinaryTree(value: 9)
        let node10 = BinaryTree(value: 10)
        node10.insert(value: 9)
        node10.insert(value: 11)
        node10.insert(value: 8)
        node10.insert(value: 12)
        node10.insert(value: 7)
        node10.insert(value: 6)
        node10.insert(value: 13)
        node10.insert(value: 14)
        
        node10.printTree(prefix: "|", isLeft: false, node: node10)
    }
    
    func getSquareroot(number: Int)->Int{
        // Base cases
        if number == 0 || number == 1 {
                    return number;
        }
         
        // Starting from 1, try all numbers until
        // i*i is greater than or equal to x.
        var i = 1
        var result = 1
        while (result <= number) {
            i+=1;
            result = i * i;
        }
        return i - 1;
    }
    
    func isPerfectSquare(number: Int) ->Bool{
        if(number>=0){
            let sqr = getSquareroot(number: number)
            return ((sqr*sqr) == number)
        }
        return false
    }
}


