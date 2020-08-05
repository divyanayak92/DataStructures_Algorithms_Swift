//  LLMedium.swift
//  Created by Divya Nayak on 03/08/20.
//  Copyright © 2020 Divya Nayak. All rights reserved.

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*
 nTh node points to last
 cur node points to previous node to be deleted
 gap between nTh and cur node is n
 So iterate the i till n+1
 use dummy to handle corner cases like only head node/head node to be deleted
 */
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var cur: ListNode? = dummy
    var nth: ListNode? = dummy
    var i = 1
    while i <= n+1 {
        i += 1
        nth = nth?.next
    }
    while nth != nil {
        nth = nth?.next
        cur = cur?.next
    }
    cur?.next = cur?.next?.next
    return dummy.next
}

/*
 Floyd’s Cycle
 */
func detectCycle(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return nil
    }
    var slow = head
    var fast = head
    var entry = head
    while fast?.next != nil && fast?.next?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            while !(slow === entry) {
                slow = slow?.next
                entry = entry?.next
            }
            return entry
        }
    }
    return nil
}

/*
 segregte odd even positioned LL nodes to odd first and then followed by even positioned nodes from the main LL
 */
func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard let _head = head else { return nil }
    var odd: ListNode? = _head
    var even: ListNode? = _head.next
    let evenHead: ListNode? = even
    while even != nil && even?.next != nil {
        odd?.next = even?.next
        odd = even?.next
        even?.next = odd?.next
        even = odd?.next
    }
    odd?.next = evenHead
    return _head
}

/*
 consider k > N and use dummy
 */
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let _head = head else { return head }
    guard _head.next != nil else { return head }
    guard k > 0 else { return _head }
    
    let dummy = ListNode(0)
    var i = 0
    var cur: ListNode? = dummy
    var n: ListNode? = dummy
    dummy.next = _head
    
    while n?.next != nil {
        i += 1
        n = n?.next
    }
    
    for _ in stride(from: (i - k % i), to: 0, by: -1) {
        cur = cur?.next
    }
    
    n?.next = dummy.next
    dummy.next = cur!.next!
    cur?.next = nil
    
    return dummy.next
}

/*
 use dummy and return dummy next
 
 NOTE:
 sum = a + b
 res = sum%10
 carry = sum/10
 */
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1
    var l2 = l2
    var prev = ListNode(0)
    var carry = 0
    let dummy = prev
    while l1 != nil || l2 != nil || carry != 0 {
        let cur = ListNode(0)
        let sum = (l2 == nil ? 0 : l2!.val) + (l1 == nil ? 0 : l1!.val) + carry
        cur.val = sum % 10
        carry = sum / 10
        prev.next = cur
        prev = cur
        l1 = l1?.next
        l2 = l2?.next
    }
    return dummy.next
}
