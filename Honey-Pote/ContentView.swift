//
//  ContentView.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 02/08/2024.
//

import SwiftUI
import MapKit

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

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Réglages")
            .font(.largeTitle)
    }
}

struct RewardsView: View {
    var body: some View {
        Text("Récompenses")
            .font(.largeTitle)
    }
}
