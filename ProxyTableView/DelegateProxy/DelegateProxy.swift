//
//  DelegateProxy.swift
//  ProxyTableViewDemo
//
//  Created by Nemo on 2019/1/30.
//  Copyright © 2019 nemocdz. All rights reserved.
//

import UIKit

class DelegateProxy: NSObject {
    weak var rawObject: AnyObject?
    weak var defaultObject: AnyObject?
    
    override func responds(to aSelector: Selector!) -> Bool {
        return defaultObject?.responds(to: aSelector) == true || rawObject?.responds(to:aSelector) == true
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if let rawObject = rawObject, rawObject.responds(to: aSelector) {
            return rawObject
        } else if let defualtObject = defaultObject, defualtObject.responds(to: aSelector) {
            return defaultObject
        } else {
            return super.forwardingTarget(for: aSelector)
        }
    }
}
