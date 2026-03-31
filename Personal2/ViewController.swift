//
//  ViewController.swift
//  Personal2
//
//  Created by Arunesh Abhishek on 15/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bst = BinarySearchTree()
        bst.insert(4)
        bst.insert(1)
        bst.insert(5)
        bst.insert(7)
        bst.insert(9)
        bst.insert(10)
        print("----------------------")
        bst.searchElement(4)
        bst.searchElement(1)
        bst.searchElement(5)
        bst.searchElement(7)
        bst.searchElement(9)
        bst.searchElement(10)
        bst.searchElement(100)
        bst.searchElement(2)
        bst.searchElement(3)
        print("----------------------")
        bst.inOrderTraversal()
    }


}

/*
every element will be of node type in a tree having left and right child
*/

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class BinarySearchTree {
    var root: Node?
    
    init() {
        self.root = nil
    }
    
    func insert(_ value: Int){
        self.insertElement(value: value, root: self.root)
    }
    
    func insertElement(value: Int, root: Node?){
        guard let root = root else {
            self.root = Node(value: value)
            return
        }
        if root.value > value && root.left == nil{
            root.left = Node(value: value)
        }else if root.value < value && root.right == nil{
            root.right = Node(value: value)
        }else if root.value == value{
            return
        }else if root.value > value && root.left != nil{
            insertElement(value: value, root: root.left)
        }else if root.value < value && root.right != nil{
            insertElement(value: value, root: root.right)
        }else{
            // no action
        }
    }
    
    func searchElement(_ value: Int){
        guard let root = self.root else {
            print("Tree is empty")
            return
        }
        search(value, node: root)
    }
    
    func search(_ value: Int, node: Node){
        if node.value == value{
            print("Element \(value) found")
        }else if node.value > value && node.left != nil{
            search(value, node: node.left!)
        }else if node.value < value && node.right != nil{
            search(value, node: node.right!)
        }else{
            print("Element \(value) not found")
        }
    }
    
    func inOrderTraversal() {
        inOrder(node: self.root)
    }
    
    func inOrder(node: Node?){
        
        guard let node = node else{return}
        
        inOrder(node: node.left)
        print("\(node.value) ")
        inOrder(node: node.right)
    }
    
    func deleteElement(value: Int){
        
    }
    
    func delete(node: Node?, value: Int) -> Node? {
     
        guard let node = node else {return nil}
        
        if node.value > value{
            node.left = delete(node: node.left, value: value)
        }else if node.value < value{
            node.right = delete(node: node.right, value: value)
        }else{
            // node.value = value
            if node.left == nil && node.right == nil {
                return nil
            }
            else if node.left != nil && node.right == nil {
                return node.left
            }else if node.left == nil && node.right != nil{
                return node.right
            }
            // when both child is not nil
            
            let minNode = findMin(node: node)!
            node.value = minNode.value
            
            
        }
        return node
    }
    
    func findMin(node: Node?) -> Node?{
        var currentNode: Node?
        
        while let node = node?.left{
            currentNode = node
        }
        return currentNode
    }
}

