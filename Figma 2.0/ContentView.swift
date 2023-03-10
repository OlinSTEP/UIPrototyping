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
            MainScreen()
        case .secondScreen:
            SecondScreen()
        case .thirdScreen:
            ThirdScreen()
        }
        
    }
    
}

struct MainScreen : View {
    @ObservedObject var globalViewState = GlobalViewState.shared

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    Button("Control 1") {
                        print("Tapped button 1")
                    }
                    Button("Control 2") {
                        print("Tapped button 2")
                    }
                    Button("Control 1") {
                        print("Tapped button 1")
                    }
                    Button("Control 2") {
                        print("Tapped button 2")
                    }
                    Button("Control 1") {
                        print("Tapped button 1")
                    }
                    Button("Control 2") {
                        print("Tapped button 2")
                    }
                }
            }
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
