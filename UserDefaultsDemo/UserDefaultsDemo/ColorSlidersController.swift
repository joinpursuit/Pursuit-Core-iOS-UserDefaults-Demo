//
//  ColorSlidersController.swift
//  UserDefaultsDemo
//
//  Created by Alex Paul on 1/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorSlidersController: UIViewController {
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let redValue = UserDefaults.standard.object(forKey: UserDefaultsKeys.redValue) as? CGFloat,
      let greenValue = UserDefaults.standard.object(forKey: UserDefaultsKeys.greenValue) as? CGFloat,
      let blueValue = UserDefaults.standard.object(forKey: UserDefaultsKeys.blueValue) as? CGFloat {
      
      // set slider values
      redSlider.value = Float(redValue)
      greenSlider.value = Float(greenValue)
      blueSlider.value = Float(blueValue)
      
      view.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    } else {
      view.backgroundColor = .white
    }
  }
  
  @IBAction func sliderChanged(_ slider: UISlider) {
    let color = UIColor(displayP3Red: CGFloat(redSlider.value),
                        green: CGFloat(greenSlider.value),
                        blue: CGFloat(blueSlider.value),
                        alpha: 1.0)
    view.backgroundColor = color
  
    // save values to UserDefaults
    UserDefaults.standard.set(CGFloat(redSlider.value), forKey: UserDefaultsKeys.redValue)
    UserDefaults.standard.set(CGFloat(greenSlider.value), forKey: UserDefaultsKeys.greenValue)
    UserDefaults.standard.set(CGFloat(blueSlider.value), forKey: UserDefaultsKeys.blueValue)
  }

}
