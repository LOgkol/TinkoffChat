//
//  ConversationVC.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 12.07.2021.
//

import UIKit

class ConversationVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let barButtonImage : UIButton = UIButton.init(type: .custom)
    
    var navigationTitle = String()
    var userImageName = String()
    
    let companionCellId = "companionCell"
    let senderCellId = "senderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = navigationTitle
        
        settingsBarButtonImage()
    }
    
    func settingsBarButtonImage() {
        let containView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        barButtonImage.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        barButtonImage.Round = true
        barButtonImage.setImage(UIImage(named: userImageName), for: .normal)
        containView.addSubview(barButtonImage)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
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
        let identifier = message.whatMessages ? senderCellId : companionCellId
        
        
        if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomConversationCell {
            cell = dequeuedCell
        } else {
            cell = CustomConversationCell(style: .default, reuseIdentifier: identifier)
        }
        
        
        cell.messageText = message.messageText
        
        cell.messageLabel.clipsToBounds = true
        cell.messageLabel.backgroundColor = #colorLiteral(red: 0.9284554124, green: 1, blue: 0.5771009922, alpha: 1)
        cell.messageLabel.layer.cornerRadius = 6
        
        return cell
    }
}

extension ConversationVC: UITableViewDelegate {
    
}
