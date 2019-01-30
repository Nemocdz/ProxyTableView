//
//  ViewController.swift
//  ProxyTableView
//
//  Created by Nemo on 2019/1/30.
//  Copyright © 2019 nemocdz. All rights reserved.
//

import UIKit
private let reuseKey = "a"
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = ProxyTableView(frame: view.frame, style: .plain)
        tableView.defaultDelgate = BaseTableViewDelegate()
        tableView.defaultDataSource = BaseTableViewDataSource()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseKey)
        view.addSubview(tableView)
        tableView.delegate = self
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("CustomTableViewDelegate")
    }
}

class BaseTableViewDataSource: NSObject, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: reuseKey, for: indexPath)
    }
}

class BaseTableViewDelegate: NSObject, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("BaseTableViewDelegate")
    }
}

