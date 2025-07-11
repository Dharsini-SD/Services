//
//  ServicesViewModel.swift
//  Services
//
//  Created by Dharsini S on 11/07/25.
//
import SwiftUI

class ServicesViewModel : ObservableObject{
    @Published var services: [Service] = []
    @Published var searchText : String = ""
    
    init() {
        getData()
    }
    
    func getData() {
        DispatchQueue.main.async {
            self.services = [Service(id: UUID(), title: "Office Space Revamp", subtitle: "XYZ Industries", description: "Transform your office with sleek, contemporary furnishings.", statusBadge: .planned, priorityIndicator: .medium, formattedDate: Date().getFormerattedDate()),
                             Service(id: UUID(), title: "Modern Workspace Makeover", subtitle: "Acme Corp", description: "Revitalize your workspace with stylish, modern decor that inspires creativity.", statusBadge: .scheduled, priorityIndicator: .low, formattedDate: Date().getFormerattedDate()),
                             Service(id: UUID(), title: "Contemporary Office Transformation", subtitle: "Beta Solutions", description: "Elevate your office environment with chic, innovative designs that spark inspiration.", statusBadge: .confirmed, priorityIndicator: .high, formattedDate: Date().getFormerattedDate()),
                             Service(id: UUID(), title: "Modern Workspace Overhaul", subtitle: "Alpha Innovations", description: "Transform your workspace with stylish, cutting-edge designs that inspire creativity.", statusBadge: .approved, priorityIndicator: .low, formattedDate: Date().getFormerattedDate())]
        }
    }
    
}
