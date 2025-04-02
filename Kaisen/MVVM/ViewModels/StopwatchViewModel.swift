//
//  StopwatchViewModel.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/28/25.
//

import SwiftUI
import Combine

class StopwatchViewModel: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0
    @Published var isRunning = false
    @Published var lapTimes: [TimeInterval] = []
    
    private var timer: Timer?
    private var startTime: Date?
    
    func startStopwatch() {
        if isRunning {
            stopStopwatch()
        } else {
            startTime = Date().addingTimeInterval(-elapsedTime)
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                self.updateElapsedTime()
                self.updateElapsedTime()
            }
            RunLoop.current.add(timer!, forMode: .common)
            isRunning = true
        }
    }
    
    func stopStopwatch() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func resetStopwatch() {
        stopStopwatch()
        elapsedTime = 0
        lapTimes.removeAll()
    }
    
    func recordLap() {
        lapTimes.insert(elapsedTime, at: 0)
    }
    
    private func updateElapsedTime() {
        if let startTime = startTime {
            elapsedTime = Date().timeIntervalSince(startTime)
        }
    }
    
    func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) & 60
        let milliseconds = Int((time - floor(time)) * 1000)
        return String(format: "%02d:%02d:%03d", minutes, seconds, milliseconds)
    }
}
