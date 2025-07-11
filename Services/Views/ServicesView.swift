//
//  ContentView.swift
//  Services
//
//  Created by Dharsini S on 11/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var servicesViewModel = ServicesViewModel()
    var body: some View {
        
        NavigationStack{
            VStack{
                Divider().padding()
                List(servicesViewModel.services){item in
                    Section{
                        VStack{
                            HStack{
                                Text("\(item.title)")
                                    .font(.headline)
                                Spacer()
                                Circle().fill(item.priorityIndicator.color).frame(width: 8, height: 8)
                            }
                            HStack{
                                Image(systemName: "person.circle").renderingMode(.original).foregroundStyle(Color.blue).frame(alignment: .leading)
                                Text("\(item.subtitle)")
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .font(.subheadline).padding(.leading,-3).padding(.bottom,-3)
                            }.padding(.top,3)
                            HStack{
                                Image(systemName: "text.document.fill").renderingMode(.original).foregroundStyle(Color.blue).frame(alignment: .leading)
                                Text("\(item.description)")
                                    
                                    .foregroundColor(Color.gray)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .font(.subheadline).padding(.leading,-3).padding(.bottom,-3)
                            }.padding(.top,3)
                            HStack{
                                HStack{
                                    Rectangle().fill(item.statusBadge.color.opacity(0.1)).frame(width: 15, height: 15).cornerRadius(5)
                                    Text(item.statusBadge.rawValue)
                                        .foregroundStyle(item.statusBadge.color)
                                }.padding(.horizontal,10).padding(.vertical,5).background(item.statusBadge.color.opacity(0.1)).cornerRadius(15).frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                
                                Text(item.formattedDate)
                            }.padding(.top)
                            
                            
                        }.padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 0.25)
                            )
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                       
                        
                    }.listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                       
                        
                    
                }.listStyle(.plain)
                  //  .padding(.horizontal)
                   
                    
                    
                    
                    
            }
            .searchable(text: $servicesViewModel.searchText)
            
            .navigationTitle("Services").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
