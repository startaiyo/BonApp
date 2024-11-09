//
//  AddDescriptionView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/09.
//

import SwiftUI

struct AddDescriptionView: View {
    @Environment(\.dismiss) var dismiss

    @State var isTitleEditable = false
    @State var isDescriptionEditable = false
    @State var title = ""
    @State var description = ""

    let image: Image?
    let onSendButtonTapped: () -> Void
    let onBackButtonTapped: () -> Void

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
            VStack {
                HStack {
                    TextField("Title",
                              text: $title)
                        .disabled(!isTitleEditable)
                        .border(isTitleEditable ? .gray : .white, width: 1)
                    Button {
                        isTitleEditable.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .tint(.black)
                    }
                }
                HStack(alignment: .top) {
                    TextEditor(text: $description)
                        .disabled(!isDescriptionEditable)
                        .border(isDescriptionEditable ? .gray : .white, width: 1)
                        .overlay(alignment: .topLeading) {
                            if description.isEmpty {
                                Text("Description")
                                    .allowsHitTesting(false)
                                    .foregroundColor(Color(uiColor: .placeholderText))
                                    .padding(6)
                            }
                        }
                    Button {
                        isDescriptionEditable.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .tint(.black)
                    }
                }
            }

            VStack(spacing: 50) {
                HStack(alignment: .center, spacing: 50) {
                    Button("Back") {
                        dismiss()
                        onBackButtonTapped()
                    }
                        .frame(width: 100, height: 50)
                        .background(.bonAppPink)
                        .cornerRadius(6)
                    Button("Send") {
                        onSendButtonTapped()
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
    AddDescriptionView(image: Image(systemName: "photo"), onSendButtonTapped: {}, onBackButtonTapped: {})
}
