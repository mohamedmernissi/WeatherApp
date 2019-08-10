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
    
    let WEATHERDAILYCELL_IDENTIFIER = "WeatherDailyCell"
    let WEATHERCELLDETAIL_IDENTIFIER = "WeatherDetailsCell"
    
    // MARK: - Properties
    
    let itemsToShow = ["Humidity","WindSpeed","Pressure"]
    var weatherModel : WeatherModel?
    

    // MARK: - Outlets
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cityName = self.weatherModel?.data?.request![0].query{
            self.title = cityName
        }
        else{
            self.title = "Details"
        }
    }
}

extension WeatherViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToShow.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailsCell = tableView.dequeueReusableCell(withIdentifier: WEATHERCELLDETAIL_IDENTIFIER, for: indexPath) as! WeatherDetailsCell
        detailsCell.mLblItemToShow.text = itemsToShow[indexPath.row]
        if let weatherHumidity = self.weatherModel?.data?.current_condition![0].humidity, let weatherWindSpeed = self.weatherModel?.data?.current_condition![0].windspeedKmph
            , let weatherPressure = self.weatherModel?.data?.current_condition![0].pressure{
            switch indexPath.row {
            case 0:
                detailsCell.mLblValue.text = weatherHumidity  + "%"
                break
            case 1:
                detailsCell.mLblValue.text = weatherWindSpeed  + " Kmph"
                break
            case 2:
                detailsCell.mLblValue.text = weatherPressure  + " hPa"
                break
            default:
                break
            }
        }

        return detailsCell
    }
}

extension WeatherViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weatherModel?.data?.weather?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let weatherDailyCell = collectionView.dequeueReusableCell(withReuseIdentifier: WEATHERDAILYCELL_IDENTIFIER, for: indexPath) as! WeatherDailyCell
        
        let dateStr = (weatherModel?.data?.weather![indexPath.row].date)!
        let dayOfTheWeek = getDayOfWeekFromDate(dateStr: dateStr)
        let maxDegrees = weatherModel?.data?.weather![indexPath.row].maxtempC ?? ""
        let minDegrees = weatherModel?.data?.weather![indexPath.row].mintempC ?? ""

        weatherDailyCell.fill(day: dayOfTheWeek, minDegrees: minDegrees, maxDegrees: maxDegrees)
        return weatherDailyCell
    }
    
    func getDayOfWeekFromDate(dateStr : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        guard let date = dateFormatter.date(from: dateStr) else {
            fatalError("InvalidDate_getDayOfWeekFromDate")
        }
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }

}

extension WeatherViewController : WeatherPresenterToViewProtocol{
    
}
