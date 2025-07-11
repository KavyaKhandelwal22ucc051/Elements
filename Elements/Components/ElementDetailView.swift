//
//  ElementDetailView.swift
//  Elements
//
//  Created by kavya khandelwal  on 26/12/24.
//
import SwiftUI

struct ElementDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var element: Element
    var animation: Namespace.ID

    var body: some View {
        List {
            Button {
                dismiss()
            } label: {
                ElementCellView(element: element.element, symbol: element.symbol, atomicNumber: element.id, atomicMass: "\(element.mass)", block: element.block)
            }
            .matchedTransitionSource(id: element.id, in: animation)
            .frame(maxWidth: .infinity, alignment: .center)
            .listRowBackground(Color.clear)
            
            Section("Information") {
                Group {
                    LabeledContent("Atomic Number", value: "\(element.id)")
                    LabeledContent("Atomic Mass", value: "\(element.mass) u")
                    LabeledContent("Symbol", value: element.symbol)
                    LabeledContent("Name", value: element.element)
                    LabeledContent("Block", value: element.block)
                    LabeledContent("Bonds Type", value: element.bonds)
                    LabeledContent("Noble Element", value: element.noble)
                }
                .textSelection(.enabled)
            }
        }
        .navigationTransition(.zoom(sourceID: element.id, in: animation))
    }
}

#Preview("Helium") {
    @Namespace var animation
    
    let heliumElement = Element(
        id: 2,
        element: "Helium",
        symbol: "He",
        mass: 4.003,
        row : 1,
        column: 1,
        block: "s block",
        bonds: "None",
        noble: "Yes"
    )
    
    
        ElementDetailView(element: heliumElement, animation: animation)
    
}
