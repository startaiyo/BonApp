//
//  FollowersView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/09.
//

import SwiftUI

struct UsersData: Hashable {
    let id = UUID().uuidString
    let name: String
}

struct FollowersView: View {
    let users: [UsersData] = [
        .init(name: "user A"),
        .init(name: "user B")
    ]

    var body: some View {
        ForEach(users, id: \.self) {
            FollowUserItemView(user: $0, isFollowing: true)
        }
    }
}

#Preview {
    FollowersView()
}
