//
//  ContentView.swift
//  HW-4.3-DY
//
//  Created by Denis Yarets on 20/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userManagerVM: UserManagerVM
    @EnvironmentObject var timerVM: TimerVM
    
    var body: some View {
        VStack {
            Text("Hi, \(userManagerVM.nameStored)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timerVM.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView()
            
            Spacer()
            
            Button {
                UserDefaults.standard.setValue(false, forKey: "hasLoggedIn")
                UserDefaults.standard.setValue("", forKey: "nameStored")
            } label: {
                Text("LogOut")
            }
        }
    }
    
}

#Preview {
    ContentView()
        .environmentObject(TimerVM())
}

struct ButtonView: View {
    
    @EnvironmentObject var timerVM: TimerVM
    
    var body: some View {
        Button { timerVM.startTimer() } label: {
            Text(timerVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
        }
    }
    
}
