//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 01.07.2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var textImage: UILabel!
    
    @IBOutlet weak var nameProfile: UILabel!
    @IBOutlet weak var descriptionProfile: UILabel!
    @IBOutlet weak var editingButton: UIButton!
    
    @IBOutlet weak var closerThemeProfileVC: UIBarButtonItem!
    
    @IBAction func closedProfileVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editingButton(_ sender: Any) {
        showAlertOK(title: "ВОУ ВОУ", message: "По причине криворукости разработчика, кнопка временно не работает, как только научится - так сделает")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageProfile.image = UserProfile.shared.profilePhoto
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.clipsToBounds = true

        nameProfile.text = UserProfile.shared.name

        descriptionProfile.text = UserProfile.shared.description
      
        CustomView.addBorderColorButton(buttons: [editingButton], borderWidth: 1, borderColor: #colorLiteral(red: 0.1051317826, green: 0.533177197, blue: 0.9983835816, alpha: 1))
        
        settingsTapImageView()
        settingTextImage()
        themeClosure()
        
    }
    
    func settingsTapImageView() {
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.tapImageView))
        imageProfile.addGestureRecognizer(tapImage)
        imageProfile.isUserInteractionEnabled = true
    }
        
    @objc
    func tapImageView() {
        settingImageAlert()
    }
    
    func settingTextImage () {
        let imageText = nameProfile?.text?.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
        
        guard let textImage = textImage else { return }
        textImage.text = imageText
        
        textImage.isHidden = false
        imageProfile?.image = nil
    }
    
//MARK: Theme
    private func themeClosure() {
        self.view.backgroundColor = Theme.settingTheme.backgroundColor
        nameProfile.textColor = Theme.settingTheme.textColor
        descriptionProfile.textColor = Theme.settingTheme.textColor
        self.navigationController?.navigationBar.barStyle = Theme.settingTheme.navigationBarStyle
        closerThemeProfileVC.tintColor = Theme.settingTheme.textColor
        CustomView.addBorderColorLabel(labels: [nameProfile,descriptionProfile,], borderWidth: 1, borderColor: Theme.settingTheme.borderColor)
    }
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func settingImageAlert() {
        
        let allertImage = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photo = UIAlertAction(title: "Сделать фото", style: .default) {_ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.settingAllertImage(source: .camera)
            }
            else {
                self.showAlertOK(title: "Ошибка", message: "На устройстве отсутствует камера")
            }
        }
        
        let gallery = UIAlertAction(title: "Установить из галереи", style: .default) {_ in
            self.settingAllertImage(source: .photoLibrary)
        }
        
        let delete = UIAlertAction(title: "Удалить", style: .destructive) {_ in
            let alert = UIAlertController(title: "Вы действительно хотите удалить аватарку?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { _ in
                self.settingTextImage()
                
            }))
            alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { _ in
            }))
            self.present(alert, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
        }
        allertImage.addAction(photo)
        allertImage.addAction(gallery)
        allertImage.addAction(delete)
        allertImage.addAction(cancel)
        self.present(allertImage, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func settingAllertImage(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let settingImage = UIImagePickerController()
            settingImage.delegate = self
            settingImage.allowsEditing = true
            settingImage.sourceType = source
            present(settingImage, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let result = info[.editedImage] as? UIImage else { return }
        UserProfile.shared.profilePhoto = result
        imageProfile?.image = result
        dismiss(animated: true)
        textImage?.isHidden = true
    }
}
