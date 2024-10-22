//
//  ContentView.swift
//  BonApp
//
//  Created by Shotaro Doi on 2024/10/18.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: AppScreen? = .home
    @State private var isShowingSideMenu = false

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
            SideMenuView(isOpen: $isShowingSideMenu)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SideMenuView: View {
    @Binding var isOpen: Bool
    let width: CGFloat = 100

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
                    SideMenuContentView(text: "Follows")
                    SideMenuContentView(text: "Followers")
                    SideMenuContentView(text: "Settings")
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

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Button {
            print(text + "tapped")
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
    ContentView()
        .environment(Router())
}
