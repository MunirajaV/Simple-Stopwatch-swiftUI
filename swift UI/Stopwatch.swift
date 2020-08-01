//
//  Stopwatch.swift
//  swift UI
//
//  Created by Muniraja Velumani on 29/07/20.
//  Copyright © 2020 Muniraja Velumani. All rights reserved.
//

import SwiftUI

enum stopWatchMode {
    case running
    case stopped
    case paused
}

class Stopwatch: ObservableObject {
    
    @Published var mode: stopWatchMode = .stopped
    @Published var seconds = 0.0
    
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.seconds = self.seconds + 0.1
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        seconds = 0
        mode = .stopped
    }
    
}
