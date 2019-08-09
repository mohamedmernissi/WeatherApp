//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import UIKit

protocol WeatherViewControllerInterface: class {

}

class WeatherViewController: UIViewController {
    var presenter: WeatherPresenterInterface?
    
}

extension WeatherViewController: WeatherViewControllerInterface {

}
