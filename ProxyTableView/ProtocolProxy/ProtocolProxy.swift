//
//  ProtocolProxy.swift
//  ProxyTableViewDemo
//
//  Created by Nemo on 2019/1/30.
//  Copyright © 2019 nemocdz. All rights reserved.
//

import UIKit

class ProtocolProxy: NSObject {
    weak var customImp: AnyObject?
    weak var defaultImp: AnyObject?
    
    override func responds(to aSelector: Selector!) -> Bool {
        return defaultImp?.responds(to: aSelector) == true || customImp?.responds(to:aSelector) == true
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if let rawObject = customImp, rawObject.responds(to: aSelector) {
            return rawObject
        } else if let defualtObject = defaultImp, defualtObject.responds(to: aSelector) {
            return defaultImp
        } else {
            return super.forwardingTarget(for: aSelector)
        }
    }
}
