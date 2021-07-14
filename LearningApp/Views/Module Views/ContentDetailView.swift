//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-07-13.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostURL + (lesson?.video ?? ""))
        
        VStack {
            // Only show video if we get a valid URL
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            
            // Show Next Lesson Button only if there's a next lesson
            if model.hasNextLesson() {
                
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(width: 334, height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
            })
            }
            
        }
        .padding()
        .navigationBarTitle(model.currentModule!.content.lessons[model.currentLessonIndex].title)
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
