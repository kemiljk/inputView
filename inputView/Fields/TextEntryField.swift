//
//  ContentView.swift
//  inputView
//
//  Created by Karl Koch on 05/07/2022.
//

import SwiftUI

public struct TextEntryField<S>: View where S: ShapeStyle {
    @State private var focused = false
    @State private var selected = true//false
    @ScaledMetric(relativeTo: .callout) private var topSpacerHeight: CGFloat = 6
    
    private let foreground: Color
    private let borderOnFocus: (Bool) -> S
    private let titleForegroundOnSelection: (Bool) -> Color

    @Binding var text: String

    let label: String

    public init(label: String, text: Binding<String>, foreground: Color = Color(.black), @ViewBuilder borderOnFocus: @escaping (Bool) -> S, @ViewBuilder titleForegroundOnSelection: @escaping (Bool) -> Color) {
        _text = text
        self.label = label
        self.foreground = foreground
        self.borderOnFocus = borderOnFocus
        self.titleForegroundOnSelection = titleForegroundOnSelection
    }

    public var body: some View {
        EntryField(
            label: label,
            selected: selected,
            border: borderOnFocus(focused),
            titleForegroundOnSelection: titleForegroundOnSelection,
            content: {
                VStack {
                    Spacer().frame(height: topSpacerHeight)

                    TextField(
                        "",
                        text: $text,
                        onEditingChanged: { isEditing in
                            focused = isEditing
                            withAnimation(.easeInOut) {
                                selected = isEditing || !text.isEmpty
                            }
                        },
                        onCommit: {
                            print("Text done: \(text)")
                        }
                    )
                    .lineLimit(1)
                    .font(.callout)
                    .foregroundColor(foreground)
                    .textFieldStyle(.plain)
                }
            }
        )
    }
}
