//
//  ContentView.swift
//  Shared
//
//  Created by Daksh Patel on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var guesses = 0
    @ObservedObject var monteCarlo = MonteCarloEx()
    
    
    var body: some View {
            
            VStack{
                
                VStack(alignment: .center) {
                    Text("Guesses")
                        .font(.callout)
                        .bold()
                    TextField("# Guesses", value: $guesses, format: .number)
                        .padding()
                        .frame(width: 100)
                }
                .padding(.top, 5.0)
                
                }
                
                VStack(alignment: .center) {
                    Text("Inter Atomic Distace(angstrom)")
                        .font(.callout)
                        .bold()

                    TextField("Inter Atomic Distance", value: $monteCarlo.interatomicSpacingDouble, format: .number)
                        .padding()
                        .frame(width: 100)
                }
                
                VStack(alignment: .center) {
                    Text("Integral approximate value: \(monteCarlo.integral, specifier: "%.6f")")
                        .font(.callout)
                        .bold()
                        .padding()
                }
                
                
            Button("Cycle Calculation"){
                calculateEx()
                }
                    .padding()
                
            Button("Clear"){
                    self.clear()
                }
                    .padding(.bottom, 5.0)
                
            }
    
            
    
    func calculateEx(){
        monteCarlo.randomizePoints(numberOfPoints: guesses)
        monteCarlo.overlapIntegral_1S_2Px(numberOfPoints: guesses)
        
    }
    
    func clear(){

        guesses = 200
        monteCarlo.integral = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
