//
//  Elements.swift
//  Elements
//
//  Created by kavya khandelwal  on 30/12/24.
//
import SwiftUI

struct Elements : View {
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
        }.scrollIndicators(.hidden)
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
        
        return NavigationLink{
            ElementDetailView(element: element, animation: animation)
        }label: {
            ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: "\(element.mass)", block: element.block)
                .contextMenu{
                    Button{
                        UIPasteboard.general.string = element.element
                    }label: {
                        Label(element.element,systemImage: "document.on.document")
                    }
                    
                    Button{
                        UIPasteboard.general.string = "\(formattedMass) u"
                    }label: {
                        Label("\(formattedMass) u",systemImage: "document.on.document")
                    }
                }
        }.matchedTransitionSource(id: element.id, in: animation)
    }
    private func emptyCell() -> some View {
        Rectangle()
            .frame(width: 100,height: 100)
            .opacity(0)
    }
}

    
    

