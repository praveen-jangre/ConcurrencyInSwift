//
//  ContentView.swift
//  ConcurrencyInSwift
//
//  Created by Praveen Jangre on 27/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
//            Task {
//                await SimulateMath().combineResult()
//            }
            implementGCD()
            
        }
    }
}

#Preview {
    ContentView()
}
