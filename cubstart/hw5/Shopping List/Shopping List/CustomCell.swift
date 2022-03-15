//
//  CustomCell.swift
//  Shopping List
//
//  Created by Tony Hong on 3/12/22.
//

import SwiftUI

struct CustomCell: View {
    
    var imageName: String
    var itemName: String
    var quantity: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                //.clipped()
                .padding(.trailing, 15)
            Text(itemName).font(.system(size: 18, weight: .semibold))
                
            Spacer()
            
            Text(quantity)
                .font(.system(size: 18, weight: .bold)).foregroundColor(.red)
        }
        .padding()
    }
}

