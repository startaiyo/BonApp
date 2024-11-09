//
//  FollowUserItemView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/09.
//

import SwiftUI

struct FollowUserItemView: View {
    let user: UsersData
    @State var isFollowing: Bool = false

    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            Text(user.name)
                .font(.system(size: 32))
            Spacer()
            Button {
                isFollowing.toggle()
            } label: {
                Image(systemName: isFollowing ? "checkmark.circle" : "circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .tint(.black)
            }
        }
        .padding()
    }
}

#Preview {
    FollowUserItemView(user: .init(name: "user A"), isFollowing: true)
}
