//
//  TabItemData.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 02/08/2024.
//

import Foundation

struct TabItemData {
    let image: String
    let selectedImage:String
    let title: String
}

enum TabType: Int, CaseIterable {
    case mapView = 0
    case settings
    case rewards

    var tabItem: TabItemData {
        switch self {
        case .mapView:
            return TabItemData(image: "map", selectedImage: "map.fill", title: "Carte")
        case .settings:
            return TabItemData(image: "gearshape", selectedImage: "gearshape.fill", title: "Réglage")
        case .rewards:
            return TabItemData(image: "gift", selectedImage: "gift.fill", title: "Trésor")
        }
    }
}
