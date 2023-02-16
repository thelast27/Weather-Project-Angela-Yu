//
//  WeatherManager.swift
//  Clima
//
//  Created by Eldar Garbuzov on 15.02.23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=48d181f9d784cbd7bb7cae6874e3519b&units=metric"
    
    func featchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                       
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather.id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, tempreature: temp)
            
            
        } catch {
            print(error)
        }
    }
    
   
    
}
