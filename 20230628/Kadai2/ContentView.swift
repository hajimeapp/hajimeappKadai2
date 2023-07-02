//
//  ContentView.swift
//  Kadai2
//
//  Created by SHIGE on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    @State var firstNumberString = ""
    @State var secondNumberString = ""
    @State var resultNumberString = ""
    @State var resultNumber = 0
    @State var selectedOption = 0
    var body: some View {
        VStack {
            
            TextField("", text: $firstNumberString)
                .frame(width: 180, height: 35)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(hue: 1.0, saturation: 0.016, brightness: 0.95), lineWidth: 1.5))
                .keyboardType(.numberPad)
            
            TextField("", text: $secondNumberString)
                .frame(width: 180, height: 35)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(hue: 1.0, saturation: 0.016, brightness: 0.95), lineWidth: 1.5))
                .keyboardType(.numberPad)
            
            Picker("", selection: $selectedOption) {
                Text("+").tag(0)
                Text("-").tag(1)
                Text("×").tag(2)
                Text("÷").tag(3)
            }
            //.segmentedはSegmentedPickerStyle構造体のタイププロパティ
            .pickerStyle(.segmented)
            .frame(width: 180, height: 35)
            .foregroundColor(.blue)
            
            Button("Button") {
                if selectedOption == 3 && secondNumberString == "0" {
                    resultNumberString = "割る数には0以外を入力して下さい"
                } else {calculate()
                }
            }
            
            HStack {
                let result = String(resultNumber)
                Text(result)
                    .padding(.leading, 10.0)
                Spacer()
            }
        }
    }
    
    func calculate() {
        if selectedOption == 0 {
            let firstNumber = Int(firstNumberString) ?? 0
            let secondNumber = Int(secondNumberString) ?? 0
            resultNumber = firstNumber + secondNumber
        } else if selectedOption == 1 {
            let firstNumber = Int(firstNumberString) ?? 0
            let secondNumber = Int(secondNumberString) ?? 0
            resultNumber = firstNumber - secondNumber
        } else if selectedOption == 2 {
            let firstNumber = Int(firstNumberString) ?? 0
            let secondNumber = Int(secondNumberString) ?? 0
            resultNumber = firstNumber * secondNumber
        } else if selectedOption == 3 {
            let firstNumber = Int(firstNumberString) ?? 0
            let secondNumber = Int(secondNumberString) ?? 0
            resultNumber = firstNumber / secondNumber
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
