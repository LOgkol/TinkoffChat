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
    
    var ConversationDateArray = [
        
        // MARK: Online
        [ConversationModel(name: "Артем", message: "Yamaha r6 very good", date: Date(timeIntervalSinceNow: 0), online: true, hasUnreadMessages: false, image: "yamahaR6"),
         ConversationModel(name: "Арно", message: "Постановка в Алтезу или перекладка в Форд?🤔", date: Date(timeIntervalSinceNow: 0), online: true, hasUnreadMessages: false, image: "drift"),
         ConversationModel(name: "Боря", message: "DRIFT KING", date: Date(timeIntervalSinceNow: 0), online: true, hasUnreadMessages: false, image: "DriftSiera"),
         ConversationModel(name: "Алекс", message: "Hp босса 20%! Держимся ЗА ОРДУ!!!", date: Date(timeIntervalSinceNow: 0), online: true, hasUnreadMessages: false, image: "Trall"),
         ConversationModel(name: "Маша", message: "Ахах, в универе скучно без тебя:(", date: Date(timeIntervalSinceNow: 0), online: true, hasUnreadMessages: false, image: "finUniver"),
         ConversationModel(name: "Ти́моти До́нальд Кук", message: "Happy New Year!", date: nil, online: true, hasUnreadMessages: false, image: "TimKyk"),
         ConversationModel(name: "Костя", message: "Бро, тебе пора искать работу ios dev", date: nil, online: true, hasUnreadMessages: false, image: "swift"),
         ConversationModel(name: "Anonymous", message: nil, date: nil, online: true, hasUnreadMessages: false, image: "anonymous"),
         ConversationModel(name: "Олеся", message: "200 в городе?! Я домой на такси", date: nil, online: true, hasUnreadMessages: false, image: "Bmw"),
         ConversationModel(name: "Multi JOGer", message: "Бро, шашки топ! БОЛЬШЕ ШАШЕК НА ЮТУБ", date: nil, online: true, hasUnreadMessages: false, image: "Joger")],
        
        // MARK: History
        [ConversationModel(name: "Артем", message: "Yamaha r6 very good", date: Date(timeIntervalSinceNow: 0), online: false, hasUnreadMessages: true, image: "yamahaR6"),
         ConversationModel(name: "Арно", message: "Постановка в Алтезу или перекладка в Форд?🤔", date: Date(timeIntervalSinceNow: 0), online: false, hasUnreadMessages: true, image: "drift"),
         ConversationModel(name: "Боря", message: "DRIFT KING", date: Date(timeIntervalSinceNow: 0), online: false, hasUnreadMessages: true, image: "DriftSiera"),
         ConversationModel(name: "Алекс", message: "Hp босса 20%! Держимся ЗА ОРДУ!!!", date: Date(timeIntervalSinceNow: 0), online: false, hasUnreadMessages: true, image: "Trall"),
         ConversationModel(name: "Маша", message: "Ахах, в универе скучно без тебя:(", date: Date(timeIntervalSinceNow: 0), online: false, hasUnreadMessages: true, image: "finUniver"),
         ConversationModel(name: "Ти́моти До́нальд Кук", message: "Happy New Year!", date: nil, online: false, hasUnreadMessages: true, image: "TimKyk"),
         ConversationModel(name: "Костя", message: "Бро, тебе пора искать работу ios dev", date: nil, online: false, hasUnreadMessages: true, image: "swift"),
         ConversationModel(name: "Anonymous", message: nil, date: nil, online: false, hasUnreadMessages: true, image: "anonymous"),
         ConversationModel(name: "Олеся", message: "200 в городе?! Я домой на такси", date: nil, online: false, hasUnreadMessages: true, image: "Bmw"),
         ConversationModel(name: "Multi JOGer", message: "Бро, шашки топ! БОЛЬШЕ ШАШЕК НА ЮТУБ", date: nil, online: false, hasUnreadMessages: true, image: "Joger")]
        
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nibName = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "CustomTableViewCell")
        
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
        guard let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else { return }
        present(profileVC, animated: true) {
            self.barButtonImage.setImage(image, for: .normal)
        }
    }
}

extension ConversationsListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ConversationDateArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ConversationDateArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: CustomTableViewCell
        
        if let dequeueReusableCell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            cell = dequeueReusableCell
        } else {
            cell = CustomTableViewCell()
        }
        
        let pathToProperty = ConversationDateArray[indexPath.section][indexPath.row]
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
    
}

extension ConversationsListVC: UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Conversation", bundle: nil)
        let conversationVC = storyboard.instantiateViewController(withIdentifier: "Conversation")
        
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
