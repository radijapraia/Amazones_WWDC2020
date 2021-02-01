import SpriteKit

let BG_POPUP = SKTexture(imageNamed: "popup.png")

public func createPopup(node: SKNode) -> SKShapeNode {
    let giria = girias[node.name!]
    
    let panel: SKShapeNode = addBorder()
    panel.fillColor = yellow
    panel.strokeColor = .white
    
    for line in 0..<giria!.enName.count {
        let textLine = SKLabelNode(text: giria!.enName[line])
        textLine.fontName = "AvenirNext-Bold"
        textLine.position = .init(x: 0, y: 170 - (50 * line))
        textLine.fontSize = 40
        textLine.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        panel.addChild(textLine)
    }
    
    let ptTitle = SKLabelNode(text: "in portuguese: \(giria!.name)")
    ptTitle.position = .init(x: 0, y: 135 - (20 * giria!.enName.count))
    ptTitle.fontSize = 14
    ptTitle.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
    panel.addChild(ptTitle)
    
    let image = SKSpriteNode(texture: giria?.imgTexture)
    image.position = .init(x: 0, y: 0)
    image.setScale(0.4)
    image.run(.repeatForever(.animate(with: giria!.spriteSheet, timePerFrame: 0.5)))
    panel.addChild(image)
    
    for line in 0..<giria!.details.count {
        let textLine = SKLabelNode(text: giria!.details[line])
        textLine.position = .init(x: 0, y: -120 - (20 * line))
        textLine.fontSize = 18
        textLine.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        panel.addChild(textLine)
    }
    
    var button = SKShapeNode(rect: CGRect(x: 100, y: -225, width: 60, height: 26))
    button.strokeColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
    var label = SKLabelNode(text: "CLOSE")
    label.fontSize = 14
    label.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
    label.position = .init(x: 129, y: -217)
    button.addChild(label)
    label.name = "close"
    button.name = "close"
    panel.addChild(button)
    
    panel.name = "panel"
    panel.alpha = 0
    return panel
}
