import SpriteKit

public func showEndPopup() -> SKShapeNode {
    var bg = SKShapeNode(rect: CGRect(x: -150, y: -100, width: 300, height: 200))
    bg.strokeColor = .white
    bg.fillColor = orange
    
    let text1 = SKLabelNode(text: "Chibata no balde!")
    text1.fontName = SF_FONT
    text1.position = .init(x: 0, y: 40)
    text1.fontSize = 28
    bg.addChild(text1)
    
    let text2 = SKLabelNode(text: "You learned some of our")
    let text3 = SKLabelNode(text: "linguistic variations!")
    
    text2.fontName = SF_FONT
    text3.fontName = SF_FONT
    
    text2.position = .init(x: 0, y: -5)
    text3.position = .init(x: 0, y: -25)
    
    text2.fontSize = 18
    text3.fontSize = 18
    bg.addChild(text2)
    bg.addChild(text3)
    
    let buttonYPos = -70
    var button = SKShapeNode(rect: CGRect(x: -45, y: buttonYPos, width: 90, height: 30))
    button.strokeColor = .white
    var label = SKLabelNode(text: "NEXT >>")
    label.fontSize = 20
    label.fontColor = .white
    label.position = .init(x: 0, y: buttonYPos + 8)
    button.addChild(label)
    label.name = "next"
    button.name = "next"
    bg.addChild(button)
    
    return bg
}
