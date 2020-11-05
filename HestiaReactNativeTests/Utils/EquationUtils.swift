//
//  EquationUtils.swift
//  HestiaReactNativeTests
//
//  Created by batu on 11/5/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class EquationUtils {
    
    static func equal(_ a: Any?, _ b: Any?) -> Bool {
        if a == nil && b == nil { return true }
        
        if a == nil && b != nil { return false }
        
        if a != nil && b == nil { return false }
        
        if let array1 = a as? Array<Any?>, let array2 = b as? Array<Any?> {
            return arrayEqual(array1, array2)
        }
        
        if let dict1 = a as? [String: Any?], let dict2 = b as? [String: Any?] {
            return equalDictionary(dict1, dict2)
        }
        
        guard a is AnyHashable else { return false }
        guard b is AnyHashable else { return false }
        return (a as! AnyHashable) == (b as! AnyHashable)
    }
    
    static func arrayEqual(_ arr1: Array<Any?>, _ arr2: Array<Any?>) -> Bool {
        if arr1.count != arr2.count { return false }
        
        for (index, itemOfArr1) in arr1.enumerated() {
            if !equal(itemOfArr1, arr2[index]) {
                return false
            }
        }
        
        return true
    }
    
    static func equalDictionary(_ dict1: [String: Any?], _ dict2: [String: Any?]) -> Bool {
        return NSDictionary(dictionary: dict1).isEqual(to: dict2)
    }
}
