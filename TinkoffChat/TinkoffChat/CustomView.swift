//
//  CustomView.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 11.08.2021.
//

import UIKit

class CustomView {
    
    public static func addRadius(views: [UIView], radius: CGFloat) {
        for view in views {
            view.layer.cornerRadius = radius
        }
    }
    
    public static func addRadiusWidth(views: [UIView], width: CGFloat){
        for view in views{
            view.layer.cornerRadius = view.frame.size.width / width
        }
    }
    
    public static func addBorderColorView(views: [UIView], borderWidth: CGFloat, borderColor: CGColor) {
        for view in views {
            view.layer.borderWidth = borderWidth
            view.layer.borderColor = borderColor
        }
    }
    
    public static func addBorderColorLabel(labels: [UILabel], borderWidth: CGFloat, borderColor: CGColor) {
        for label in labels {
            label.layer.borderWidth = borderWidth
            label.layer.borderColor = borderColor
        }
    }
    
    public static func addBorderColorButton (buttons: [UIButton], borderWidth: CGFloat, borderColor: CGColor) {
        for button in buttons {
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor
        }
    }
}

extension UIViewController {
    
    func showAlertOK(title: String, message: String){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default , handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func closeController(controller: UIViewController){
        controller.dismiss(animated: true, completion: nil)
    }
}
