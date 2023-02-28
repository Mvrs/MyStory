//
//  DetailViewController.swift
//  MyStory
//
//  Created by Marlon Johnson on 2/27/23.
//

import UIKit

class DetailViewController: UIViewController {
    var contextItem: ContextItem!
    
    private let photoImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
         imageView.contentMode = .scaleAspectFit
         return imageView
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(photoImageView)
              photoImageView.image = UIImage(named: contextItem.photo)
              
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        title = contextItem.role

        let descriptionLabel = UILabel(frame: CGRect(x: 20, y: 320, width: view.bounds.width - 40, height: 200))
        descriptionLabel.text = contextItem.funFact
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.sizeToFit()
        view.addSubview(descriptionLabel)
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        backButton.frame = CGRect(x: 20, y: view.bounds.height - 80, width: view.bounds.width - 40, height: 50)
        view.addSubview(backButton)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
