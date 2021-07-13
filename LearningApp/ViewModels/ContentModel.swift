//
//  ContentModel.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-06-30.
//

import Foundation

class ContentModel : ObservableObject {
    
    // List of Models
    @Published var modules = [Module]()
    
    // Current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    
    // MARK: Data Methods
    
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
    
    // MARK: Module Navigation Methods
    func beginModule( _ moduleID: Int) {
        
        // Find the index for this module id
        
        for index in 0..<modules.count {
            if modules[index].id == moduleID {
                // Find the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set the current module
        currentModule = modules[currentModuleIndex]
        
    }
    
}
