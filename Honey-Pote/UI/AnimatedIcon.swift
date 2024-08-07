//
//  AnimatedIcon.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 07/08/2024.
//


import SwiftUI

struct AnimatedIcon: View {
    @StateObject private var audioManager = AudioManager() // Gestionnaire audio
    var isVisible: Bool
    let imageName: String

    @State private var scale: CGFloat = 2.0 // Taille initiale plus grande
    @State private var offset: CGSize = .zero

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 64, height: 64) // Taille de l'icône
            .scaleEffect(scale) // Effet de mise à l'échelle
            .offset(offset) // Effet de décalage pour la secousse
            .opacity(isVisible ? 1 : 0) // Animation d'opacité
            .foregroundColor(.black) // Couleur jaune
            .animation(
                .easeInOut(duration: 0.5) // Animation de mise à l'échelle
                .repeatCount(1, autoreverses: false) // Animation de mise à l'échelle
                .delay(0.1) // Délai pour permettre à l'animation de démarrer
            , value: scale)
            .animation(
                .easeInOut(duration: 0.4)
                .repeatCount(5, autoreverses: true) // Effet de secousse
                .delay(1.5) // Délai pour que la secousse commence après la mise à l'échelle
            , value: offset)
            .onAppear {
                // Déclenche les animations après l'apparition de l'icône
                withAnimation {
                    scale = 0.5 // Réduit la taille de l'icône
                }
                withAnimation {
                    offset = CGSize(width: 10, height: 0) // Secousse vers la droite
                }
                audioManager.playSound() // Joue le son
            }
    }
}
#Preview {
    AnimatedIcon(isVisible: true, imageName: "star.fill")
}
