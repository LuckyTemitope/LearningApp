//
//  LessonListView.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-07-07.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        ScrollView{
            LazyVStack {
                
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count) {index in
                        
                        NavigationLink(
                            destination:
                                ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                }),
                            label: {
                                ContentViewRow(index: index)
                            })
                        
                        
                        
                    }
                }
            }
            .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
            .accentColor(.black)
        }
    }
    
}
