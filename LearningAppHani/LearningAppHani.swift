//
//  LearningAppHaniApp.swift
//  LearningAppHani
//
//  Created by Hanácsek Gábor on 2023. 06. 03..
//

import SwiftUI

@main
struct LearningAppHani: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
