//
//  WeatherManager.swift
//  Clima
//
//  Created by Bennet Ngan on 2022-08-30.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

//Implementing the delegate model for parsing information from OpenWeather allows this weather module to be reusable in any
//future apps
protocol WeatherManagerDelegate {
    func updateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func failWithError(_ error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=bcee7518a019ad1525ddb963e7e834f3&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    //Fetch weather with city name
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    //Fetch weather with coordinates
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees){
        let urlString="\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString)
    }
    
    //Make request to OpenWeather API
    func performRequest(_ urlString: String) {
        //Create URL
        if let url = URL(string: urlString) {
            //Create URLSession
            let session = URLSession(configuration: .default)
            //Create session task
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.failWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.updateWeather(self, weather: weather)
                    }
                }
            }
            //Start task
            task.resume()
        }
    }
    
    //Decode and processes JSON data from API
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temp: temp)
            return weather
        } catch {
            self.delegate?.failWithError(error)
            return nil
        }
    }
        
}
