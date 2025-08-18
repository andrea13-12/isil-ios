import SwiftUI

struct OrderJuiceView: View {
    @State private var selectedFruit: String? = nil
    @State private var showFlavorSelection = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                if let fruit = selectedFruit {
                    Text("Here is your \(fruit) juice!")
                        .font(.title2)
                        .padding()
                }

                Button("Order Juice") { 
                    showFlavorSelection = true
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .navigationDestination(isPresented: $showFlavorSelection) {
                    FlavorSelectionView(selectedFruit: $selectedFruit, showFlavorSelection: $showFlavorSelection)
                }
            }
        }
    }
}

#Preview {
    OrderJuiceView()
}
