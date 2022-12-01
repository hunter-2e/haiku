//
//  ContentView.swift
//  Shared
//
//  Created by Hunter Tuohey on 11/28/22.
//

import SwiftUI


struct ContentView: View {
    @State var defaults = UserDefaults.standard
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
                        CalendarView(haikus:  $haikus, defaults: $defaults)
                    })
                    
                    .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.black)
                    
                    
                }
                
                Spacer()
            }
            
                .padding()
        }
        
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

