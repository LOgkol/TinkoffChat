//
//  ConversationsListViewController.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 06.07.2021.
//

import Foundation
import UIKit

var image:UIImage = UIImage()

class ConversationsListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let barButtonImage : UIButton = UIButton.init(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "CustomConversationsList", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "customConversationsList")
        
        settingsBarButtonImage()
    }
    
    func settingsBarButtonImage() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        barButtonImage.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        barButtonImage.Round = true
        barButtonImage.setImage(UIImage(named: "placeholderUser"), for: .normal)
        barButtonImage.addTarget(self, action: #selector(tapBarButtonImage), for: .touchUpInside)
        containView.addSubview(barButtonImage)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func tapBarButtonImage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ProfileVC", bundle: nil)
        guard let profileVC = storyboard.instantiateViewController(withIdentifier:"profileVC") as? ProfileVC else { return }
        let navProfileVC = UINavigationController(rootViewController: profileVC)
        navProfileVC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navProfileVC, animated: true, completion: {
            self.barButtonImage.setImage(image, for: .normal)
        })
    }
}

//MARK: UITableViewDataSource
extension ConversationsListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return conversationDateArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationDateArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customConversationsList", for: indexPath) as? CustomConversationsList else {return tableView.dequeueReusableCell(withIdentifier: "customConversationsList", for: indexPath)}
        
        let pathToProperty = conversationDateArray[indexPath.section][indexPath.row]
        cell.name = pathToProperty.name
        cell.message = pathToProperty.message
        cell.date = pathToProperty.date
        cell.online = pathToProperty.online
        cell.hasUnreadMessages = pathToProperty.hasUnreadMessages
        cell.image = pathToProperty.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Online"
        case 1:
            return "History"
        default:
            return nil
        }
    }
}

//MARK: UITableViewDelegate
extension ConversationsListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemsArray = conversationDateArray[indexPath.section][indexPath.row]
        let storyboard = UIStoryboard(name: "Conversation", bundle: nil)
        guard let conversationVC = storyboard.instantiateViewController(withIdentifier: "conversationVC") as? ConversationVC else {return }
        conversationVC.navigationTitle = itemsArray.name ?? ""
        conversationVC.userImageName = itemsArray.image ?? "placeholderUser"
        self.navigationController?.pushViewController(conversationVC, animated: true)
    }
}

extension UIView{
    
    @IBInspectable var Round:Bool{
        get{
            return false
        }
        set{
            if newValue == true {
                self.layer.cornerRadius = self.frame.size.height/2;
                self.layer.masksToBounds = true;
            }
        }
    }
}
