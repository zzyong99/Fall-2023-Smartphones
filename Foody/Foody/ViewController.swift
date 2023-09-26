//
//  ViewController.swift
//  Foody
//
//  Created by 朱泽邕 on 9/25/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoMenu(_ sender: Any) {
        performSegue(withIdentifier: "foodMenu", sender: self)
    }
    
}

