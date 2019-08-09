//
//  CityCell.swift
//  WeatherApp
//
//  Created by mohamedmernissi on 09/08/2019.
//  Copyright © 2019 Mohamed Mernissi. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    
    @IBOutlet weak var mLblDegrees: UILabel!
    @IBOutlet weak var mLblState: UILabel!
    
    @IBOutlet weak var mLblCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
