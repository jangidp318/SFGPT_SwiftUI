//
//  CustomHeaderView.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import SwiftUI

struct CustomHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .font(.title)
            Text("SFGPT")
                .font(.headline)
        }
        .frame(height: 30)
    }
}

struct CustomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeaderView()
    }
}
