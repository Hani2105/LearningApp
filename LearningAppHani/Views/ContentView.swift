//
//  ContentView.swift
//  LearningAppHani
//
//  Created by Hanácsek Gábor on 2023. 06. 04..
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var model:ContentModel
    
    var body: some View {
      
        ScrollView{
            LazyVStack{
                
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count){index in
                        NavigationLink {
                            ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                })
                        } label: {
                            ContentViewRow(index: index)
                        }
                    }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
