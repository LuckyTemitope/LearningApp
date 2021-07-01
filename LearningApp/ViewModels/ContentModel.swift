//
//  ContentModel.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-06-30.
//

import Foundation

class ContentModel : ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    
    
    func getLocalData() {
        // get url to the json file
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a Data Object
            let jsonData = try Data(contentsOf: jsonURL!)
            
            // Try to decode the JSON into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign Parsed modules to the module property
            self.modules = modules
            
        } catch {
            print("Couldn't pass local data")
        }
        
        
        // Parsing the Style Data
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // read the file into a data object
            let styleData = try Data(contentsOf: styleURL!)
            self.styleData = styleData
            
            
            
        } catch {
            print("Couldn't parse style data")
        }
        

    }
}
