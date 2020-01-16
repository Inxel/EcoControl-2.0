//
//  UserDefault.swift
//  Violations
//
//  Created by Artyom Zagoskin on 16.01.2020.
//  Copyright © 2020 Tyoma Zagoskin. All rights reserved.
//

// Thanks to https://github.com/funday991

import Foundation


@propertyWrapper
struct UserDefault<T> {
    
    private let key: String
    private let defaultValue: T
    private let userDefaults = UserDefaults.standard
    
    
    var wrappedValue: T {
        get { userDefaults.object(forKey: key) as? T ?? defaultValue }
        set { userDefaults.set(newValue, forKey: key) }
    }
    
    
    init(_ key: String, _ defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
}