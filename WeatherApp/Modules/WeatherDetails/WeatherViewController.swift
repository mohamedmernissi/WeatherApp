//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherViewController: UIViewController {
    var presenter: WeatherViewToPresenterProtocol?

    // MARK: - Constants

    // MARK: - Properties
    
    var weatherModel : WeatherModel?

    // MARK: - Outlets
    
    @IBOutlet weak var mLblCityName: UILabel!
    @IBOutlet weak var mImgWeatherIcon: UIImageView!
    @IBOutlet weak var mLblDegrees: UILabel!
    @IBOutlet weak var mLblHumidity: UILabel!
    @IBOutlet weak var mLblWindSpeed: UILabel!
    @IBOutlet weak var mLblPressure: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cityName = self.weatherModel?.data?.request![0].query{
            mLblCityName.text = cityName
        }
        if let weatherIcon = self.weatherModel?.data?.current_condition![0].weatherIconUrl{
            let url = URL(string: weatherIcon[0].value!)
            mImgWeatherIcon.sd_setImage(with: url!, placeholderImage: nil, options: .continueInBackground, completed: nil)
        }
        if let weatherDegrees = self.weatherModel?.data?.current_condition![0].temp_C{
            mLblDegrees.text = weatherDegrees + "°C"
        }
        if let weatherHumidity = self.weatherModel?.data?.current_condition![0].humidity{
            mLblHumidity.text = weatherHumidity + "%"
        }
        if let weatherWindSpeed = self.weatherModel?.data?.current_condition![0].windspeedKmph{
            mLblWindSpeed.text = weatherWindSpeed + " Kmph"
        }
        if let weatherPressure = self.weatherModel?.data?.current_condition![0].pressure{
            mLblPressure.text = weatherPressure + " hPa"
        }
    }
}

extension WeatherViewController : WeatherPresenterToViewProtocol{
    
}
