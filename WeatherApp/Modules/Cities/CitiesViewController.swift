//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import UIKit

protocol CitiesViewControllerInterface: class {

}

class CitiesViewController: UIViewController {
    
    // MARK: - Constants
    let CITY_CELL_IDENTIFIER = "citycell"
    
    // MARK: - Properties
    var presenter: CitiesPresenterInterface?
    var cities = ["Casablanca","Rabat","Fez","Marrakech","Tangier"]
    
    // MARK: - Outlets
    @IBOutlet weak var mTableView: UITableView!

}

// MARK: - UITableView delegates

extension CitiesViewController : UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cityCell = tableView.dequeueReusableCell(withIdentifier: CITY_CELL_IDENTIFIER, for: indexPath) as! CityCell
        cityCell.mLblCityName.text = cities[indexPath.row]
        return cityCell
    }
    
    
}

extension CitiesViewController: CitiesViewControllerInterface {

}
