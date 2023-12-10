//
//  AddContactViewController.swift
//  Final-ProtocolDelegate
//
//  Created by 朱泽邕 on 12/2/23.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    var scDelegate: SendContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveNewContact(_ sender: Any) {
        guard let name = nameField.text else {return}
        guard let number = numberField.text else {return}
        
        scDelegate?.sendContact(name: name, number: number)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
