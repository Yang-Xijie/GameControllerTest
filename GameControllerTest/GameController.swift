import SwiftUI

import GameController

class MyController: NSObject, ObservableObject {
    @Published var connected = false

    // home
    @Published var buttonShare_pressed = false
    @Published var buttonHome_pressed = false
    @Published var buttonMenu_pressed = false

    // XYAB
    @Published var buttonX_pressed = false
    @Published var buttonY_pressed = false
    @Published var buttonA_pressed = false
    @Published var buttonB_pressed = false

    // UDLR
    @Published var buttonU_pressed = false
    @Published var buttonD_pressed = false
    @Published var buttonL_pressed = false
    @Published var buttonR_pressed = false

    // shoulder
    @Published var shoulderL_pressed = false
    @Published var shoulderR_pressed = false

    // trigger
    @Published var triggerL_value = Float.zero
    @Published var triggerR_value = Float.zero

    // thumbstick
    @Published var thumbstickL_value_x = Float.zero
    @Published var thumbstickL_value_y = Float.zero
    @Published var thumbstickL_pressed = false
    @Published var thumbstickR_value_x = Float.zero
    @Published var thumbstickR_value_y = Float.zero
    @Published var thumbstickR_pressed = false

    override init() {
        super.init()
        registerNotifications()
    }

    func registerNotifications() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidConnect),
            name: NSNotification.Name.GCControllerDidBecomeCurrent, object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidDisconnect),
            name: NSNotification.Name.GCControllerDidStopBeingCurrent, object: nil
        )
    }

    @objc
    func handleControllerDidConnect(_: Notification) {
        print("Connect to \(GCController.controllers().count) controller(s).")
        if let controller = GCController.current {
            self.connected = true
            setupChangedHandler(controller: controller)
        }
    }

    @objc
    func handleControllerDidDisconnect(_: Notification) {
        print("Connection lost.")
        self.connected = false
    }

    func setupChangedHandler(controller: GCController) {
        if let inputs = controller.extendedGamepad {
            // home

            inputs.buttonOptions?.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonShare_pressed = pressed
            }
            inputs.buttonHome?.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonHome_pressed = pressed
            }
            inputs.buttonMenu.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonMenu_pressed = pressed
            }

            // XYAB
            inputs.buttonX.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonX_pressed = pressed
            }
            inputs.buttonY.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonY_pressed = pressed
            }
            inputs.buttonA.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonA_pressed = pressed
            }
            inputs.buttonB.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonB_pressed = pressed
            }

            // UDLR
            inputs.dpad.up.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonU_pressed = pressed
            }
            inputs.dpad.down.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonD_pressed = pressed
            }
            inputs.dpad.left.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonL_pressed = pressed
            }
            inputs.dpad.right.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.buttonR_pressed = pressed
            }

            // shoulder
            inputs.leftShoulder.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.shoulderL_pressed = pressed
            }
            inputs.rightShoulder.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.shoulderR_pressed = pressed
            }

            // trigger
            inputs.leftTrigger.valueChangedHandler = { (_: GCControllerButtonInput, _ value: Float, _: Bool) in
                self.triggerL_value = value
            }
            inputs.rightTrigger.valueChangedHandler = { (_: GCControllerButtonInput, _ value: Float, _: Bool) in
                self.triggerR_value = value
            }

            // thumbstick
            inputs.leftThumbstick.xAxis.valueChangedHandler = { (_: GCControllerAxisInput, _ value: Float) in
                self.thumbstickL_value_x = value
            }
            inputs.leftThumbstick.yAxis.valueChangedHandler = { (_: GCControllerAxisInput, _ value: Float) in
                self.thumbstickL_value_y = value
            }
            inputs.leftThumbstickButton?.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.thumbstickL_pressed = pressed
            }
            inputs.rightThumbstick.xAxis.valueChangedHandler = { (_: GCControllerAxisInput, _ value: Float) in
                self.thumbstickR_value_x = value
            }
            inputs.rightThumbstick.yAxis.valueChangedHandler = { (_: GCControllerAxisInput, _ value: Float) in
                self.thumbstickR_value_y = value
            }
            inputs.rightThumbstickButton?.pressedChangedHandler = { (_: GCControllerButtonInput, _: Float, pressed: Bool) in
                self.thumbstickR_pressed = pressed
            }
        }
    }
}
