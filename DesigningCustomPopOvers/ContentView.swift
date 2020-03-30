//
//  ContentView.swift
//  DesigningCustomPopOvers
//
//  Created by Ramill Ibragimov on 30.03.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("PopOver")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                .padding([.horizontal, .bottom])
                .background(Color.green)
                
                Spacer()
                
            }
            
            VStack(alignment: .center, spacing: 15) {
                
                if self.show {
                    
                    PopOver()
                        .background(Color.white)
                        .clipShape(ArrowShape())
                        .cornerRadius(15)
                }

                Button(action: {
                    withAnimation(.spring()) {
                        self.show.toggle()
                    }
                }) {
                    Image(systemName: self.show ? "xmark" : "arrow.up")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.green)
                        .padding()
                }.background(Color.white)
                .clipShape(Circle())
            }.padding()
            
        }.edgesIgnoringSafeArea(.top)
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct PopOver: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "house")
                        .font(.title)
                    Text("Home")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                    Text("Search")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "heart")
                        .font(.title)
                    Text("Likes")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "person")
                        .font(.title)
                    Text("Account")
                }
            }
            Divider()
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Text("")
                }
            }
        }
        .foregroundColor(Color.black)
        .frame(width: 150)
        .padding()
        .background(Color.white)
    }
}

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = rect.width / 2
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 20))
            
            path.addLine(to: CGPoint(x: center - 15, y: rect.height - 20))
            path.addLine(to: CGPoint(x: center, y: rect.height))
            path.addLine(to: CGPoint(x: center + 15, y: rect.height - 20))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height - 20))
        }
    }
}
