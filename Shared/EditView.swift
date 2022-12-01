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
    
    var editable:Bool {
        changeToDay.dateStyle = .short
        if(changeToDay.string(from: Date()) == editDate){
            return true
        }
        else {
            return false
        }
    }
    
    
    
    @State var backToCalendar = false
    
    var haiku:String {
        let savedHaikus = defaults.object(forKey: "SavedHaikus") as? [String:String] ?? [:]
        return savedHaikus[editDate, default: ""]
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
                    .multilineTextAlignment(.center)
                
                
                
                if editable{
                    VStack{
                        Spacer()
                        
                        HStack{
                            Spacer()
                            
                            Text("5").font(.title).fontWeight(.bold).foregroundColor(.black)
                             
                            
                            TextField("Line 1", text: $editLine1)
                                .frame(width:200).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            
                            Text("7").font(.title).fontWeight(.bold).foregroundColor(.black)
                            
                            TextField("Line 2", text: $editLine2)
                                .frame(width:300).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            
                            Text("5").font(.title).fontWeight(.bold).foregroundColor(.black).textFieldStyle(RoundedBorderTextFieldStyle())
                             
                            
                            TextField("Line 3", text: $editLine3).frame(width: 200).multilineTextAlignment(.center).textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Spacer()
                        }
                        
                        Spacer()
                }
                }
                    
                    HStack{

                        if editable{
                            Spacer()
                            
                            Button("Save"){
                                haikus[editDate] = editLine1 + "\n" + editLine2 + "\n" + editLine3
                                
                                defaults.set(haikus, forKey: "SavedHaikus")
                                
                            }
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.black)
                        }
                        
                        
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
