//
//  CustomCell.swift
//  Shopping List 2.0
//
//  Created by Michelle Gantos on 3/29/22.
//

import SwiftUI

struct CustomCell: View {
    
    var itemName: String
    
    var quantity: String
    
    var body: some View {
        HStack {
            Text(itemName)
                .padding()
            
            Spacer()
            
            Text(quantity)
        }
    }
}
//
//struct CustomCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomCell()
//    }
//}
