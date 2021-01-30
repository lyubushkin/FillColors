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
        
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        

        redLabel.text = "\(redSlider.value)"
        greenLabel.text = "\(greenSlider.value)"
        blueLabel.text = "\(blueSlider.value)"
        
        redLabel.textColor = .white
        greenLabel.textColor = .white
        blueLabel.textColor = .white
        
        fillingColorView.layer.cornerRadius = 20
        fillingColorView.backgroundColor =
            .init(red: CGFloat(redSlider.value),
                  green: CGFloat(greenSlider.value),
                  blue: CGFloat(blueSlider.value),
                  alpha: 1)

    }

    @IBAction func redSliderAction() {
        redLabel.text = "\(round(100 * redSlider.value) / 100)"
        fillingColorView.backgroundColor =
            .init(red: CGFloat(redSlider.value),
                  green: CGFloat(greenSlider.value),
                  blue: CGFloat(blueSlider.value),
                  alpha: 1)
    }
    
    @IBAction func greenSliderAction() {
        greenLabel.text = "\(round(100 * greenSlider.value) / 100)"
        fillingColorView.backgroundColor =
            .init(red: CGFloat(redSlider.value),
                  green: CGFloat(greenSlider.value),
                  blue: CGFloat(blueSlider.value),
                  alpha: 1)
    }
    
    @IBAction func blueSliderAction() {
        blueLabel.text = "\(round(100 * blueSlider.value) / 100)"
        fillingColorView.backgroundColor =
            .init(red: CGFloat(redSlider.value),
                  green: CGFloat(greenSlider.value),
                  blue: CGFloat(blueSlider.value),
                  alpha: 1)
    }
    
}

