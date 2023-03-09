//
//  ContentView.swift
//  Figma 2.0
//
//  Created by Occam Lab on 3/9/23.
//

import SwiftUI

enum ScreenSelector {
    case mainScreen
    case secondScreen
    case thirdScreen
}

class GlobalViewState: ObservableObject {
    @Published var screen: ScreenSelector = .mainScreen
    static var shared = GlobalViewState()
}

struct ContentView: View {
    @ObservedObject var globalViewState = GlobalViewState.shared
    var body: some View {
        switch globalViewState.screen {
        case .mainScreen:
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .padding(20)
                Text("Hello, world!")
                Button("Second Screen") {
                    globalViewState.screen = .secondScreen
                }
                Button("Third Screen") {
                    globalViewState.screen = .thirdScreen
                }
            }
            .padding(100)
            .background(Color(red: 1, green: 0.7, blue: 0.2))
        case .secondScreen:
            SecondScreen()
        case .thirdScreen:
            ThirdScreen()
        }
        
    }
    
}

struct SecondScreen: View {
    @ObservedObject var globalViewState = GlobalViewState.shared
    var body: some View {
        Text("Testing Second Screen")
        Button("Back") {
            globalViewState.screen = .mainScreen
        }
    }
}

struct ThirdScreen: View {
    @ObservedObject var globalViewState = GlobalViewState.shared
    var body: some View {
        Text("Testing Third Screen")
        Button("Back") {
            globalViewState.screen = .mainScreen
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
