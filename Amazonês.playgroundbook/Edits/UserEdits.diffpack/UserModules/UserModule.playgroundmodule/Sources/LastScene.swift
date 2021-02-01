import SpriteKit

class LastScene : SKScene {
    override func sceneDidLoad() {
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
        
        self.backgroundColor = yellow
        
        self.addChild(addBorder())
        
        let greatLabel = SKLabelNode(fontNamed: SF_FONT)
        let lineText1 = SKLabelNode(fontNamed: SF_FONT)
//          let lineText2 = SKLabelNode(fontNamed: SF_FONT)
        let itWasLabel = SKLabelNode(fontNamed: SF_FONT)
        let paiDeguaLabel = SKLabelNode(fontNamed: SF_FONT)
        let congratsLabel2 = SKLabelNode(fontNamed: SF_FONT)
        let congratsLabel3 = SKLabelNode(fontNamed: SF_FONT)
        
        greatLabel.text = "Great! Thanks for playing!"
        lineText1.text = "Hope you have enjoyed Amazonês!"
//          lineText2.text = "And you’ve had a great time too!"
        itWasLabel.text = "It was"
        paiDeguaLabel.text = "Pai dégua!"
        congratsLabel2.text = "to share this experience"
        congratsLabel3.text = "about diversity with you"
        
        greatLabel.position = .init(x: 0, y: 140)
        lineText1.position = .init(x: 0, y: 70)
//          lineText2.position = .init(x: 0, y: 40)
        itWasLabel.position = .init(x: -60, y: -30)
        paiDeguaLabel.position = .init(x: 35, y: -30)
        congratsLabel2.position = .init(x: 0, y: -60)
        congratsLabel3.position = .init(x: 0, y: -90)
        
        greatLabel.fontColor = myRed
        paiDeguaLabel.fontColor = myRed
        
        greatLabel.fontSize = 24
        lineText1.fontSize = 18
//          lineText2.fontSize = 18
        itWasLabel.fontSize = 24
        paiDeguaLabel.fontSize = 24
        congratsLabel2.fontSize = 18
        congratsLabel3.fontSize = 18
        
        self.addChild(greatLabel)
        self.addChild(lineText1)
//          self.addChild(lineText2)
        self.addChild(itWasLabel)
        self.addChild(paiDeguaLabel)
        self.addChild(congratsLabel2)
        self.addChild(congratsLabel3)
    }
}
