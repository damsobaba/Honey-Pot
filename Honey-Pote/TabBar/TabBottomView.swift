//
//  TabBottomView.swift
//  Honey-Pote
//
//  Created by Adam Mabrouki on 02/08/2024.
//

import SwiftUI

struct TabBottomView: View {
    let tabbarItems: [TabItemData]
    var height: CGFloat = 70
    var width: CGFloat = UIScreen.main.bounds.width - 32
    @Binding var selectedIndex: Int

    var body: some View {
        HStack(spacing: 20) {
            Spacer()

            ForEach(tabbarItems.indices, id: \.self) { index in
                let item = tabbarItems[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(data: item, isSelected: isSelected)
                }
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(GradientView())
        .cornerRadius(13)
        .shadow(radius: 5, x: 0, y: 4)
    }
}

struct TabBottomView_Previews: PreviewProvider {
    static var previews: some View {
        TabBottomView(tabbarItems: [
            TabItemData(image: "house", selectedImage: "house.fill", title: "Home"),
            TabItemData(image: "star.fill", selectedImage: "star.fill",title: "Favorite")],
                      selectedIndex: .constant(0))
    }
}
