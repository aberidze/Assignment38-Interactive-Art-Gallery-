//
//  CustomImageView.swift
//  InteractiveArtGallery
//
//  Created by Macbook Air 13 on 26.12.23.
//

import SwiftUI

struct CustomImageView: View {

    // MARK: - Properties
    var imageName: String
    
    
    // MARK: - body
    var body: some View {
        
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, minHeight: 250, maxHeight: 250, alignment: .top)
            .cornerRadius(6)
    }
}


// MARK: - Preview
struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(imageName: "TheCreationOfAdam")
    }
}
