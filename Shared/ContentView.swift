//
//  ContentView.swift
//  Shared
//
//  Created by Hunter Tuohey on 11/28/22.
//

import SwiftUI

struct CalendarView: View{
    
    @State var selectedDate = Date()
    @State var editView = false
    
    
    var body: some View {

        ZStack{
            Color.yellow.ignoresSafeArea()
            
            VStack{
                Text("Select Daily Haiku")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                
                DatePicker("Pick Date", selection: $selectedDate, displayedComponents: .date).datePickerStyle(GraphicalDatePickerStyle()).accentColor(.red)
                
                Button("Confirm Date"){
                    editView.toggle()
                }
                .fullScreenCover(isPresented: $editView, content: {
                    EditView(selectedDate: $selectedDate)
                })
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                
                
                Spacer()
            }
            
            
            
        }
        
        
        
        
    }
}

struct ContentView: View {
    
    @State var calendarView = false
    
    var body: some View {

        
        ZStack{
            Color.yellow.ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("Daily")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Haiku")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack{
                    Button("View Calendar") {
                        calendarView.toggle()
                    }
                    .fullScreenCover(isPresented: $calendarView, content: {
                        CalendarView()
                    })
                    
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/)
                    
                    
                }
                
                Spacer()
            }
            
                .padding()
        }
        
    }
}

struct EditView: View {
    
    let changeToDay = DateFormatter()
    
    var editDate:String {
        changeToDay.dateStyle = .short
        return changeToDay.string(from: selectedDate)
    }
    
    @Binding var selectedDate:Date
    
    @State var backToCalendar = false
    @State var line1 = ""
    @State var line2 = ""
    @State var line3 = ""
    
    var haikus = [Date: String]()
    
    var body: some View {
        
        ZStack{
            Color.yellow.ignoresSafeArea()
            
            VStack{
                
                Text(editDate)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.top, 25.0)
                
                Spacer()
                
                
                
                VStack{
                    Text(line1)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color.black)
                    Text(line2)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color.black)
                    Text(line3)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color.black)
                }
                
                Spacer()
                
                VStack{
                    TextField("Line 1", text: $line1).multilineTextAlignment(.center)
                    TextField("Line 2", text: $line2).multilineTextAlignment(.center)
                    TextField("Line 3", text: $line3).multilineTextAlignment(.center)
                    
                    Button("Done"){
                        backToCalendar.toggle()
                        }
                    .fullScreenCover(isPresented: $backToCalendar, content: {
                        CalendarView()
                    })
                }
                
            }
            
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
