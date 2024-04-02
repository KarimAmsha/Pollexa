//
//  UIBarButtonItem+Extensions.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

extension UIBarButtonItem {
    static func menuButtonWithTitle(_ target: Any?, action: Selector, title: String, tintColor: UIColor = .black, backgroundColor: UIColor = .black, textColor: UIColor = .white, radius: CGFloat = 12) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.tintColor = tintColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.addTarget(target, action: action, for: .touchUpInside)
        button.setRounded(radius: radius)

        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 55).isActive = true
        return menuBarItem
    }

    static func menuButton(_ target: Any?, action: Selector, imageName: String, tintColor: UIColor = .black) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.tintColor = tintColor
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
    
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 34).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 34).isActive = true
        return menuBarItem
    }
}
