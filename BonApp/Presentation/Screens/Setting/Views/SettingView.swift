//
//  SettingView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/29.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(spacing: 50) {
            Spacer()
                .frame(height: 20)
            VStack(spacing: 30) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                HStack {
                    Text("name")
                        .font(.system(size: 30))
                    Button {
                        print("edit name")
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.bonAppPink)
                Text("Name")
                HStack {
                    Text("email")
                        .font(.system(size: 30))
                    Button {
                        print("edit email")
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.bonAppPink)
                Text("aaa@hoge.com")
            }
            Spacer()
            HStack(alignment: .center, spacing: 50) {
                Button("Cancel", role: .destructive) {}
                    .frame(width: 100, height: 50)
                    .background(.bonAppPink)
                    .cornerRadius(6)
                Button {

                } label: {
                    Text("SAVE")
                }
                    .frame(width: 100, height: 50)
                    .background(.bonAppPink)
                    .cornerRadius(6)
            }
            Spacer()
        }
    }
}

#Preview {
    SettingView()
}
