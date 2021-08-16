//
//  ConversationVC.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 12.07.2021.
//

import UIKit

class ConversationVC: UIViewController {
    
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var imageTable: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    @IBOutlet weak var viewBatButton: UIView!
    
    @IBOutlet weak var imageBarButton: UIImageView!
    
    @IBOutlet weak var labelBarButton: UILabel! {
        didSet {
            labelBarButton.isHidden = true
        }
    }
    
    var navigationTitle = String()
    var userImageName = String()
    
    let recipientCellId = "recipientCell"
    let senderCellId = "senderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        
        
        themeClosure()
        
        CustomView.addRadiusWidth(views: [imageBarButton, viewBatButton], width: 2)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = navigationTitle
        
        settingsBarButtonImage()
    }
    
    private func themeClosure() {
        viewTable.backgroundColor = Theme.settingTheme.tableViewBackround
        imageTable.image = Theme.settingTheme.tableViewImage
    }
    
    func settingsBarButtonImage() {
      
        if userImageName == "" {
            imageBarButton.isHidden = true
            labelBarButton.isHidden = false
            let imageText = navigationTitle.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
            labelBarButton.text = imageText
        } else {
            imageBarButton.image = UIImage(named: userImageName)
        }
    }
}

//MARK: tableViewData
extension ConversationVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversationArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: CustomConversationCell
        let message = conversationArray[indexPath.row]
        let identifier = message.whatMessages ? senderCellId : recipientCellId
        
        
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomConversationCell {
            cell = dequeuedCell
        } else {
            cell = CustomConversationCell(style: .default, reuseIdentifier: identifier)
        }
        
        if identifier == recipientCellId {
            cell.recipientCellView?.backgroundColor = Theme.settingTheme.recipientCellBackround
            cell.messageLabel.textColor = Theme.settingTheme.recipientText
            cell.recipientCellView.layer.cornerRadius = 6
        } else {
            cell.senderCellView?.backgroundColor = Theme.settingTheme.senderCellBackround
            cell.messageLabel.textColor = Theme.settingTheme.senderText
            cell.senderCellView.layer.cornerRadius = 6
        }
        
        cell.backgroundColor = .none
        
        cell.messageText = message.messageText
        
        cell.messageLabel.clipsToBounds = true
        cell.messageLabel.layer.cornerRadius = 6
        
        return cell
    }
}

extension ConversationVC: UITableViewDelegate {
    
}
