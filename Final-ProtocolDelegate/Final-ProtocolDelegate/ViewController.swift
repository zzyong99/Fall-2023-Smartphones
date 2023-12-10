//
//  ViewController.swift
//  Final-ProtocolDelegate
//
//  Created by 朱泽邕 on 12/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendContactDelegate {
    
    var names: [String] = [String]()
    var numbers: [String] = [String]()
    
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
        cell.textLabel?.text = "Name: \(names[indexPath.row]) Phone: \(numbers[indexPath.row])"
        return cell
    }


    @IBAction func addNewContact(_ sender: Any) {
        performSegue(withIdentifier: "SegueShow", sender: self)
    }
    
    func sendContact(name: String, number: String) {
        names.append(name)
        numbers.append(number)
        tblView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueShow" {
            let secondVC = segue.destination as! AddContactViewController
            secondVC.scDelegate = self
        }
    }
}

