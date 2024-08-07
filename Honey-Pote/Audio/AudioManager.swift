//
//  AudioManager.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 07/08/2024.
//

import AVFoundation
import SwiftUI

class AudioManager: ObservableObject {
    private var audioPlayer: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "MagicHintSound", withExtension: "mp3") else {
            print("Le fichier audio est introuvable")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Erreur de lecture du fichier audio: \(error.localizedDescription)")
        }
    }
}
