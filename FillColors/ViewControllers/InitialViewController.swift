//
//  InitialViewController.swift
//  FillColors
//
//  Created by Aleksey Lyubushkin on 12.02.2021.
//

import UIKit

protocol InitialViewControllerDelegate {
    func setNewColorInitialView()
}

class InitialViewController: UIViewController {
    
    @IBOutlet var initialView: UIView!
    
    var currentColorInitialView: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentColorInitialView = initialView.backgroundColor
  
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let fillColorsVC = segue.destination as? FillColorsViewController
        else { return }
        
        fillColorsVC.delegate = self
        fillColorsVC.currentColorInitialView = currentColorInitialView
    }
    
    @IBAction func goToSecond() {
        performSegue(withIdentifier: "toSecondGegue", sender: "nil")
    }
    
    private func testChangeColorView() {
        initialView.backgroundColor = .red
    }
}

extension InitialViewController: InitialViewControllerDelegate {
    func setNewColorInitialView() {
        print("welcome home \(currentColorInitialView.greenValue)")
        print("metod is working")
        //initialView.backgroundColor = currentColorInitialView
        super.view.backgroundColor = currentColorInitialView
    }
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}
