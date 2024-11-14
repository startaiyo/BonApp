//
//  FollowsView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/09.
//

import SwiftUI

struct FollowsView: View {
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
    FollowsView()
}
