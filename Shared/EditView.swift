//
//  EditView.swift
//  Haiku
//
//  Created by Hunter Tuohey on 11/30/22.
//

import SwiftUI

struct EditView: View {
    
    @Binding var selectedDate:Date
    @Binding var haikus:[String:String]
    @Binding var defaults:UserDefaults

    
    let changeToDay = DateFormatter()
    
    var editDate:String {
        changeToDay.dateStyle = .short
        return changeToDay.string(from: selectedDate)
    }
    
    
    
    @State var backToCalendar = false
    
    var haiku:String {
        let haikus = defaults.object(forKey: "SavedHaikus") as? [String:String] ?? [:]
        return haikus[editDate, default: ""]
    }
    
    @State var editLine1:String = "\n"
    @State var editLine2:String = "\n"
    @State var editLine3:String = "\n"
    
    
    var body: some View {
        
        ZStack{
            Color.yellow.ignoresSafeArea()
            
            VStack{
                
                Text(editDate)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.top, 25.0)
                
                Spacer()
                
                
                Text(haiku)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.black)
                
                Spacer()
                
                VStack{
                    TextField("Line 1", text: $editLine1).multilineTextAlignment(.center)
                    TextField("Line 2", text: $editLine2).multilineTextAlignment(.center)
                    TextField("Line 3", text: $editLine3).multilineTextAlignment(.center)
                    
                    HStack{
                        Spacer()
                        
                        Button("Save"){
                            haikus[editDate] = editLine1 + "\n" + editLine2 + "\n" + editLine3
                            
                            defaults.set(haikus, forKey: "SavedHaikus")
                            
                            backToCalendar.toggle()
                        }
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.black)
                        .fullScreenCover(isPresented: $backToCalendar, content: {
                            CalendarView(haikus:$haikus, defaults: $defaults)
                        })
                        
                        Spacer()
                        
                        Button("Done"){
                            backToCalendar.toggle()
                        }
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.black)
                        .fullScreenCover(isPresented: $backToCalendar, content: {
                            CalendarView(haikus:$haikus, defaults: $defaults)
                        })
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
            
            
        }
        
    }
}
