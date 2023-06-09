//
//  ContentModel.swift
//  LearningAppHani
//
//  Created by Hanácsek Gábor on 2023. 06. 03..
//

import Foundation


class ContentModel: ObservableObject{
    
    @Published var modules = [Module]()
    @Published var currentModule:Module?
    @Published var currentLesson:Lesson?
    var currentModuleIndex = 0
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init(){
        
        getLocalData()
    }
      
    //MARK: -data methods
    func getLocalData(){
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        do{
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = modules
        }
        catch{
            print(error)
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        }
        catch{
            print(error)
        }
        
    }
    
    //MARK -module control
    func beginModule(_ moduleid:Int){
        
        for index in 0..<modules.count{
            if modules[index].id == moduleid{
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex:Int){
        
        if lessonIndex < currentModule!.content.lessons.count{
            currentLessonIndex = lessonIndex
        }
        else{
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    
    func hasNextLesson() -> Bool {
        
        return (currentLessonIndex + 1 < currentModule!.content.lessons.count)
    }
    
    func nextLesson(){
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
}
