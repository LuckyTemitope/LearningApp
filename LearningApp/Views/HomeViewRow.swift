//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-07-07.
//

import SwiftUI

struct HomeViewRow: View {
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        // Learning Card
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            
            HStack(spacing: 30) {
                //Image
                Image(image)
                    .resizable()
                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                
                
                // Text
                VStack(alignment: .leading, spacing: 10) {
                    // Headline
                    Text(title)
                        .font(.headline)
                    
                    // Description
                    Text(description)
                        .padding(.bottom)
                        .font(.caption)
                    
                    // Icons
                    HStack(spacing: 10) {
                        
                        HStack(spacing: 3) {
                            Image(systemName: "book.closed")
                            Text(count)
                                .font(Font.system(size: 10))
                            
                        }
                        
                        
                        
                        
                        HStack(spacing: 3) {
                            Image(systemName: "clock")
                            Text(time)
                                .font(Font.system(size: 10))
                            
                        }
                        
                        
                    }
                }
                .padding(.horizontal, 10)
                
            }.padding(.horizontal, 20)
        }
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some description", count: "20 Lessons", time: "42 hours")
    }
}
