//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-06-30.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
