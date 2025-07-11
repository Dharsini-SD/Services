//
//  ServicesModel.swift
//  Services
//
//  Created by Dharsini S on 11/07/25.
//

import Foundation
import SwiftUI

struct Service : Identifiable{
    var id : UUID
    var title : String
    var subtitle : String
    var description : String
    var statusBadge : serviceStatus
    var priorityIndicator : priorityIndicator
    var formattedDate : String
    
    
}

enum serviceStatus : String,CaseIterable {
    case planned = "Planned"
    case scheduled = "Scheduled"
    case confirmed = "Confirmed"
    case approved = "Approved"
    
    var color : Color {
        switch self {
        case .planned:
            return .blue
        case .scheduled:
            return .green
        case .confirmed:
            return .green
        case .approved:
            return .red
        }
    }
}

enum priorityIndicator : String,CaseIterable {
    
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case urgent = "Urgent"
    
    var color: Color {
            switch self {
            case .low: return .gray
            case .medium: return .yellow
            case .high: return .orange
            case .urgent: return .red
            }
        }
}

extension Date {
    func getFormerattedDate() -> String {
        let calendar = Calendar(identifier: .indian)
        if calendar.isDateInToday(self){
            return "Today, \(self.formatted(date: .omitted, time: .shortened))"
        }else if calendar.isDateInYesterday(self){
            return "Yesterday, \(self.formatted(date: .omitted, time: .shortened))"
        }else if calendar.isDateInTomorrow(self){
            return "Tomorrow, \(self.formatted(date: .omitted, time: .shortened))"
        }else{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy, hh:mm a"
            return dateFormatter.string(from: self)
        }
       
    }
}
