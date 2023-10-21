//
//  ViewController.swift
//  StockApp
//
//  Created by 朱泽邕 on 10/21/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let stockNames = ["MSFT", "TSLA", "META", "GOOG"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stockNames[indexPath.row]
        
        return cell
    }

}

