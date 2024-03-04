//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Leo  on 02.03.24.
//

import SwiftUI



struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let minY = proxy.frame(in: .global).minY
                        let offset = minY - fullView.size.height / 2
                        let opacity = proxy.frame(in: .global).minY / 200
                        let scaleFactor = max(1 - offset / fullView.size.height, 0.5)
                        let hue = min(1, (proxy.frame(in: .global).maxY / fullView.frame(in: .global).height))
                        
                        Text("Row \(index) : \(opacity.formatted())")
                            .font(.title.bold())
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.secondary)
                            .background(Color(hue: hue, saturation: 0.8, brightness: 1))
                            .clipShape(.capsule)
                            .opacity(opacity)
                            .scaleEffect(scaleFactor)
                            .rotation3DEffect(.degrees(offset) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
        .background(.black)
    }
}

#Preview {
    ContentView()
}
