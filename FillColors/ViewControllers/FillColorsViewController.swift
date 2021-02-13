//
//  FillColorsViewController.swift
//
//  Created by Aleksey Lyubushkin on 30.01.2021.
//

import UIKit

class FillColorsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var fillingColorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var sladersCollection: [UISlider]!
    
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValueTexField: UITextField!
    @IBOutlet var greenValueTexField: UITextField!
    @IBOutlet var blueValueTexField: UITextField!
    
    var delegate: InitialViewControllerDelegate!
    var currentColorInitialView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillingColorView.layer.cornerRadius = 20
        
        updateSliderValueFromInitialView()
        updatefillingColorView()
        updateLabels()
        
        redValueTexField.delegate = self
        greenValueTexField.delegate = self
        blueValueTexField.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        updateTextFields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let initialVC = segue.destination as? InitialViewController
        else { return }
        
        initialVC.currentColorInitialView =
            fillingColorView.backgroundColor ?? .white
        
        delegate.setNewColorInitialView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sliderAction() {
        updateLabels()
        updatefillingColorView()
        updateTextFields()
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
    
    private func updateTextFields() {
        redValueTexField.text = String(format: "%.2f", redSlider.value)
        greenValueTexField.text = String(format: "%.2f", greenSlider.value)
        blueValueTexField.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func textFieldValueToSlider(_ textField: UITextField) {
        guard
            let textFieldValueToString = textField.text,
            let textFieldValueToFloat = Float(textFieldValueToString)
        else { return }
        
        for slider in sladersCollection {
            if textField.tag == slider.tag {
                slider.value = textFieldValueToFloat
            }
        }
    }
    
    private func updateSliderValueFromInitialView() {
        redSlider.value = Float(currentColorInitialView.redValue)
        greenSlider.value = Float(currentColorInitialView.greenValue)
        blueSlider.value = Float(currentColorInitialView.blueValue)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textFieldValueToSlider(textField)
        textField.resignFirstResponder()
        updatefillingColorView()
        
        return true
    }
}

// проверка на nil иначе обнулить в каждом слайдере значение
// проставить циклы для слайдеров



