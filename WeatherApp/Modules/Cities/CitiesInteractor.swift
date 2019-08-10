//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
import Alamofire

class CitiesInteractor : PresenterToInteractorProtocol{
    weak var presenter: InteractorToPresenterProtocol?
    
    func fetchWeather(city : String){
        print("City: ",city)
        let parameters : Parameters = ["q" : city,"key" : API_KEY,"format" : "json","num_of_days" : "1"]
        AF.request(API_WEATHER,method: .get,parameters: parameters,encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            guard let data = response.data else {
                self.presenter?.weatherFetchFailed()
                return
            }
            print("data: ",data)
            do {
                let decoder = JSONDecoder()
                let weatherModel = try decoder.decode(WeatherModel.self, from: data)
                self.presenter?.weatherFetchedSuccess(weatherModel: weatherModel)
            } catch let error {
                print("Error_fetchWeather: ",error.localizedDescription)
                self.presenter?.weatherFetchFailed()
            }
        }
    }
}
