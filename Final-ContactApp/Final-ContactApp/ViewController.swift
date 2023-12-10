//
//  ViewController.swift
//  Final-ContactApp
//
//  Created by 朱泽邕 on 12/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var nameTxtField: UITextField?
    var phoneTxtField: UITextField?
    var names: [String] = [String]()
    var phones: [String] = [String]()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Name: \(names[indexPath.row]) Phone: \(phones[indexPath.row])"
        return cell
    }

    @IBAction func showAlertController(_ sender: Any) {
        let alertController = UIAlertController(title: "Name", message: "", preferredStyle: .alert)
        
        let saveBtn = UIAlertAction(title: "Save", style: .default) { action in
            guard let name = self.nameTxtField?.text else {return}
            guard let number = self.phoneTxtField?.text else {return}
            self.names.append(name)
            self.phones.append(number)
            self.tblView.reloadData()
            print("Save")
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel")
        }
        
        alertController.addAction(saveBtn)
        alertController.addAction(cancelBtn)
        
        alertController.addTextField{ txtField in
            txtField.placeholder = "Type Name"
            self.nameTxtField = txtField
        }
        
        alertController.addTextField{ txtField in
            txtField.placeholder = "Type Phone Number"
            self.phoneTxtField = txtField
        }
        
        self.present(alertController, animated: true)
    }
}

