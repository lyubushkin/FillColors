//
//  FillColorsViewController.swift
//
//  Created by Aleksey Lyubushkin on 30.01.2021.
//

import UIKit

class FillColorsViewController: UIViewController {

    @IBOutlet var fillingColorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    var delegate: InitialViewControllerDelegate!
    var currentColorInitialView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillingColorView.layer.cornerRadius = 20
        
        updateSliderValueFromInitialView()
        updatefillingColorView()
        updateLabels()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let initialVC = segue.destination as? InitialViewController
        else { return }
        
        initialVC.currentColorInitialView =
            fillingColorView.backgroundColor ?? .white
        
        delegate.setNewColorInitialView()
    }
    
    @IBAction func sliderAction() {
        updateLabels()
        updatefillingColorView()
    }
    
    @IBAction func pressedDoneButton() {
        performSegue(withIdentifier: "goToInitialViewSegue", sender: nil)
    }
    private func updatefillingColorView() {
        fillingColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func updateLabels() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateSliderValueFromInitialView() {
        redSlider.value = Float(currentColorInitialView.redValue)
        greenSlider.value = Float(currentColorInitialView.greenValue)
        blueSlider.value = Float(currentColorInitialView.blueValue)
    }
}



