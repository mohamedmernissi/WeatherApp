//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
import UIKit

protocol CitiesRouterInterface: class {

}

class CitiesRouter: NSObject {

    weak var presenter: CitiesPresenterInterface?

    static func setupModule() -> CitiesViewController {
        let vc = CitiesViewController()
        let interactor = CitiesInteractor()
        let router = CitiesRouter()
        let presenter = CitiesPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
        
//        let movieModue = MovieRouter.createMovieModule()
//        navigationController.pushViewController(movieModue,animated: true)
        
    }
}

extension CitiesRouter: CitiesRouterInterface {

}

