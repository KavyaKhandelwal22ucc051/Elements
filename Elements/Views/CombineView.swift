//
//  CombineView.swift
//  Elements
//
//  Created by kavya khandelwal  on 24/12/24.
//

import SwiftUI

struct CombineView: View {
    @State private var NoOfElements = 2
    @State private var showElements = false
    @State private var elements : [Element?] = [nil,nil]
    @State private var allElements : [Elements] = []
    @State private var selectedElementIndex : Int?  = nil
    @State private var result : String? = nil
    let combinationValidator:[Combination] = ElementModel().load("Combinations.json")
    
    let NoElements = [2,3,4,5]
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack{
                    HStack{
                        
                        Text("Number of Elements")
                            .foregroundColor(.blue)
                            .font(.headline)
                        Picker("Number of Elements", selection: $NoOfElements){
                            ForEach(NoElements,id: \.self){
                                element in
                                Text("\(element)")
                                
                                
                            }
                        }.pickerStyle(DefaultPickerStyle())
                    }
                    .frame(width: 300,height: 50)
                    .background(Color.blue.opacity(0.3))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10))
                    
                    VStack{
                        
                        ForEach(0..<NoOfElements,id: \.self){
                            index in
                            if index < elements.count {
                                ElementButton(for: index)
                            }
                        }.padding(10)
                        
                        
                        Button{
                            result = validCombinations(for: elements)
                        }label: {
                            Text("Combine")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(
                                    LinearGradient(colors: [.black,.white], startPoint: .bottom, endPoint: .top)
                                )
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 20)
                                    
                                ).padding(.bottom,10)
                                
                        }
                        
                        if let result = result {
                            Text(result)
                                .font(.title2)
                                .bold()
                                .padding()
                                .frame(width: 285)
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(12.5)
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                                
                        }
                        
                        
                    }
                }
                
            }.navigationTitle("Combine Elements")
                .onAppear {
                               updateElementsArray(for: NoOfElements)
                           }
                           .onChange(of: NoOfElements) { oldValue ,newValue in
                               updateElementsArray(for: newValue)
                           }
                           .scrollIndicators(.hidden)
                
        }.sheet(isPresented: $showElements){
            ElementListView(){
                element in
                
                elements[selectedElementIndex ?? 0] = element
                
            }
        }
    }
    
    private func ElementButton(for index : Int) -> some View {
        Button{
            selectedElementIndex = index
            showElements.toggle()
        }label: {
            if let element = elements[index] {
                ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: "\(element.mass)", block: element.block).padding()
            }else{
                RoundedRectangle(cornerRadius: 30)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 100,height: 100)
                    .overlay(
                        Image(systemName: "plus")
                            
                    ).padding()
            }
        }
    }
    
    private func updateElementsArray(for newValue: Int) {
            if elements.count < newValue {
                elements += Array(repeating: nil, count: newValue - elements.count)
            } else if elements.count > newValue {
                elements = Array(elements.prefix(newValue))
            }
        }
    
    private func validCombinations(for elements:[Element?]) -> String{
        let validElements = elements.compactMap{$0}
        if validElements.count != NoOfElements{
            return "Please select \(NoElements) Elements"
        }
        let validCombinations = combinationValidator.filter{
            $0.elements.count == NoOfElements
        }
        
        let selectedSymbols = validElements.map{$0.symbol}.sorted()
        
        for combo in validCombinations {
            if combo.elements.sorted() == selectedSymbols{
                return combo.result
            }
        }
        return "No valid Combinations"
    }
    
}



#Preview {
    CombineView()
}
