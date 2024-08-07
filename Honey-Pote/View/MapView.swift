//
//  MapView.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 07/08/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 44.8378, longitude: -0.5792), // Bordeaux coordinates
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    @State private var animateNewIconId: UUID? // Identifier for the new icon to animate
    @State private var showIndication = false
    @State private var selectedHint: Indication?
    @State private var inputCode = ""
    @State private var hints = [
        Indication(coordinate: CLLocationCoordinate2D(latitude: 44.828,
                                                      longitude: -0.5792),
                   code: "1234",
                   isHidden: false), // Bordeaux center
        Indication(coordinate: CLLocationCoordinate2D(latitude: 
                                                        44.8278 + 0.009, longitude: -0.5792 + 0.009),
                   code: "5678",
                   isHidden: true), // Approx 1km away
        Indication(coordinate: CLLocationCoordinate2D(latitude: 44.8348 + 0.009,
                                                      longitude: -0.5792 + 0.009),
                   code: "5678",
                   isHidden: true)
    ]

    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: hints.filter { !$0.isHidden }) { hint in
                MapAnnotation(coordinate: hint.coordinate) {
                    Button(action: {
                        selectedHint = hint
                        showIndication = true
                    }) {
                        if animateNewIconId == hint.id {
                            AnimatedIcon(isVisible: true, imageName: "loop")
                        } else {
                            Image("loop")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 34, height: 34)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)

            if showIndication {
                IndicationView(
                    hint: $selectedHint,
                    inputCode: $inputCode,
                    showModal: $showIndication,
                    indications: $hints,
                    animateNewIconId: $animateNewIconId
                )
            }
        }
    }
}
