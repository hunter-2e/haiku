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
    @Binding var haikus:[String:String]
    
    
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
                    EditView(selectedDate: $selectedDate, haikus: $haikus)
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
    @State var haikus = [String: String]()
    
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
                        CalendarView(haikus:  $haikus)
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
    
    @Binding var selectedDate:Date
    @Binding var haikus:[String:String]
    

    
    let changeToDay = DateFormatter()
    
    var editDate:String {
        changeToDay.dateStyle = .short
        return changeToDay.string(from: selectedDate)
    }
    
    
    
    @State var backToCalendar = false
    
    var line1:String {
        haikus[editDate, default: ""]
    }
    var line2:String {
        haikus[editDate, default: ""]
    }
    var line3:String {
        haikus[editDate, default: ""]
    }
    
    @State var editLine1:String = ""
    @State var editLine2:String = ""
    @State var editLine3:String = ""
    
    let defaults = UserDefaults.standard
    
    
    
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
                    TextField("Line 1", text: $editLine1).multilineTextAlignment(.center)
                    TextField("Line 2", text: $editLine2).multilineTextAlignment(.center)
                    TextField("Line 3", text: $editLine3).multilineTextAlignment(.center)
                    
                    Button("Done"){
                        print(haikus)
                        haikus[editDate] = editLine1 + editLine2 + editLine3
                        
                        defaults.set(haikus, forKey: editDate)
                        
                        backToCalendar.toggle()
                        }
                    .fullScreenCover(isPresented: $backToCalendar, content: {
                        CalendarView(haikus:$haikus)
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
