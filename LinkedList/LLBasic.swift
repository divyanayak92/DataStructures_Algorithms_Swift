//  LLBasic.swift
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
  Use slow & fast pointer
 condition: fast != nil && fast?.next != nil(for one node)
*/
func middleNode(_ head: ListNode?) -> ListNode? {
    guard let _head = head else { return nil }
    var slow: ListNode? = _head
    var fast: ListNode? = _head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}

/*
 3 node sliding window (prev, cur and next)
 where prev starts with nil
 */
func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode? = nil
    var cur: ListNode? = head
    
    while cur != nil {
        let next: ListNode? = cur?.next
        cur?.next = prev
        prev = cur
        cur =  next
    }
    
    return prev
}

/*
 decide if prev!.next = cur!.next or prev = cur
 */
func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard let _head = head else { return nil }
    guard ((head?.next) != nil) else { return head }
    var prev: ListNode? = _head
    var cur: ListNode? = _head.next!
    while cur != nil {
        if prev!.val == cur!.val {
            prev!.next = cur!.next
        } else {
            prev = cur
        }
        cur = cur?.next
    }
    return head
}

/*
 fast runner and slow runners meets at a point in a circle
 */
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil { return false }
    var slow: ListNode? = head
    var fast: ListNode? = head?.next
    while slow !== fast {
        if fast == nil {
            return false
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}

/*
 slow down fast moving pointer, i.e one with least nodes prior to intersection
 a = a == nil ? headB : a?.next
 */
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    var a: ListNode? = headA
    var b: ListNode? = headB
    while a !== b {
        a = a == nil ? headB : a?.next
        b = b == nil ? headA : b?.next
    }
    return a;
}

/*
 find middle
 if middle is at the left side for even number of nodes make slow shift right
 reverse right nodes
 compare left and right nodes
 */
func isPalindrome(_ head: ListNode?) -> Bool {
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast?.next != nil && fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    if fast != nil {
        slow = slow?.next
    }
    slow = reverseList(slow)
    fast = head
    while slow != nil {
        if slow!.val != fast!.val { return false }
        slow = slow?.next
        fast = fast?.next
    }
    return true
}

/*
 Use dummy to hold prev, in case if you had to delete head node
 use delete duplicates logic
 return dummy next
 */
func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var cur: ListNode? = head
    var pre: ListNode? = dummy
    
    while cur != nil {
        if cur?.val == val {
            pre?.next = cur?.next
        } else {
            pre = pre?.next
        }
        cur = cur?.next
    }
    
    return dummy.next
}
