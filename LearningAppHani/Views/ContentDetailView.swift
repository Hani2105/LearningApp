//
//  ContentDetailView.swift
//  LearningAppHani
//
//  Created by Hanácsek Gábor on 2023. 06. 04..
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = URL(string: "https://vimeo.com/91801524")
        
        if url != nil{
            VideoPlayer(player: AVPlayer(url: url!))
        }
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
            .environmentObject(ContentModel())
    }
}
