//
//  IndicationView.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 07/08/2024.
//

import SwiftUI

struct IndicationView: View {

    @Binding var hint: Indication?
    @Binding var inputCode: String
    @Binding var showModal: Bool
    @Binding var indications: [Indication]
    @Binding var animateNewIconId: UUID?
    

    @State private var showError = false
    @State private var beeImageLoading = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showModal = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding()
                }
                Spacer()
                Image("BeeIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 50)
                    .font(.title)
                    .rotationEffect(.degrees(beeImageLoading ? 360 : 0))
                    .animation(beeImageLoading ? Animation.linear(duration: 1): .default)
                    .padding()
            }

            Text("Einstein est décédé en 1955, et avant de mourir, il a prononcé une phrase qui, aujourd'hui à un écho particulier : « Si l'abeille disparaissait de la surface du globe, l'homme n'aurait plus que quatre ans à vivre ».")
                .fontDesign(.monospaced)
                .padding(.vertical, 30)
            Text("Entrez le code pour révéler l'indice suivant")
                .foregroundColor(.gold)
                .fontDesign(.monospaced)
                .fontWeight(.heavy)
            TextField("Code", text: $inputCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if showError {
                Text("Try again")
                    .foregroundColor(.red)
                    .padding(.top, 5)
            }

            Button(action: {
                beeImageLoading.toggle()
                /// Cette méthode cherche le premier indice dans le tableau hints dont l'ID correspond à celui de hint. La variable hint est l'indice actuellement sélectionné. Si un indice est trouvé, l'index de cet indice est retourné.
                if let index = indications.firstIndex(where: { $0.id == hint?.id }), inputCode == indications[index].code {
                    if index + 1 < indications.count { // Vérifie si l'indice suivant existe dans le tableau hints. index + 1 est l'index de l'élément suivant. Cette vérification s'assure que l'on ne tente pas d'accéder à un indice hors du tableau.
                        indications[index + 1].isHidden = false // Si l'indice suivant existe, il est rendu visible en mettant sa propriété isHidden à false.
                        animateNewIconId = indications[index + 1].id // Set the new icon ID for animation
                    }
                    showModal = false
                    inputCode = ""
                    showError = false
                } else {
                    showError = true
                    inputCode = ""
                    vibrateOnError()
                }
            }) {
                Text("Soumettre")
                    .padding()
                    .fontDesign(.monospaced)
                    .background(GradientView())
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 8)
        .padding()
    }

    private func vibrateOnError() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
