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
    var weatherModelArray = [WeatherModel]()
    
    // Array of filtered objects from search
    var filteredWeatherModelArray = [WeatherModel]()
    var isFiltered = false
    
    // Array of cities used to make connection with the api
    var citiesToFetch = ["Casablanca","Rabat","Fez","Marrakech","Tangier"]
    
    // MARK: - Outlets
    
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cities"
        
        self.fetchWeather()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
    }
    
    @objc func addTapped(){
        let alertController = UIAlertController(title: "Add a city", message: "", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "City"
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { [weak alertController] _ in
            guard let alertController = alertController, let textField = alertController.textFields?.first else { return }
            self.citiesToFetch.append(textField.text!)
            self.fetchWeather()
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
    func showCitiesWeather(weatherModel: WeatherModel) {
        weatherModelArray.append(weatherModel)
        self.mTableView.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Problem Fetching Weather", preferredStyle: .alert)
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
            if let cityName = weatherModelArray[indexPath.row].data?.request?[0].query,let cityState = weatherModelArray[indexPath.row].data?.current_condition?[0].weatherDesc?[0].value,let cityDegrees = weatherModelArray[indexPath.row].data?.current_condition?[0].temp_C {
                cityCell.mLblCityName.text = cityName
                cityCell.mLblState.text = cityState
                cityCell.mLblDegrees.text = cityDegrees + "°C"
            }
        }
        else{
            if let cityName = filteredWeatherModelArray[indexPath.row].data?.request?[0].query,let cityState = filteredWeatherModelArray[indexPath.row].data?.current_condition?[0].weatherDesc?[0].value,let cityDegrees = filteredWeatherModelArray[indexPath.row].data?.current_condition?[0].temp_C {
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
        var weatherModel : WeatherModel
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
        for city in self.weatherModelArray {
            if (city.data?.request?[0].query!.lowercased().contains(searchText.lowercased()))! {
                self.filteredWeatherModelArray.append(city)
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
