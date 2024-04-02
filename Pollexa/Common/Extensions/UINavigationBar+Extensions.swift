//
//  UINavigationBar+Extensions.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

extension UINavigationBar {
    func applyLargeNavigation() {
        prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = ColorManager.grayF8F8FF
        appearance.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 34, weight: .bold),
            .foregroundColor: UIColor.black
        ]
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
    }
}
