//
//  ThemeVC.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 11.08.2021.
//

import UIKit

class ThemeVC: UIViewController {
    
    @IBOutlet var themeCustomView: [UIView]!
    
    @IBOutlet weak var classicView: UIView!
    @IBOutlet weak var classicLabel: UILabel!
    
    @IBOutlet weak var dayView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var nightView: UIView!
    @IBOutlet weak var nightLable: UILabel!
    
    var themeClosure: ((ThemeModel) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        navigationItem.largeTitleDisplayMode = .never
        
        tapViewAndLabel()
        CustomView.addBorderColorView(views: [classicView, dayView, nightView], borderWidth: 3, borderColor: #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1))
        CustomView.addRadius(views: themeCustomView, radius: 10)
    }

    //MARK: settings tap views
    func tapViewAndLabel() {
        classicView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClassicView)))
        classicLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClassicView)))
        classicLabel.isUserInteractionEnabled = true
        
        dayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDayView)))
        dayLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDayView)))
        dayLabel.isUserInteractionEnabled = true
        
        nightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNightView)))
        nightLable.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNightView)))
        nightLable.isUserInteractionEnabled = true
    }
    
    @objc func tapClassicView() {
        print("TapClassicView")
        
        self.themeClosure?(ClassicTheme())
        
        classicView.layer.borderColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
        dayView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        nightView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }
    
    @objc func tapDayView() {
        print("tapDayView")
        
        self.themeClosure?(DayTheme())
        
        classicView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        dayView.layer.borderColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
        nightView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }
    
    @objc func tapNightView() {
        print("tapNightView")
        
        self.themeClosure?(NightTheme())
        
        classicView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        dayView.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
        nightView.layer.borderColor = #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1)
    }
    
    private func settingsTheme() {
        self.view.backgroundColor = Theme.settingTheme.backgroundColor
        classicLabel.textColor = Theme.settingTheme.textColor
        dayLabel.textColor = Theme.settingTheme.textColor
        nightLable.textColor = Theme.settingTheme.textColor
        viewDidLoad()
    }
}
