//
//  ThreadSafeDictionary.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 23/05/25.
//

import Foundation

class ThreadSafeDictionary<Key: Hashable, Value> {
    var dictionary: [Key:Value] = [:]
    var dispatchQueue = DispatchQueue(label: "DictionaryOperationsQueue", attributes: .concurrent)
    
    subscript(key: Key) -> Value? {
        get {
            return dispatchQueue.sync {
                dictionary[key]
            }
        }
        set {
            dispatchQueue.sync(flags: .barrier) {
                self.dictionary[key] = newValue
            }
        }
    }
    
    func get(_ key: Key) -> Value? {
        self[key]
    }
    
    func set(_ value: Value, for key: Key) {
        self[key] = value
    }
    
    func remove(_ key: Key) {
        dispatchQueue.sync(flags: .barrier) {
            self.dictionary.removeValue(forKey: key)
        }
    }
    
    var keys: [Key] {
        dispatchQueue.sync {
            Array(dictionary.keys)
        }
    }
    
    var values: [Value] {
        dispatchQueue.sync {
            Array(dictionary.values)
        }
    }
    
    func contains(key: Key) -> Bool {
        dispatchQueue.sync {
            dictionary.keys.contains(key)
        }
    }
    
    func removeAll() {
        dispatchQueue.sync(flags: .barrier) {
            self.dictionary.removeAll()
        }
    }
}
