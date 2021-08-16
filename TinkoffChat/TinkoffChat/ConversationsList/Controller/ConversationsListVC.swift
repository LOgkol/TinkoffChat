//
//  ConversationsListViewController.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 06.07.2021.
//

import Foundation
import UIKit

class ConversationsListVC: UIViewController {
    
    @IBOutlet weak var imageThemeVC: UIBarButtonItem!
    
    @IBAction func themeVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Theme", bundle: nil)
        guard let themeVC = storyboard.instantiateViewController(withIdentifier: "themeVC") as? ThemeVC else { return }
        
        themeVC.themeClosure = { [weak self] theme in
            guard let self = self else { return }
            Theme.settingTheme = theme
            self.configureTheme(theme)
        }
        
        self.navigationController?.pushViewController(themeVC, animated: true)
    }
    
    @IBOutlet weak var goProfileVC: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "CustomConversationsList", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "customConversationsList")
        
        CustomView.addRadiusWidth(views: [goProfileVC], width: 2)
        goProfileVC.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBarButtonImage)))
    }
    
    @objc func tapBarButtonImage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ProfileVC", bundle: nil)
        guard let profileVC = storyboard.instantiateViewController(withIdentifier:"profileVC") as? ProfileVC else { return }
        let navProfileVC = UINavigationController(rootViewController: profileVC)
        navProfileVC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(navProfileVC, animated: true)
    }
    
    //MARK: Theme
    private func configureTheme(_ theme: ThemeModel){
        UITableView.appearance().backgroundColor = theme.backgroundColor
        UITableViewCell.appearance().backgroundColor = theme.backgroundColor

        tableView?.reloadData()
        imageThemeVC.tintColor = theme.textColor

        self.navigationController?.navigationBar.barStyle = theme.navigationBarStyle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.textColor]
        self.view.backgroundColor = theme.backgroundColor
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
        
        let conversationDateArray = conversationDateArray[indexPath.section][indexPath.row]
        cell.name = conversationDateArray.name
        cell.message = conversationDateArray.message
        cell.date = conversationDateArray.date
        cell.online = conversationDateArray.online
        cell.hasUnreadMessages = conversationDateArray.hasUnreadMessages
        
        if conversationDateArray.image != nil {
        cell.image = conversationDateArray.image
        cell.imageName?.isHidden = true
        } else {
            cell.image = nil
            let imageText = conversationDateArray.name?.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
            cell.imageName?.text = imageText
            cell.imageName?.isHidden = false
        }
        
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
        conversationVC.userImageName = itemsArray.image ?? ""
        self.navigationController?.pushViewController(conversationVC, animated: true)
    }
}
