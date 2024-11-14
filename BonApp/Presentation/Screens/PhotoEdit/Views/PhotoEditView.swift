//
//  PhotoEditView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/01.
//

import SwiftUI

struct PhotoEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var brightness: CGFloat = 0.0
    @State private var isLinkActive: Bool = false
    let onNextButtonTapped: () -> Void

    let image: Image?

    var body: some View {
        VStack(spacing: 50) {
            Spacer()
                .frame(height: 20)
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .tint(.red)
                }
                Spacer()
            }
            if let image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 200,
                           maxHeight: UIScreen.main.bounds.height)
                    .padding()
            }
            Spacer()
                .frame(height: 50)

            VStack(spacing: 50) {
                HStack {
                    Image(systemName: "sun.min")
                    Slider(value: $brightness)
                    Image(systemName: "sun.max")
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach((1...100), id: \.self) { _ in
                            Image(systemName: "photo")
                        }
                    }
                }
                HStack(alignment: .center, spacing: 50) {
                    Button("Cancel", role: .destructive) {
                        dismiss()
                    }
                        .frame(width: 100, height: 50)
                        .background(.bonAppPink)
                        .cornerRadius(6)
                    Button("Next") {
                        onNextButtonTapped()
                        dismiss()
                    }
                        .frame(width: 100, height: 50)
                        .background(.bonAppPink)
                        .cornerRadius(6)
                }
            }
        }
        .padding()
    }
}

#Preview {
    PhotoEditView(onNextButtonTapped: { }, image: Image(systemName: "photo"))
}
