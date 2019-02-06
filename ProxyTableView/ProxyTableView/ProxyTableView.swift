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
    let delegateProxy = ProtocolProxy()
    let dataSourceProxy = ProtocolProxy()
    
    var defaultDelgate: UITableViewDelegate? {
        didSet{
            delegateProxy.defaultImp = defaultDelgate
            setValue(delegateProxy, forKey: delegateKey)
        }
    }
    var defaultDataSource: UITableViewDataSource? {
        didSet{
            dataSourceProxy.defaultImp = defaultDataSource
            setValue(dataSourceProxy, forKey: dataSourceKey)
        }
    }
    
    override public var dataSource: UITableViewDataSource?{
        didSet{
            if !(dataSource is ProtocolProxy){
                dataSourceProxy.customImp = dataSource
                setValue(dataSourceProxy, forKey: dataSourceKey)
            }
        }
    }
    
    override public var delegate: UITableViewDelegate?{
        didSet{
            if !(delegate is ProtocolProxy){
                delegateProxy.customImp = delegate
                setValue(delegateProxy, forKey: delegateKey)
            }
        }
    }
}
