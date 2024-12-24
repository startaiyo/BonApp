//
//  AddDescriptionView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/09.
//

import SwiftUI

struct AddDescriptionView: View {
    @Environment(\.dismiss) var dismiss

    @State var title = ""
    @State var description = ""
    @State private var keyboardOffset: CGFloat = 0

    let image: Image?
    let onSendButtonTapped: (String, String) -> Void
    let onSaveButtonTapped: (String, String) -> Void
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
            VStack {
                TextField("ENTER_TITLE",
                          text: $title)
                .textFieldStyle(.roundedBorder)
                TextField("ENTER_DESCRIPTION",
                          text: $description,
                          axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(.all)
            }
            VStack(spacing: 50) {
                HStack(alignment: .center, spacing: 50) {
                    if featureFlags().isDebugMode {
                        Button("Back") {
                            dismiss()
                            onBackButtonTapped()
                        }
                        .frame(width: 100, height: 50)
                        .background(.bonAppPink)
                        .cornerRadius(6)
                    }
                    Button {
                        onSaveButtonTapped(title, description)
                        dismiss()
                    } label: {
                        Text("SAVE")
                    }
                    .frame(width: 100, height: 50)
                    .background(.bonAppPink)
                    .cornerRadius(6)
                    if featureFlags().isDebugMode {
                        Button("Send") {
                            onSendButtonTapped(title, description)
                            dismiss()
                        }
                        .frame(width: 100, height: 50)
                        .background(.bonAppPink)
                        .cornerRadius(6)
                    }
                }
            }
            Spacer()
        }
        .padding(.bottom, keyboardOffset)
        .animation(.easeOut(duration: 0.3), value: keyboardOffset)
        .onTapGesture {
            dismissKeyboard()
        }
        .onAppear {
            addKeyboardObservers()
        }
        .onDisappear {
            removeKeyboardObservers()
        }
    }

    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                keyboardOffset = keyboardFrame.height - 20 // Add some padding
            }
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            keyboardOffset = 0
        }
    }

    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

#Preview {
    AddDescriptionView(image: Image(systemName: "photo"), onSendButtonTapped: {_,_ in }, onSaveButtonTapped: {_,_ in }, onBackButtonTapped: {})
}
