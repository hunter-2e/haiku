//
//  CalendarView.swift
//  Haiku
//
//  Created by Hunter Tuohey on 11/30/22.
//

import SwiftUI

struct CalendarView: View{
    
    @State var selectedDate = Date()
    @State var editView = false
    @Binding var haikus:[String:String]
    @Binding var defaults:UserDefaults
    
    var body: some View {

        ZStack{
            Color.yellow.ignoresSafeArea()
            
            
            VStack{
                Spacer()
                
                Text("Select Daily Haiku")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                DatePicker("Pick Date", selection: $selectedDate, displayedComponents: .date).datePickerStyle(GraphicalDatePickerStyle()).accentColor(.red)
                
                Spacer()
                
                Button("Confirm Date"){
                    editView.toggle()
                }
                .fullScreenCover(isPresented: $editView, content: {
                    EditView(selectedDate: $selectedDate, haikus: $haikus, defaults: $defaults)
                })
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                
                
                Spacer()
            }
            
            
            
        }
        
        
        
        
    }
}
