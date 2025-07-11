//
//  SearchView.swift
//  Elements
//
//  Created by kavya khandelwal  on 24/12/24.
//

import SwiftUI

struct SearchView: View {
    @Namespace var animation
    @State private var randomElement : [Element] = []
      
    
    @State private var TextElement : String = ""
    let formatter = NumberFormatter()
    
    init(){
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 0
    }
    
    var elements : [Element] = ElementModel().load("Elements.json")
    var fileterElements : [Element] {
        if TextElement.isEmpty {
            return randomElement
        }else{
            return elements.filter{
                element in
                element.element.lowercased().contains(TextElement.lowercased())
            }
        }
    }
    var body: some View {
        
        
        NavigationStack{
            VStack{
                TextField("Search Elements...", text: $TextElement)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                List{
                    ForEach(fileterElements) { element in
                        
                        let formattedMass = formatter.string(from: NSNumber(value:element.mass)) ?? "N/A"
                        
                        NavigationLink{
                            ElementDetailView(element: element, animation: animation)
                        }label: {
                            HStack{
                                Text("\(element.id)")
                                Text(element.element)
                                
                                Spacer()
                                
                                VStack{
                                    Text(element.symbol)
                                        .foregroundColor(.gray)
                                    
                                    Text("\(formattedMass) u")
                                        .foregroundColor(.gray)
                                }
                            }
                        }.matchedTransitionSource(id: element.id, in: animation)
                        
                    }
                }
            }.onAppear{
                randomElement = Array(elements.shuffled().prefix(5))
            }
            .navigationTitle("Finder")
        }
    }
}


