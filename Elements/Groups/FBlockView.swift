//
//  FBlockView.swift
//  Elements
//
//  Created by kavya khandelwal  on 30/12/24.
//

import SwiftUI

struct FBlockView: View {
    @Namespace var animation
    @State private var element : Element?
    var elements:[Element] = ElementModel().load("Elements.json")
    let formatter = NumberFormatter()
    
    init(){
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 0
    }
    
    var body : some View {
        ScrollView([.horizontal,.vertical]){
            LazyHStack(alignment: .top){
                ForEach(1..<19,id: \.self) { row in
                    elementGrid(for: row)
                    
                    if row == 3 {
                        emptyCell()
                    }
                    }
                }
            }
        }
    
    private func elementGrid(for row : Int) -> some View {
        LazyVStack(alignment: .leading){
            ForEach(1..<10){ column in
                
                if let element = elements.first(where: {$0.column == column && $0.row == row}){
                    elementButton(element: element)
                }else{
                    emptyCell()
                }
                
                if(column == 7){
                    emptyCell()
                }
            }
        }
    }
    
    private func elementButton(element : Element) -> some View{
        
        let formattedMass = formatter.string(from: NSNumber(value: element.mass)) ?? "N/A"
        let isBlock = element.block == "F Block"
        
        return NavigationLink{
            if(isBlock) {ElementDetailView(element: element, animation: animation)}
        }label: {
            ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: formattedMass, block: element.block)
                .foregroundColor(isBlock ? .white : .gray)
                .background(isBlock ? Color.blue : Color.gray.opacity(0.3))
                .cornerRadius(15)
                .opacity(isBlock ? 1 : 0.5)
                .saturation(isBlock ? 1 : 0)
                
        }.disabled(!isBlock)
        .matchedTransitionSource(id: element.id, in: animation)
    }
    private func emptyCell() -> some View {
        Rectangle()
            .frame(width: 100,height: 100)
            .opacity(0)
    }
}
