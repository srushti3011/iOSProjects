//
//  NavigationBarCustomizationViewController.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 11/03/25.
//

import UIKit

class NavigationBarCustomizationViewController: UIViewController {

    @IBOutlet weak var lblButtonPressed: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpNavigationToolBar()
    }
    
    func setUpNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.backward.fill"), style: .plain, target: self, action: #selector(tappedBackButton))
//        navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.backward.fill"), style: .plain, target: self, action: #selector(tappedBackButton))
//        navigationItem.backButtonTitle = "Go Back"
//        print(navigationItem.backBarButtonItem)
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "BackButtonColor")

        let customView = UIView()
        let imageView = UIImageView(image: UIImage(named: "KtLogo"))
        customView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        let label = UILabel()
        label.text = "Martha Criag"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        customView.addSubview(imageView)
        customView.addSubview(label)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: customView.trailingAnchor)
        ])
        navigationItem.titleView = customView
        
        let rightButtons = [
            UIBarButtonItem(image: UIImage(systemName: "phone"), style: .plain, target: self, action: #selector(tappedVoiceCallButton)),
            UIBarButtonItem(image: UIImage(systemName: "video"), style: .plain, target: self, action: #selector(tappedVideoCallButton))
        ]
        navigationItem.rightBarButtonItems = rightButtons
    }
    
    func setUpNavigationToolBar() {
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let bookmark = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        let button = UIBarButtonItem(image: UIImage(systemName: "video"), style: .plain, target: self, action: #selector(tappedVideoCallButton))
        toolbarItems = [add, spacer, bookmark, button]
        navigationController?.setToolbarHidden(false, animated: false)
    }
    
    @objc func tappedBackButton() {
        print("button tapped")
        lblButtonPressed.text = "Back button pressed"
        navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedVoiceCallButton() {
        print("button tapped")
        lblButtonPressed.text = "Voice call button pressed"
    }
    
    @objc func tappedVideoCallButton() {
        print("button tapped")
        lblButtonPressed.text = "Video call button pressed"
    }
    
    @objc func tappedUploadButton() {
        lblButtonPressed.text = "Upload button pressed"
    }
    @IBAction func btnNextOne(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaivgationBarCustomizationStoryboard", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "AfterCustomizationViewController") as! AfterCustomizationViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
