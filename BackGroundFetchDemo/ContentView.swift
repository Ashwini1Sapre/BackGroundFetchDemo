//
//  ContentView.swift
//  BackGroundFetchDemo
//
//  Created by Knoxpo MacBook Pro on 29/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var textToUpdate = "Update me!"
   @State var currentTime: Date?
    @ObservedObject var counterServise = CustumServise()
    var body: some View {
       // Text("Hello, world!")
          //  .padding()
 
        VStack {
            Text("\(self.counterServise.counterTime)")
            
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .background( Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10, style:.continuous))
            
                .padding()
                .padding(.bottom, 100)
            
            
            Button(action: {
                self.counterServise.startcounter()
             
            })
            {
                Text("Start Timer")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 200)
                    .background(Color.gray)
                
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 2 )
                
                
                
                
                
                
                
                
                
                
                
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    mutating func updateTime() {
        
        currentTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        if let currentTime = currentTime {
           // $textToUpdate.text = formatter.string(from: currentTime)
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
