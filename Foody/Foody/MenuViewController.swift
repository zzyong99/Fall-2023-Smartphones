//
//  MenuViewController.swift
//  Foody
//
//  Created by 朱泽邕 on 9/25/23.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["food1", "food2", "food3", "food4", "food5", "food6", "food7", "food8"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ImageTableViewCell", owner: self)?.first as! ImageTableViewCell
        cell.imgView?.image = UIImage(named: imageNames[indexPath.row])
        cell.imgLabel.text = imageNames[indexPath.row]
        
        return cell
    }
    
}
