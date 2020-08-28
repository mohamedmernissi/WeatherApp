//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    // MARK: - Constants
    let CITY_CELL_IDENTIFIER = "citycell"
    
    // MARK: - Properties
    var presenter: ViewToPresenterProtocol?
    
    // Array of objects used to populate the uitableview
    var weatherModelArray = [WeatherViewModel]()
    
    // Array of filtered objects from search
    var filteredWeatherModelArray = [WeatherViewModel]()
    var isFiltered = false
    
    // Array of cities used to make connection with the api
    var citiesToFetch = ["Casablanca","Rabat","Fez","Marrakech","Tangier"]
    
    // MARK: - Outlets
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cities"
        
        //self.fetchWeather()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        
        let model1 = WeatherViewModel(city: "Casablanca", cityState: "Casablanca", cityDegrees: "20", weatherHumidity: "60", weatherWindSpeed: "80", weatherPressure: "30", weather: nil)
        let model2 = WeatherViewModel(city: "Rabat", cityState: "Rabat", cityDegrees: "23", weatherHumidity: "60", weatherWindSpeed: "80", weatherPressure: "30", weather: nil)
        let model3 = WeatherViewModel(city: "Fez", cityState: "Fez", cityDegrees: "30", weatherHumidity: "60", weatherWindSpeed: "80", weatherPressure: "30", weather: nil)
        let model4 = WeatherViewModel(city: "Marrakech", cityState: "Marrakech", cityDegrees: "40", weatherHumidity: "60", weatherWindSpeed: "80", weatherPressure: "30", weather: nil)
        let model5 = WeatherViewModel(city: "Tangier", cityState: "Tangier", cityDegrees: "24", weatherHumidity: "60", weatherWindSpeed: "80", weatherPressure: "30", weather: nil)
        weatherModelArray.append(model1)
        weatherModelArray.append(model2)
        weatherModelArray.append(model3)
        weatherModelArray.append(model4)
        weatherModelArray.append(model5)
        self.mTableView.reloadData()
    }
    
    @objc func addTapped(){
        let alertController = UIAlertController(title: "Add a city", message: "", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "City"
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { [weak alertController] _ in
            guard let alertController = alertController, let textField = alertController.textFields?.first else { return }
            self.citiesToFetch.append(textField.text!)
            self.presenter?.startFetchingWeatherForcity(city: textField.text!)
        }
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func refresh(){
        self.fetchWeather()
    }
    
    func fetchWeather(){
        self.weatherModelArray.removeAll()
        for city in citiesToFetch{
            presenter?.startFetchingWeatherForcity(city: city)
        }
    }

}

extension CitiesViewController : PresenterToViewProtocol{
    func showCitiesWeather(weatherModel: WeatherViewModel) {
        weatherModelArray.append(weatherModel)
        self.mTableView.reloadData()
    }
    
    func showError(city : String) {
        if let index = self.citiesToFetch.firstIndex(of: city){
            self.citiesToFetch.remove(at: index)
        }
        let alert = UIAlertController(title: "Problem Fetching Weather for " + city, message: "Try entering a correct city name.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableView delegates

extension CitiesViewController : UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltered{
            return self.filteredWeatherModelArray.count
        }
        else{
            return self.weatherModelArray.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: CITY_CELL_IDENTIFIER, for: indexPath) as! CityCell
        
        if !isFiltered{
            if let cityName = weatherModelArray[indexPath.row].city,let cityState = weatherModelArray[indexPath.row].cityState,let cityDegrees = weatherModelArray[indexPath.row].cityDegrees{
                cityCell.mLblCityName.text = cityName
                cityCell.mLblState.text = cityState
                cityCell.mLblDegrees.text = cityDegrees + "°C"
            }
        }
        else{
            if let cityName = filteredWeatherModelArray[indexPath.row].city,let cityState = filteredWeatherModelArray[indexPath.row].cityState,let cityDegrees = filteredWeatherModelArray[indexPath.row].cityDegrees{
                cityCell.mLblCityName.text = cityName
                cityCell.mLblState.text = cityState
                cityCell.mLblDegrees.text = cityDegrees + "°C"
            }
        }

        return cityCell
    }
}

extension CitiesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            citiesToFetch.remove(at: indexPath.row)
            weatherModelArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var weatherModel : WeatherViewModel
        if !isFiltered{
            weatherModel = self.weatherModelArray[indexPath.row]
        }
        else{
            weatherModel = self.filteredWeatherModelArray[indexPath.row]
        }
        self.presenter?.showDetailsController(navigationController: self.navigationController!,weatherModel: weatherModel)
    }
}

extension CitiesViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredWeatherModelArray.removeAll()
        if(searchText.count == 0) {
            self.isFiltered = false
        }
        else {
            self.isFiltered = true
        }
        for item in self.weatherModelArray{
            if (item.city?.lowercased().contains(searchText.lowercased()))!{
                self.filteredWeatherModelArray.append(item)
            }
        }
        self.mTableView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isFiltered = false
        searchBar.resignFirstResponder()
        searchBar.text = ""
        self.mTableView.reloadData()
    }
}
