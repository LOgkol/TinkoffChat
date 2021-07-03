//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 01.07.2021.
//

import UIKit
import PhotosUI

var logPVC: Bool = false

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView?
    @IBOutlet weak var nameProfile: UILabel?
    @IBOutlet weak var descriptionProfile: UILabel?
    @IBOutlet weak var textImage: UILabel?
    @IBOutlet weak var editingButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageProfile = imageProfile else { return }
        imageProfile.layer.cornerRadius = imageProfile.frame.size.width / 2
        imageProfile.clipsToBounds = true
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.tapImageView))
        imageProfile.addGestureRecognizer(tapImage)
        imageProfile.isUserInteractionEnabled = true
        
        guard let nameProfile = nameProfile else { return }
        nameProfile.text = "Alexsandr Dzhegutanov"
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
        viewLive(frame:":\(String(describing: editingButton.frame))")
    }
    
    @objc
    func tapImageView() {
        settingImageAlert()
    }
    
    func settingImage () {
        
        let imageText = nameProfile?.text?.components(separatedBy: " ").map { String($0.prefix(1))}.joined()
        
        guard let textImage = textImage else { return }
        textImage.text = imageText
        
        textImage.isHidden = false
        imageProfile?.image = nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let editingButton = editingButton else { return }
        viewLive(frame:":\(String(describing: editingButton.frame))")
    }
    
    /*
     Размеры фреймов кнопки "редактировать" в методах viewDidLoad и viewDidAppear отличаются потому что верстка в сториборде
     происходит на размере устройства iphone 11 или 11Pro. Тогда как по заданию тестировать приложение мы должны на устройстве iphone
     iphone Se2. Если же в сториборде выбрать устройство iphone Se2 - frame кнопки "редактировать в 2-х выше перечисленных
     методах будет одинаков."
     */
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        if logPVC == true {
            if let editingButton = editingButton {
                print(editingButton.frame)
            } else {
                print("no value")
            }
        }
    }
    
    func viewLive(frame: String, viewFunc: String = #function) {
        if logPVC == true {
            print("\(viewFunc), frame: \(frame)")
        }
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func settingImageAlert() {
        
        let allertImage = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let photo = UIAlertAction(title: "Сделать фото", style: .default) {_ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.settingAllertImage(source: .camera)
            }
            else {
                let alert = UIAlertController(title: "Ошибка", message: "На устройстве отсутствует камера", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
            }
        }
        
        let gallery = UIAlertAction(title: "Установить из галереи", style: .default) {_ in
            self.settingAllertImage(source: .photoLibrary)
        }
        
        let delete = UIAlertAction(title: "Удалить", style: .destructive) {_ in
            self.settingImage()
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
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
