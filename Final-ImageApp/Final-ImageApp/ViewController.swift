//
//  ViewController.swift
//  Final-ImageApp
//
//  Created by 朱泽邕 on 12/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cities = ["Seattle1", "Seattle2", "Seattle3", "Seattle4","Seattle5", "Seattle6", "Seattle7", "Seattle8", "Seattle9", "Seattle10"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ChristmasTableViewCell", owner: self)?.first as! ChristmasTableViewCell
        cell.imgView?.image = UIImage(named: cities[indexPath.row])
        cell.lblChristmas.text = cities[indexPath.row]
        return cell
    }
}

