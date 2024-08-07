//
//  Indication.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 07/08/2024.
//

import Foundation
import SwiftUI
import MapKit

struct Indication: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var code: String
    var isHidden: Bool
}
