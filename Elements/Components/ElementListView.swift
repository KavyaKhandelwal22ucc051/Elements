//
//  ElementListView.swift
//  Elements
//
//  Created by kavya khandelwal  on 2/01/25.
//

import SwiftUI

struct ElementListView: View {
    var allElements:[Element] = ElementModel().load("Elements.json")
    var selectedElement : (Element) -> Void
    @Environment(\.dismiss) var dismiss
    var filetredElements:[Element] {
        if SearchElement.isEmpty{
            return allElements
        }else{
            return allElements.filter{
                $0.element.lowercased().contains(SearchElement.lowercased()) ||
                $0.element.lowercased().contains(SearchElement.lowercased())
            }
        }
    }
    
   
    @State private var SearchElement = ""
    var body: some View {
       
            
       
            NavigationStack{
                TextField("Search Elements..", text: $SearchElement)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                List{
                    ForEach(filetredElements){
                        element in
                        Button{
                            selectedElement(element)
                            dismiss()
                        }label: {
                            HStack{
                                Text(element.symbol)
                                Text(element.element)
                                    .padding(.horizontal)
                            }.foregroundColor(.blue)
                        }
                       
                    }
                }.navigationTitle("Select Elements")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing){
                            Button("Close"){
                                dismiss()
                            }
                        }
                    }
                
            }
        
       
    }
}


