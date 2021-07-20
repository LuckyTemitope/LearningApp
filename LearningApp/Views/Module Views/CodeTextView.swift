//
//  CodeTextView.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-07-14.
//

import SwiftUI
import WebKit

struct CodeTextView: UIViewRepresentable {
   
    @EnvironmentObject var model: ContentModel
    
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
     
    
    func updateUIView(_ textView: UITextView, context: Context) {
        
        // Set the attribtuted Text for the lesson
        textView.attributedText = model.lessonDescription
        
        // Scroll back to the top
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
