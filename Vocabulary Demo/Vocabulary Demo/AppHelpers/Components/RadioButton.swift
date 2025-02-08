//
//  RadioButton.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import SwiftUI

// Custom Radio Button
struct RadioButton: View {
    let title: String
    @Binding var selected: String

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
            Spacer()
            Image(systemName: selected == title ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
        .onTapGesture {
            selected = title
        }
    }
}
