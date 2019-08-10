//
//  WeatherDetailsCell.swift
//  WeatherApp
//
//  Created by mohamedmernissi on 10/08/2019.
//  Copyright © 2019 Mohamed Mernissi. All rights reserved.
//

import UIKit

class WeatherDetailsCell: UITableViewCell {
    
    @IBOutlet weak var mLblItemToShow: UILabel!
    
    @IBOutlet weak var mLblValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
