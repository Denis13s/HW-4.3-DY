//
//  TimerVM.swift
//  HW-4.3-DY
//
//  Created by Denis Yarets on 20/12/2023.
//

import Foundation

final class TimerVM: ObservableObject {
        
    @Published var counter = 3
    @Published var buttonTitle = "Start"

    private var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true
        )
        buttonDidTapped()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            disableTimer()
            buttonTitle = "Reset"
        }
        
    }
    
    private func disableTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
    }
    
}
