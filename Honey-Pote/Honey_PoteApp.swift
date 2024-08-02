//
//  Honey_PoteApp.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 02/08/2024.
//

import SwiftUI

@main
struct Honey_PoteApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UIColor {
    static let gold = UIColor(red: 1.0, green: 0.84, blue: 0.0, alpha: 1.0)
}

extension Color {
    static let gold = Color(UIColor.gold)
    static let gradientStart = Color(red: 253/255, green: 200/255, blue: 48/255)
    static let gradientEnd = Color(red: 243/255, green: 115/255, blue: 53/255)
}
struct GradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.gradientStart, .gradientEnd]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .edgesIgnoringSafeArea(.all) // Pour que le gradient occupe toute la surface
    }
}
