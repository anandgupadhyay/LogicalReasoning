//
//  CompareBinaryTreeForEquality.swift
//  LogicalReasoning
//
//  Created by Anand Upadhyay on 21/12/22.
//

import Foundation

class BinaryTree{
    
    private var value: Int
    private var leftNode: BinaryTree? = nil
    private var rightNode: BinaryTree? = nil
    
    init(value: Int){
        self.value = value
    }
    
    public func nodeValue()->Int{
        return self.value;
    }
    
    @discardableResult
    public func insert(value: Int)->BinaryTree{
        
        if self.value == value // exclude duplicate entries
        { return self }
        else if value < self.value
        {
            //left node
            if let newNode = self.leftNode?.insert(value: value)
            { return newNode }
            self.leftNode = BinaryTree(value: value)
            return self.leftNode!
        }
        else
        {
            //right node
            if let newNode = self.rightNode?.insert(value: value)
            { return newNode }
            self.rightNode = BinaryTree(value: value)
            return self.rightNode!
        }
        //        return self.recursiveInsertNode(newNode: BinaryTree(value: value))
    }
    
//    private func recursiveInsertNode(newNode: BinaryTree)->BinaryTree{
        
        //        if(newNode.value > self.value){
        //
        //            //New node will be on right of root
        //            if((self.rightNode) != nil){
        //                return self.recursiveInsertNode(newNode: newNode)
        //            }else{
        //                self.rightNode = newNode
        //                return newNode
        //            }
        //        }else if (newNode.value < self.value){
        //            //New node will be on left of root
        //            if((self.leftNode) != nil){
        //                return self.recursiveInsertNode(newNode: newNode)
        //            }else{
        //                self.leftNode = newNode
        //                return newNode
        //            }
        //        }else{
        //            //adding value already exists so just returning the same existing note
        //            return self
        //        }
//    }
    
    //Simple Printing a Tree
    func printTree(prefix: String, isLeft: Bool,node: BinaryTree){
        print(prefix, (isLeft ? "|-- " : "\\-- "), node.value)
        if node.leftNode != nil {
            printTree(prefix: "\(prefix) \(isLeft ? "|   " : "   ") ", isLeft: true,node: node.leftNode!)
        }
        if node.rightNode != nil {
            printTree(prefix: "\(prefix) \(isLeft ? "|   " : "   ") ", isLeft: false, node: node.rightNode!)
        }
    }
    
    func isEqual(node1: BinaryTree?, node2: BinaryTree?)->Bool{
        if (node1 == nil && node2 == nil){
            return true
        }else if (node1 == nil || node2 == nil){
            return false
        }else{
            if (node1?.value == node2?.value && isEqual(node1: node1?.leftNode, node2: node2?.leftNode) && isEqual(node1: node1?.rightNode, node2: node2?.rightNode))
            {
                return true
            }else{
                return false
            }
        }
    }
}



/*
 
 bool isSameBSTUtil(int a[], int b[], int n, int i1, int i2,
                    int min, int max)
 {
     int j, k;
  
     /* Search for a value satisfying the
          constraints of min and max in a[] and
          b[]. If the parent element is a leaf
          node then there must be some elements
          in a[] and b[] satisfying constraint. */
     for (j = i1; j < n; j++)
         if (a[j] > min && a[j] < max)
             break;
     for (k = i2; k < n; k++)
         if (b[k] > min && b[k] < max)
             break;
  
     /* If the parent element is leaf in both arrays */
     if (j == n && k == n)
         return true;
  
     /* Return false if any of the following is true
              a) If the parent element is leaf in one array,
                  but non-leaf in other.
              b) The elements satisfying constraints are
                  not same. We either search for left
                  child or right child of the parent
                  element (decided by min and max values).
                  The child found must be same in both arrays */
     if (((j == n) ^ (k == n)) || a[j] != b[k])
         return false;
  
     /* Make the current child as parent and
          recursively check for left and right
          subtrees of it. Note that we can also
          pass a[k] in place of a[j] as they
          both are same */
     return isSameBSTUtil(a, b, n, j + 1, k + 1, a[j], max)
            && // Right Subtree
            isSameBSTUtil(a, b, n, j + 1, k + 1, min,
                          a[j]); // Left Subtree
 }
  
 // A wrapper over isSameBSTUtil()
 bool isSameBST(int a[], int b[], int n)
 {
     return isSameBSTUtil(a, b, n, 0, 0, INT_MIN, INT_MAX);
 }
  
 // Usage
 int main()
 {
     int a[] = { 8, 3, 6, 1, 4, 7, 10, 14, 13 };
     int b[] = { 8, 10, 14, 3, 6, 4, 1, 7, 13 };
     int n = sizeof(a) / sizeof(a[0]);
     if (isSameBST(a, b, n)) {
         cout << "BSTs are same";
     }
     else {
         cout << "BSTs not same";
     }
     return 0;
 }
 */
