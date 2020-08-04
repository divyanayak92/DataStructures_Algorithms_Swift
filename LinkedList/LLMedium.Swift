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
