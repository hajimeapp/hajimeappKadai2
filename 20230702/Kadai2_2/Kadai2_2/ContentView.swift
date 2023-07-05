//
//  ContentView.swift
//  Kadai2_2
//
//  Created by SHIGE on 7/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var textList = ["", ""]
    @State var resultText: String = "Label"
    @State var operation = 0
    var body: some View {
        VStack{
            VStack {
                VStack {
                    ForEach(textList.indices, id: \.self) { index in
                        TextField("", text: $textList[index])
                        //.numberPadはUIKeyboardType列挙体のケース
                            .keyboardType(UIKeyboardType.numberPad)
                        //.roundedBorderはRoundedBorderTextFieldStyle構造体のタイププロパティ
                            .textFieldStyle(.roundedBorder)
                    }
                    //Pickerの色を動画のように青にする方法が見当たっていない
                    Picker("符号", selection: $operation) {
                        Text("+").tag(0)
                        Text("-").tag(1)
                        Text("×").tag(2)
                        Text("÷").tag(3)
                    }
                    .pickerStyle(.segmented)
                    Button {
                        calculate()
                        avoidEmpty()
                    } label: {
                        Text("Button")
                            .padding(5.0)
                    }
                }
                .padding(.leading, 80)
                .padding(.trailing, 130)
                HStack {
                    Text(String(resultText))
                        .padding(.leading, 15)
                    Spacer()
                }
            }
            Spacer()
        }
    }
    
    func calculate() {
        let upperNumber = Double(textList[0]) ?? 0.0
        let lowerNumber = Double(textList[1]) ?? 0.0

        switch operation {
        case 0:
            resultText = String(upperNumber + lowerNumber)
        case 1:
            resultText = String(upperNumber - lowerNumber)
        case 2:
            resultText = String(upperNumber * lowerNumber)
        case 3:
            if lowerNumber == 0 {
                resultText = "割る数には0以外を入力して下さい"
            } else {
                resultText = String(upperNumber / lowerNumber)
            }
        default:
            fatalError("operation is invalid.")
        }
    }
    
    func avoidEmpty() {
        if textList[0] == "" {
            textList[0] = "0"
        }
        if textList[1] == "" {
            textList[1] = "0"
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
