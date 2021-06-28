//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 27.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //срабатывает перед появлением вью
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LifeCycleApp.shared.printLife("\(#function): срабатывает перед появлением вью")
    }
    
    //размер вью будет изменен под размер экрана
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        LifeCycleApp.shared.printLife("\(#function): размер вью будет изменен под размер экрана")
    }
    
    //размер вью изменен
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        LifeCycleApp.shared.printLife("\(#function): размер вью изменен")
    }
    
    //вью появился
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LifeCycleApp.shared.printLife("\(#function): вью появился")
    }
    
    //срабатывает перед закрытием вью
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LifeCycleApp.shared.printLife("\(#function): срабатывает перед закрытием вью")
    }
    
    //вью закрылась
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LifeCycleApp.shared.printLife("\(#function): вью закрылась")
    }
}

