//
//  OrderListView.swift
//  GuacChain-2026
//
//  Created by John Gallaugher on 4/20/26.
//

import SwiftUI

struct OrderListView: View {
    @State private var sheetIsPresented = false
    var body: some View {
        NavigationStack {
            Text("REPLACE ME!")
            .listStyle(.plain)
            .navigationTitle("Past Orders:")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add", systemImage: "plus") {
                        sheetIsPresented.toggle()
                    }
                }
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            NavigationStack {
                OrderDetailView()
            }
        }
        
    }
    
//    func returnQtyLine(order: Order) -> String {
//        var orderArray: [String] = []
//        if order.tacoQty != 0 { orderArray.append("Taco: \(order.tacoQty)") }
//        if order.burritoQty != 0 { orderArray.append("Burrito: \(order.burritoQty)") }
//        if order.chipsQty != 0 { orderArray.append("Chips: \(order.chipsQty)") }
//        if order.horchataQty != 0 { orderArray.append("Horchata: \(order.horchataQty)") }
//        return orderArray.joined(separator: ", ")
//    }
}

#Preview {
    OrderListView()
}
