//
//  WeatherDailyCell.swift
//  WeatherApp
//
//  Created by mohamedmernissi on 10/08/2019.
//  Copyright © 2019 Mohamed Mernissi. All rights reserved.
//

import UIKit

class WeatherDailyCell: UICollectionViewCell {
    
    @IBOutlet weak var mViewContainer: UIView!
    @IBOutlet weak var mLblDayOfWeek: UILabel!
    @IBOutlet weak var mMinTemp: UILabel!
    @IBOutlet weak var mMaxTemp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mViewContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.mViewContainer.layer.borderWidth = 1
        self.mViewContainer.layer.cornerRadius = 8
    }
    
    func fill(day : String, minDegrees : String, maxDegrees : String) {
        self.mLblDayOfWeek.text = day
        self.mMinTemp.text = minDegrees
        self.mMaxTemp.text = maxDegrees
    }
    
}
