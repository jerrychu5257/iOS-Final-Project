//
//  iOS_assignment3App.swift
//  iOS-assignment3
//
//  Created by Chien Yuan Chu on 2024/4/23.
//

import SwiftUI

@main
struct iOS_assignment3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(System())
        }
    }
}
