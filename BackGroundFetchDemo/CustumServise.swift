//
//  CustumServise.swift
//  BackGroundFetchDemo
//
//  Created by Knoxpo MacBook Pro on 29/01/21.
//

import Foundation
import SwiftUI

class CustumServise: ObservableObject {
    
    @Published var counterTime: Int = 0
    
    
    func startcounter(){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            if UserDefaults.standard.string(forKey: "timeInBg") != nil {
                
                self.counterTime = Int(UserDefaults.standard.double(forKey: "timeInBg")) + self.counterTime
                UserDefaults.standard.removeObject(forKey: "timeInBg")
                
            }
            
            self.counterTime += 1
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
}
