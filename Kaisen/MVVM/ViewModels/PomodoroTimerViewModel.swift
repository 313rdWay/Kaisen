//
//  PomodoroTimerViewModel.swift
//  Kaisen
//
//  Created by Davaughn Williams on 4/1/25.
//

import SwiftUI
import Combine

class PomodoroTimerViewModel: ObservableObject {
    enum PomodoroPhase {
        case work, breakTime
    }
    
    @Published var workTimeRemaining = 25 * 60 // 25 minutes in seconds
    @Published var breakTimerRemaining = 10 * 60 // 10 minutes in seconds
    
    @Published var currentPhase: PomodoroPhase = .work
    @Published var workIsRunning = false
    @Published var breakIsRunning = false
    private var timer: Timer?
    
    func startTimer() {
        if timer != nil { return } // Prevent multiple timers from running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            switch self.currentPhase {
            case .work:
                if self.workTimeRemaining > 0 {
                    self.workTimeRemaining -= 1
                } else {
                    self.currentPhase = .breakTime
                    self.workTimeRemaining = 25 * 60
                }
            case .breakTime:
                if self.breakTimerRemaining > 0 {
                    self.breakTimerRemaining -= 1
                } else {
                    self.currentPhase = .work
                    self.breakTimerRemaining = 10 * 60
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        workIsRunning = false
        breakIsRunning = false
    }
    
    func resetTimer() {
    }
        
    func timeFormatted() -> String {
        let time = (currentPhase == .work) ? workTimeRemaining : breakTimerRemaining
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
