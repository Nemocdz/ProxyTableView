//
//  ProxyTableView.swift
//  ProxyTableViewDemo
//
//  Created by Nemo on 2019/1/30.
//  Copyright © 2019 nemocdz. All rights reserved.
//

import UIKit

private let delegateKey = "delegate"
private let dataSourceKey = "dataSource"
class ProxyTableView: UITableView {
    let delegateProxy = DelegateProxy()
    let dataSourceProxy = DelegateProxy()
    
    var defaultDelgate: UITableViewDelegate? {
        didSet{
            delegateProxy.defaultObject = defaultDelgate
            setValue(delegateProxy, forKey: delegateKey)
        }
    }
    var defaultDataSource: UITableViewDataSource? {
        didSet{
            dataSourceProxy.defaultObject = defaultDataSource
            setValue(dataSourceProxy, forKey: dataSourceKey)
        }
    }
    
    override public var dataSource: UITableViewDataSource?{
        didSet{
            if !(dataSource is DelegateProxy){
                dataSourceProxy.rawObject = dataSource
                setValue(dataSourceProxy, forKey: dataSourceKey)
            }
        }
    }
    
    override public var delegate: UITableViewDelegate?{
        didSet{
            if !(delegate is DelegateProxy){
                delegateProxy.rawObject = delegate
                setValue(delegateProxy, forKey: delegateKey)
            }
        }
    }
}
