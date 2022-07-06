//
//  EntryField.swift
//  inputView
//
//  Created by Karl Koch on 05/07/2022.
//

import SwiftUI

struct EntryField<Content, S>: View where Content: View, S: ShapeStyle {
    let selected: Bool
    let label: String
    let border: S
    let content: () -> Content
    let titleForegroundOnSelection: (Bool) -> Color

    init(label: String, selected: Bool, border: S, @ViewBuilder titleForegroundOnSelection: @escaping (Bool) -> Color, @ViewBuilder content: @escaping () -> Content) {
        self.selected = selected
        self.label = label
        self.border = border
        self.content = content
        self.titleForegroundOnSelection = titleForegroundOnSelection
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    if selected {
                        Spacer().frame(height: geo.size.height * 0.12)
                    } else {
                        Spacer()
                    }

                    Text(label)
                        .font(.callout)
                        .fontWeight(.medium)
                        .scaleEffect(selected ? ((0.75 * min(geo.size.height, 64)) / 64) : 1.0, anchor: .topLeading)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(titleForegroundOnSelection(selected))
                    Spacer()
                }

                content()
            }
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(border, lineWidth: 2)
            )
        }
    }
}
