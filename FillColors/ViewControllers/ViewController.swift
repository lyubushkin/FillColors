//
//  ViewController.swift
//  FillColors
//
//  Created by Aleksey Lyubushkin on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fillingColorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillingColorView.layer.cornerRadius = 20
        fillingColorView.backgroundColor = .gray
    }
    
    @IBAction func sliderAction() {
        
        redLabel.text = "\(round(100 * redSlider.value) / 100)"
        greenLabel.text = "\(round(100 * greenSlider.value) / 100)"
        blueLabel.text = "\(round(100 * blueSlider.value) / 100)"
        
        fillingColorView.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}

