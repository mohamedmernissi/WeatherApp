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
    
    // Array of tuples used to populate the uitableview
    var cities = [(name : String, state : String, degrees : String)]()
    var filteredArray = [(name : String, state : String, degrees : String)]()
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
        self.cities.removeAll()
        for city in citiesToFetch{
            presenter?.startFetchingWeatherForcity(city: city)
        }
    }

}

extension CitiesViewController : PresenterToViewProtocol{
    func showCitiesWeather(weatherModel: WeatherModel) {
        guard let cityName = weatherModel.data?.request?[0].query else{
            return
        }
        guard let cityState = weatherModel.data?.current_condition?[0].weatherDesc?[0].value else{
            return
        }
        guard let cityDegrees = weatherModel.data?.current_condition?[0].temp_C else{
            return
        }
        let city : (name : String, state : String, degrees : String) = (cityName,cityState,cityDegrees)
        cities.append(city)
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
            return self.filteredArray.count
        }
        else{
            return self.cities.count
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: CITY_CELL_IDENTIFIER, for: indexPath) as! CityCell
        
        if !isFiltered{
            cityCell.mLblCityName.text = cities[indexPath.item].name
            cityCell.mLblState.text = cities[indexPath.item].state
            cityCell.mLblDegrees.text = cities[indexPath.item].degrees + "°C"
        }
        else{
            cityCell.mLblCityName.text = filteredArray[indexPath.item].name
            cityCell.mLblState.text = filteredArray[indexPath.item].state
            cityCell.mLblDegrees.text = filteredArray[indexPath.item].degrees + "°C"
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
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CitiesViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredArray.removeAll()
        if(searchText.count == 0) {
            self.isFiltered = false
        }
        else {
            self.isFiltered = true
        }
        for city in self.cities {
            if city.name.lowercased().contains(searchText.lowercased()) {
                self.filteredArray.append(city)
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
