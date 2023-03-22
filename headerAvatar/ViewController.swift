//
//  ViewController.swift
//  headerAvatar
//
//  Created by MyachinGarpix on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    lazy var scroll:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentSize = CGSize(width: self.view.frame.width, height: 1800)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    lazy var image: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.tintColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avatar"
        
        view.addSubview(scroll)
        scroll.frame = view.frame
        
        if let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type {
            if let largeTitleView = self.findSubview(parentView: self.navigationController!.view, type: largeTitleClass) {
                guard let textView = self.findSubview(parentView: largeTitleView, type: UILabel.self) else { return }
                
                largeTitleView.addSubview(image)
                
                NSLayoutConstraint.activate([
                    image.widthAnchor.constraint(equalToConstant: 36),
                    image.heightAnchor.constraint(equalToConstant: 36),
                    image.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
                    image.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -10),
                ])
            }
        }
    }
    
    
    func findSubview(parentView: UIView, type: UIView.Type) -> UIView? {
        for subview in parentView.subviews {
            if subview.isKind(of: type) {
                return subview
            } else if let desiredInstance = findSubview(parentView: subview, type: type) {
                return desiredInstance
            }
        }
        return nil
    }
    
}

