//
//  BaseTabView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/11/01.
//

import SwiftUI

struct BaseTabView: View {
    @State private var selection: AppTabScreen? = .home
    @State private var isShowingSideMenu = false
    @State private var isShowingSetting = false
    @State private var isShowingFollows = false
    @State private var isShowingFollowers = false

    var body: some View {
        ZStack {
            NavigationView {
                AppTabView(selection: $selection)
                    .navigationTitle("BonApp")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                isShowingSideMenu.toggle()
                            } label: {
                                Image(systemName: "person.crop.circle")
                                    .renderingMode(.template)
                                    .foregroundStyle(.black)
                            }
                        }
                        ToolbarItem {
                            Button {
                                print("Filter tapped")
                            } label: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .renderingMode(.template)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color.bonAppPink, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
            }
            SideMenuView(isOpen: $isShowingSideMenu,
                         onSettingClicked: {
                isShowingSetting = true
            },
                         onFollowsClicked: {
                isShowingFollows = true
            },
                         onFollowersClicked: {
                isShowingFollowers = true
            })
            .edgesIgnoringSafeArea(.all)
        }
        .sheet(isPresented: $isShowingSetting) {
            SettingView()
        }
        .sheet(isPresented: $isShowingFollows) {
            FollowsView()
        }
        .sheet(isPresented: $isShowingFollowers) {
            FollowersView()
        }
    }
}

struct SideMenuView: View {
    @Binding var isOpen: Bool
    let width: CGFloat = 100
    let onSettingClicked: () -> Void
    let onFollowsClicked: () -> Void
    let onFollowersClicked: () -> Void

    var body: some View {
        ZStack {
            // 背景部分
            GeometryReader { geometry in
                EmptyView()
            }
                .background(Color.gray.opacity(0.3))
                .opacity(self.isOpen ? 1.0 : 0.0)
                .opacity(1.0)
                .animation(.easeIn(duration: 0.25), value: isOpen)
                .onTapGesture {
                    self.isOpen = false
                }

            HStack {
                VStack() {
                    SideMenuContentView(text: "Follows") {
                        onFollowsClicked()
                    }
                    SideMenuContentView(text: "Followers") {
                        onFollowersClicked()
                    }
                    SideMenuContentView(text: "Settings") {
                        onSettingClicked()
                    }
                    Spacer()
                }
                    .frame(width: width)
                    .background(Color(.bonAppPink))
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.easeIn(duration: 0.25), value: isOpen)
                    .padding(.top, 60)
                Spacer()
            }
        }
    }
}

struct SideMenuContentView: View {
    let text: String
    let onTapGesture: () -> Void

    var body: some View {
        Button {
            onTapGesture()
        } label: {
            Text(text)
        }
            .foregroundColor(.gray)
            .font(.headline)
            .padding(.top, 30)
            .padding(.leading, 5)
    }
}

#Preview {
    BaseTabView()
        .environment(Router())
}
