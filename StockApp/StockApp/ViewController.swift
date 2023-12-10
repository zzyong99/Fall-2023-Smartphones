//
//  ViewController.swift
//  StockApp
//
//  Created by 朱泽邕 on 10/21/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myStock: [StockClass] = [StockClass]()
    var mySimpleStock: [SimpleStock] = [SimpleStock]()

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStockValue()
    }

    func loadStockValue(){
        do {
            myStock = [StockClass]()
            let realm = try Realm()
            let stocks = realm.objects(StockClass.self)
            print(stocks)
            
            var stockSymbols: [String] = [String]()
            for stock in stocks {
                myStock.append(stock)
                
            }
            //tblView.reloadData()
            mySimpleStock = [SimpleStock]()
            getAllSimpleStock(symbols: stockSymbols).done{ stockQuotes in
                for stockQuote in stockQuotes {
                    let quoteSimpleStock = SimpleStock()
                    quoteSimpleStock.symbol = stockQuote.symbol
                    quoteSimpleStock.price = stockQuote.price
                    self.mySimpleStock.append(quoteSimpleStock)
                    print("\(stockQuote.symbol) : \(stockQuote.price)")
                }
                self.tblView.reloadData()
            }
            
        } catch {
            print("Eror loading from realm \(error)")
        }
    }
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        loadStockValue()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myStock.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let symbol = myStock[indexPath.row].symbol
        let price = String(format: "%.2f", myStock[indexPath.row].price)
        cell.textLabel?.text = "\(symbol) : $\(price)"
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteFromDB(myStock[indexPath.row])
            myStock.remove(at: indexPath.row)
            tblView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func deleteFromDB(_ stock: StockClass) {
        do {
            let realm = try Realm()
            try realm.write({
                let predicate = 
                realm.delete(stock)
            })
        } catch {
            print("Error deleting item \(error)")
        }
    }
    
}

