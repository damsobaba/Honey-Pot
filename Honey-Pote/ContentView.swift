//
//  ContentView.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 02/08/2024.
//

import SwiftUI
import MapKit
import AVFoundation

struct ContentView: View {

    @State var selectedIndex: Int = 0

    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .mapView
            getTabView(type: type)
        }
    }

    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .mapView:
            MapView()
        case .settings:
            SettingsView()
        case .rewards:
            RewardsView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
