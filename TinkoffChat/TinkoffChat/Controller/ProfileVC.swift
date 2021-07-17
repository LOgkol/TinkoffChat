//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 01.07.2021.
//

import UIKit
//import AudioToolbox

var logPVC: Bool = false

class ProfileVC: UIViewController {
    
    @IBOutlet weak var imageView: UIView?
    @IBOutlet weak var imageProfile: UIImageView?
    @IBOutlet weak var nameProfile: UILabel?
    @IBOutlet weak var descriptionProfile: UILabel?
    @IBOutlet weak var textImage: UILabel?
    @IBOutlet weak var editingButton: UIButton?
    
    @IBAction func editingButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "ВОУ ВОУ", message: "По причине криворукости разработчика, кнопка временно не работает.Как только научится - так сделает", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        tapticFeedback()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space = " "
        
        guard let imageProfile = imageProfile else { return }
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.clipsToBounds = true
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.tapImageView))
        imageProfile.addGestureRecognizer(tapImage)
        imageProfile.isUserInteractionEnabled = true
        
        guard let nameProfile = nameProfile else { return }
        nameProfile.text = "\(space)Alexsandr Dzhegutanov\(space)"
        nameProfile.layer.cornerRadius = 4
        nameProfile.layer.borderWidth = 1
        nameProfile.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameProfile.clipsToBounds = true
        
        guard let descriptionProfile = descriptionProfile else { return }
        descriptionProfile.layer.cornerRadius = 8
        descriptionProfile.layer.borderWidth = 1
        descriptionProfile.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        descriptionProfile.clipsToBounds = true
        
        guard let editingButton = editingButton else { return }
        editingButton.layer.cornerRadius = 15
        editingButton.layer.borderWidth = 2
        editingButton.layer.borderColor = #colorLiteral(red: 0.1051317826, green: 0.533177197, blue: 0.9983835816, alpha: 1)
        editingButton.clipsToBounds = true
        
        settingImage()
    }
    
//        override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            let screenShot = self.imageView?.takeScreenshot()
//            image = (screenShot?.resize(CGSize.init(width: 35, height: 35)))!
//            print("screenShot\(image)")
//        }
    
    //срабатывает перед закрытием вью
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let screenShot = self.imageView?.takeScreenshot()
        image = (screenShot?.resize(CGSize.init(width: 35, height: 35)))!
    }
    
    func tapticFeedback() {
        let tapticFeedback = UINotificationFeedbackGenerator()
        tapticFeedback.notificationOccurred(.success)
    }
    
    @objc
    func tapImageView() {
        settingImageAlert()
        tapticFeedback()
    }
    
    func settingImage () {
        
        let imageText = nameProfile?.text?.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
        
        guard let textImage = textImage else { return }
        textImage.text = imageText
        
        textImage.isHidden = false
        imageProfile?.image = nil
    }
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func settingImageAlert() {
        
        let allertImage = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photo = UIAlertAction(title: "Сделать фото", style: .default) {_ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.settingAllertImage(source: .camera)
                self.tapticFeedback()
            }
            else {
                let alert = UIAlertController(title: "Ошибка", message: "На устройстве отсутствует камера", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
            }
        }
        
        let gallery = UIAlertAction(title: "Установить из галереи", style: .default) {_ in
            self.settingAllertImage(source: .photoLibrary)
            self.tapticFeedback()
        }
        
        let delete = UIAlertAction(title: "Удалить", style: .destructive) {_ in
            let alert = UIAlertController(title: "Вы действительно хотите удалить аватарку?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { _ in
                self.settingImage()
                self.tapticFeedback()
            }))
            alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: { _ in
                self.tapticFeedback()
            }))
            self.present(alert, animated: true)
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            self.tapticFeedback()
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
        imageProfile?.image = info[.editedImage] as? UIImage
        imageProfile?.contentMode = .scaleAspectFill
        imageProfile?.clipsToBounds = true
        dismiss(animated: true)
        
        textImage?.isHidden = true
    }
}

extension UIView {
    func takeScreenshot() -> UIImage {
        
        // Begin context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // Draw view in that context
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // And finally, get image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if (image != nil)
        {
            return image!
        }
        return UIImage()
    }
}

extension UIImage {
    func resize(_ size: CGSize) -> UIImage {
        var rect = CGRect.zero
        rect.size = size
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
