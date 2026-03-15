import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            DisplayView(text: viewModel.displayText)
                .frame(height: 200)
            ButtonsView(viewModel: viewModel)
                .frame(height: UIScreen.main.bounds.width * 1.4)
        }
        .background(Color(red: 0.93, green: 0.88, blue: 0.81))
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
