//
//  ViewController.swift
//  SFM26-HW1
//
//  Created by Mykhailo Romanovskyi on 28.03.2021.
//

import UIKit

class ViewController: UIViewController {

    private let lightPic = "Light"
    private let darkPic = "Dark"
    
    private let defaultValue = UserDefaults.standard
    
    private let mainImageView = UIImageView()
    private var switcher: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }

    private func setupElements() {
        switcher = UISegmentedControl(items: [lightPic, darkPic])
        let userIndex = defaultValue.integer(forKey: "mypic")
        switcher.selectedSegmentIndex = userIndex
        switcher.addTarget(self, action: #selector(switcherTapped(_:)), for: .valueChanged)
        
        mainImageView.image = UIImage(named: userIndex == 0 ? lightPic : darkPic)
        view.backgroundColor = userIndex == 0 ? .white : .black
        
        view.addSubview(mainImageView)
        view.addSubview(switcher)
         
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            switcher.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switcher.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func switcherTapped(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainImageView.image = UIImage(named: lightPic)
            view.backgroundColor = .white
            switcher.backgroundColor = .none
            defaultValue.setValue(0, forKey: "mypic")
        case 1:
            mainImageView.image = UIImage(named: darkPic)
            defaultValue.setValue(1, forKey: "mypic")
            switcher.backgroundColor = .lightGray
            view.backgroundColor = .black
        default:
            mainImageView.image = UIImage(named: lightPic)
        }
    }
}

