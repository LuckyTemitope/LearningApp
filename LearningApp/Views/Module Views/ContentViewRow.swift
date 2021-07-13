//
//  LessonListViewRow.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-07-08.
//

import SwiftUI

struct ContentViewRow: View {
    @EnvironmentObject var model: ContentModel
    var index:Int
    
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[index]
        
        //Lesson Cards
        
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack(spacing: 20) {
                
                Text(String(index + 1))
                    .bold()
                
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .bold()
                    
                    Text(lesson.duration)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.horizontal, 20)
        } .padding(.horizontal)
        .padding(.bottom, 8)
        
    }
}

