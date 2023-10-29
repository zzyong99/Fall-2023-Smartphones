//
//  StockAppNetwork.swift
//  StockApp
//
//  Created by 朱泽邕 on 10/28/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit


func getAllSimpleStock(symbols: [String]) -> Promise<[SimpleStock]> {
    var promises: [Promise<SimpleStock>] = []
    for i in 0 ... symbols.count - 1 {
        promises.append(getSimpleStockInfo(symbol: symbols[i]))
    }
    return when(fulfilled: promises)
}


func getSimpleStockInfo(symbol: String) -> Promise<SimpleStock> {
    return Promise<SimpleStock> { seal -> Void in
        let url = "\(simpleURL)profile/\(symbol)?apiKey=\(apiKey)"
        AF.request(url).responseJSON{ response in
            // reject promise
            if(response.error != nil){
                seal.reject(response.error!)
                print(response.error?.localizedDescription)
                return
            }
            
            // We have valid data here
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].floatValue
            
            let simpleStockClass = SimpleStock()
            simpleStockClass.symbol = symbol
            simpleStockClass.price = price
            
            seal.fulfill(simpleStockClass)
        }
    }
}

func getStockInfo(symbol: String) -> Promise<StockClass> {
    
    return Promise<StockClass> { seal -> Void in
        let url = "\(baseURL)profile/\(symbol)?apikey=\(apiKey)"
        AF.request(url).responseJSON { response in
            
            // reject promise
            if(response.error != nil){
                seal.reject(response.error!)
                print(response.error?.localizedDescription)
                return
            }
            
            // We have valid data here
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].floatValue
            let companyName = stock["companyName"].stringValue
            let description = stock["description"].stringValue
            
            print(symbol)
            print(price)
            print(companyName)
            print(description)
            
            // data persisting
            let stockClass = StockClass()
            stockClass.symbol = symbol
            stockClass.price = price
            stockClass.companyName = companyName
            stockClass.companyDescription = description
            
            seal.fulfill(stockClass)
        }
    }
}
