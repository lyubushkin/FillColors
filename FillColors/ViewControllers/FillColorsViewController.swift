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
        delegate.currentColorInitialView = fillingColorView.backgroundColor ?? .white
        delegate.setNewColorInitialView()
        self.dismiss(animated: true)
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
    
    private func updateSliderValueFromInitialView() {
        redSlider.value = Float(currentColorInitialView.redValue)
        greenSlider.value = Float(currentColorInitialView.greenValue)
        blueSlider.value = Float(currentColorInitialView.blueValue)
    }
    
    private func getTextFieldValueToSlider(_ textField: UITextField) {
        guard
            let textFieldValueToString = textField.text
        else { return }
        
        guard
            let textFieldValueToFloat = Float(textFieldValueToString)
        else {
            alertTextFieldValue()
            textField.text = nil
            
            return
        }
        
        if checkValueFromTextField(textFieldValueToFloat, textField) {
            for slider in sladersCollection {
                if textField.tag == slider.tag {
                    slider.value = textFieldValueToFloat
                }
            }
        }
    }
    
    private func checkValueFromTextField(_ value: Float, _ textField: UITextField) -> Bool {
        
        if value >= 0 && value <= 1 { return true }
        
        alertTextFieldValue()
        textField.text = nil
       
        return false
    }
    
    private func alertTextFieldValue() {
        let alert = UIAlertController(title: "Только цифры от 0 до 1",
                                      message: "Повторите ввод",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        getTextFieldValueToSlider(textField)
        textField.resignFirstResponder()
        updatefillingColorView()
        updateLabels()
        
        return true
    }
}



