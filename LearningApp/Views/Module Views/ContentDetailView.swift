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
                    .frame(height: 200)
            }
            
            // TODO: Description
            CodeTextView()
            
            // Show Next Lesson Button only if there's a next lesson
            if model.hasNextLesson() {
                
                Button(action: {
                    model.nextLesson()
                }, label: {
                    
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
            } else {
                
                // Show the completed Button
                Button(action: {
                    model.currentContentSelected = nil
                }, label: {
                    
                    ZStack{
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Complete!")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                })
                
                
            }
            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
