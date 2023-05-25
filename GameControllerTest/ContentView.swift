import SwiftUI

struct ContentView: View {
    @ObservedObject var myController = MyController()

    var body: some View {
        if myController.connected {
            VStack(spacing: 32) {
                HStack(spacing: 32) {
                    Slider(value: .constant(myController.triggerL_value))
                        .frame(width: 50)
                        .rotationEffect(.degrees(-90))
                    Toggle("", isOn: .constant(myController.shoulderL_pressed))
                    Toggle("", isOn: .constant(myController.shoulderR_pressed))
                    Slider(value: .constant(myController.triggerR_value))
                        .frame(width: 50)
                        .rotationEffect(.degrees(-90))
                }
                HStack(spacing: 32) {
                    VStack {
                        Toggle("", isOn: .constant(myController.buttonU_pressed))
                        HStack {
                            Toggle("", isOn: .constant(myController.buttonL_pressed))
                            Toggle("", isOn: .constant(false)).opacity(.zero)
                            Toggle("", isOn: .constant(myController.buttonR_pressed))
                        }
                        Toggle("", isOn: .constant(myController.buttonD_pressed))
                    }
                    HStack {
                        Toggle("", isOn: .constant(myController.buttonShare_pressed))
                        Toggle("", isOn: .constant(myController.buttonHome_pressed))
                        Toggle("", isOn: .constant(myController.buttonMenu_pressed))
                    }
                    VStack {
                        Toggle("", isOn: .constant(myController.buttonY_pressed))
                        HStack {
                            Toggle("", isOn: .constant(myController.buttonX_pressed))
                            Toggle("", isOn: .constant(false)).opacity(.zero)
                            Toggle("", isOn: .constant(myController.buttonB_pressed))
                        }
                        Toggle("", isOn: .constant(myController.buttonA_pressed))
                    }
                }
                HStack(spacing: 32) {
                    ZStack {
                        Slider(value: .constant(myController.thumbstickL_value_y / 2 + 0.5))
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(-90))
                        Slider(value: .constant(myController.thumbstickL_value_x / 2 + 0.5))
                            .frame(width: 100, height: 100)
                        Toggle("", isOn: .constant(myController.thumbstickL_pressed))
                    }
                    ZStack {
                        Slider(value: .constant(myController.thumbstickR_value_y / 2 + 0.5))
                            .frame(width: 100, height: 100)
                            .rotationEffect(.degrees(-90))
                        Slider(value: .constant(myController.thumbstickR_value_x / 2 + 0.5))
                            .frame(width: 100, height: 100)
                        Toggle("", isOn: .constant(myController.thumbstickR_pressed))
                    }
                }
            }
            .padding()
        } else {
            Text("No controller connected.")
        }
    }
}
