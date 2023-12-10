//
//  ViewController.swift
//  weatherAPIExample
//
//  Created by Drillmaps on 02/12/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var weatherValues: [WeatherClass] = [WeatherClass]()
    
    var weatherNames = ["Seattle","San Francisco", "New York", "Portland"]
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getweatherValues(_ sender: Any) {
    
        var weathers = ""
        for weather in weatherNames {
            weathers.append("\(weather),")
        }
        let weathersStr = weathers.dropLast()
        let url = "\(baseURL)"
        print(url)
        
        SwiftSpinner.show("Getting Weather Values")
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print(response.error?.localizedDescription ?? "Error")
                return
            }
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            
            self.weatherValues = [WeatherClass]()
            for weatherJSON in jsonArray {
                print("Weather : \(weatherJSON)")
                let city = weatherJSON["city"].stringValue
                let temperature = weatherJSON["temperature"].intValue
                let conditions = weatherJSON["conditions"].stringValue
                
                let WeatherClass = WeatherClass()
                WeatherClass.city = city
                WeatherClass.temperature = temperature
                WeatherClass.conditions = conditions
                self.weatherValues.append(WeatherClass)
            }
            self.tblView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let city = weatherValues[indexPath.row].city
        let temp = weatherValues[indexPath.row].temperature
        let condi = weatherValues[indexPath.row].conditions
        cell.textLabel?.text = "\(city): \(temp)°F Cond: <\(condi)>"
        return cell
    }
    
}

