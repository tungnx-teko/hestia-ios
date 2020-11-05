//
//  RNResponseUtils.swift
//  HestiaReactNative
//
//  Created by batu on 11/5/20.
//  Copyright © 2020 Tung Nguyen. All rights reserved.
//

import Foundation

class RNResponseUtils {
    
    static func convertDataToTransfer(_ data: Any?) -> Any? {
        guard let data = data else {
            return nil
        }
        
        if let convertedData = convertData(data) {
            return convertedData
        } else {
            return data
        }
    }

    static func convertData(_ data: Any?) -> Any? {
        guard let data = data else {
            return nil
        }
        
        if let dictionary = data as? Dictionary<String, Any?> {
            return dictionary
        }
        
        if let array = data as? Array<Any?> {
            return array.map { value in convertDataToTransfer(value) }
        }
        
        let mirror = Mirror(reflecting: data)
        let dictionary = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (key: String?, value: Any) -> (String, Any)? in
            guard let key = key else { return nil }
            
            if let dictionary = convertDataToTransfer(value) {
                return (key, dictionary)
            } else {
                return (key, String(describing: value))
            }
        }).compactMap { $0 })
        
        return dictionary.isEmpty ? nil : dictionary
    }

}
