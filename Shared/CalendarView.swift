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
            Color.purple.ignoresSafeArea().saturation(0.5)
            
            
            VStack{
                Spacer()
                
                Text("Select Daily Haiku")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                DatePicker("Pick Date", selection: $selectedDate, displayedComponents: .date).datePickerStyle(GraphicalDatePickerStyle()).accentColor(.red)
                    .colorScheme(.light)
                
                Spacer()
                
                Button("Confirm Date"){
                    editView.toggle()
                }
                .fullScreenCover(isPresented: $editView, content: {
                    EditView(selectedDate: $selectedDate, haikus: $haikus, defaults: $defaults)
                })
                .foregroundColor(.white)
                .padding()
                .background(Color.black).cornerRadius(/*@START_MENU_TOKEN@*/15.0/*@END_MENU_TOKEN@*/)
                
                
                Spacer()
            }
            
            
            
        }
        
        
        
        
    }
}
