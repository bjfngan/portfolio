//
//  WeatherModel.swift
//  Clima
//
//  Created by Bennet Ngan on 2022-08-30.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionID: Int
    let cityName: String
    let temp: Double
    
    var tempString: String {
       return String(format: "%.1f", temp)
    }
    //Computed property that returns iOS condition icon name based on OpenWeather's weather codes
    var condition: String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}
