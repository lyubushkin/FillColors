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
    
    var currentColorInitialView = UIColor(
        red: 1,
        green: 1,
        blue: 1,
        alpha: 1
    )
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        setNewColorInitialView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let fillColorsVC = segue.destination as? FillColorsViewController
        else { return }
        
        fillColorsVC.delegate = self
        fillColorsVC.currentColorInitialView = currentColorInitialView
    }
    
    @IBAction func unwindToInitialVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController =
            unwindSegue.source as? FillColorsViewController
        currentColorInitialView =
            sourceViewController?.fillingColorView.backgroundColor ?? .red
    }
    
    @IBAction func goToSecond() {
        performSegue(withIdentifier: "toSecondGegue", sender: "nil")
    }
    
    
}

extension InitialViewController: InitialViewControllerDelegate {
    func setNewColorInitialView() {
        initialView.backgroundColor = currentColorInitialView
    }
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}
