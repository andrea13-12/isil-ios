import SwiftUI

struct FlavorSelectionView: View {
    @Binding var selectedFruit: String?
    @Binding var showFlavorSelection: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Choose your flavor")
                .font(.title)
                .padding()

            HStack(spacing: 40) {
                Button(action: {
                    selectedFruit = "strawberry"
                    showFlavorSelection = false 
                }) {
                    Image("strawberry")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }

                Button(action: {
                    selectedFruit = "grape"
                    showFlavorSelection = false
                }) {
                    Image("grapes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}
