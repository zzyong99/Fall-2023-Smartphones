//
//  AddStockViewController.swift
//  StockApp
//
//  Created by 朱泽邕 on 10/21/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift

class AddStockViewController: UIViewController {

    @IBOutlet weak var txtStock: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddStockAction(_ sender: Any) {
        guard let stockSymbol = txtStock.text else {return}
                
        getStockInfo(symbol: stockSymbol).done{stockClass in
            // connect to realm
            do {
                let realm = try Realm()
                try realm.write({
                    realm.add(stockClass, update: .modified)
                })
                self.navigationController?.popViewController(animated: true)
            }
            catch {
                print("Error adding data to ReamlDB")
            }
        }
        .catch{ error in
            print("Unable to get stock value")
        }

    }
    
}
