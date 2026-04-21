//
//  ContentView.swift
//  GuacChain-2026
//
//  Created by John Gallaugher on 4/20/26.
//

import SwiftUI
import SwiftData

struct OrderDetailView: View {
    @State private var tacoQty = 0
    @State private var burritoQty = 0
    @State private var chipsQty = 0
    @State private var horchataQty = 0
    @State private var selectedCurrency = Currency.usd
    @State private var orderTitle = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            HStack {
                Text("Guac")
                    .foregroundStyle(.green)
                Text("Chain")
                    .foregroundStyle(.red)
            }
            .font(Font.custom("Marker Felt", size: 48))
            .bold()
            
            Text("The World's Tastiest Tacos - But We Only Accept Crypto")
                .font(Font.custom("Papyrus", size: 20))
                .multilineTextAlignment(.center)
            
            Text("🌮")
                .font(Font.system(size: 80))
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text("\(tacoQty)")
                        .font(Font.system(size: 48))
                        .fontWeight(.heavy)
                        .frame(width: 70)
                    VStack(alignment: .leading) {
                        Text("The Satoshi 'Taco' moto")
                            .font(.title2)
                        Stepper("", value: $tacoQty, in: 0...9)
                            .labelsHidden()
                    }
                }
                HStack(alignment: .top) {
                    Text("\(burritoQty)")
                        .font(Font.system(size: 48))
                        .fontWeight(.heavy)
                        .frame(width: 70)
                    VStack(alignment: .leading) {
                        Text("Bitcoin Burrito")
                            .font(.title2)
                        Stepper("", value: $burritoQty, in: 0...9)
                            .labelsHidden()
                    }
                }
                HStack(alignment: .top) {
                    Text("\(chipsQty)")
                        .font(Font.system(size: 48))
                        .fontWeight(.heavy)
                        .frame(width: 70)
                    VStack(alignment: .leading) {
                        Text("CryptoChips")
                            .font(.title2)
                        Stepper("", value: $chipsQty, in: 0...9)
                            .labelsHidden()
                    }
                }
                HStack(alignment: .top) {
                    Text("\(horchataQty)")
                        .font(Font.system(size: 48))
                        .fontWeight(.heavy)
                        .frame(width: 70)
                    VStack(alignment: .leading) {
                        Text("'No Bubble' Horchata")
                            .font(.title2)
                        Stepper("", value: $horchataQty, in: 0...9)
                            .labelsHidden()
                    }
                }
            }
            
            
            Spacer()
            
            Picker("", selection: $selectedCurrency) {
                ForEach(Currency.allCases, id: \.self) { currency in
                    Text(currency.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            HStack (alignment: .top){
                Text("Total:")
                    .font(.title)
                VStack(alignment: .leading) {
                    // UPDATE ThIS VIEW WITH PROPER BTC VALUE!
                    Text("฿ \(0.0)")
                    Text("\(calcTotal())")
                }
            }
            
            HStack {
                Text("Order Title:")
                    .bold()
                TextField("name this order", text: $orderTitle)
                    .textFieldStyle(.roundedBorder)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("cancel", systemImage: "xmark") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("save", systemImage: "checkmark") {
                    dismiss()
                }
            }
        }
    }
    
    func calcTotal() -> Double {
        let tacoTotal = Double(tacoQty) * Price.taco.rawValue
        let burritoTotal = Double(burritoQty) * Price.burrito.rawValue
        let chipsTotal = Double(chipsQty) * Price.chips.rawValue
        let horchataTotal = Double(horchataQty) * Price.horchata.rawValue
        
        return tacoTotal + burritoTotal + chipsTotal + horchataTotal
    }
    
}

#Preview {
    OrderDetailView()
}
