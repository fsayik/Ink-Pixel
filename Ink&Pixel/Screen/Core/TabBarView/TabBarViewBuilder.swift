//
//  TabBarViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

struct TabBarViewBuilder {
    static func build(coordinator: Coordinator) -> UITabBarController {
        let tabBar = TabBarViewController(coordinator: coordinator)
        return tabBar
    }
}
