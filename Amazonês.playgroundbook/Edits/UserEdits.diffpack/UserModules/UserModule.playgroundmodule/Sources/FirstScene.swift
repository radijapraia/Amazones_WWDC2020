import SpriteKit

class FirstScene : SKScene {
    
    var clickAudio: SKAudioNode? = nil
    
    override func sceneDidLoad() {
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
        
        self.run(SKAction.playSoundFileNamed("Josefina.wav", waitForCompletion: false))
        
        self.clickAudio = addAudio()
        self.addChild(self.clickAudio!)
        
        self.addChild(addBorder())
            
        
        let welcomeLabel = SKLabelNode(text: "Welcome to \"Amazonês\"!")
        let enjoyLabel1 = SKLabelNode(text: "Enjoy the experience of knowing a little")
        let enjoyLabel2 = SKLabelNode(text: "about the regional linguistic variations of Amazonas.")
        let psLabel1 = SKLabelNode(text: "P.S.: Amazonês is kind of a dialect of expressions we use in Amazonas.")
        
        welcomeLabel.fontName = SF_FONT
        enjoyLabel1.fontName = SF_FONT
        enjoyLabel2.fontName = SF_FONT
        psLabel1.fontName = SF_FONT
        
        welcomeLabel.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        enjoyLabel1.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        enjoyLabel2.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        psLabel1.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        
        welcomeLabel.fontSize = 24
        enjoyLabel1.fontSize = 14
        enjoyLabel2.fontSize = 14
        psLabel1.fontSize = 10
        
        welcomeLabel.position = .init(x: 0, y: 140)
        enjoyLabel1.position = .init(x: 0, y: 80)
        enjoyLabel2.position = .init(x: 0, y: 60)
        psLabel1.position = .init(x: 0, y: -130)
        
        self.addChild(welcomeLabel)
        self.addChild(enjoyLabel1)
        self.addChild(enjoyLabel2)
        self.addChild(psLabel1)
        
        let brocadoLabel = SKLabelNode(fontNamed: SF_FONT)
        let paideguaLabel = SKLabelNode(fontNamed: SF_FONT)
        let caixapregoLabel = SKLabelNode(fontNamed: SF_FONT)
        let bubuiaLabel = SKLabelNode(fontNamed: SF_FONT)
        
        brocadoLabel.text = "Estou brocado!"
        paideguaLabel.text = "É pai dégua!"
        caixapregoLabel.text = "Lá na caixa prego"
        bubuiaLabel.text = "Só de bubuia"
        
        brocadoLabel.fontSize = 18
        paideguaLabel.fontSize = 18
        caixapregoLabel.fontSize = 18
        bubuiaLabel.fontSize = 18
        
        brocadoLabel.position = .init(x: -60, y: 0)
        paideguaLabel.position = .init(x: 60, y: 0)
        caixapregoLabel.position = .init(x: -80, y: -80)
        bubuiaLabel.position = .init(x: 80, y: -80)
        
        brocadoLabel.zRotation = 0.6
        paideguaLabel.zRotation = -0.5
        caixapregoLabel.zRotation = -0.3
        bubuiaLabel.zRotation = 0.45
        
        brocadoLabel.fontColor = myRed
        paideguaLabel.fontColor = #colorLiteral(red: 0.19607843137254902, green: 0.3411764705882353, blue: 0.10196078431372549, alpha: 1.0)
        caixapregoLabel.fontColor = orange
        bubuiaLabel.fontColor = blue
        
        self.addChild(brocadoLabel)
        self.addChild(paideguaLabel)
        self.addChild(caixapregoLabel)
        self.addChild(bubuiaLabel)
        
        var button = SKShapeNode(rect: CGRect(x: -45, y: -180, width: 90, height: 30))
        button.strokeColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        var label = SKLabelNode(text: "NEXT >>")
        label.fontSize = 20
        label.fontColor = #colorLiteral(red: 0.2549019607843137, green: 0.27450980392156865, blue: 0.30196078431372547, alpha: 1.0)
        label.position = .init(x: 0, y: -173)
        button.addChild(label)
        label.name = "next"
        button.name = "next"
        self.addChild(button)
        
//          self.addChild(showEndPopup())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = self.atPoint(location)
            if (node.name == "next") {
                self.clickAudio?.run(.play())
                let view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 368, height: 500)))
                let mainScene = MemoryScene(size: (view.frame.size))
                mainScene.backgroundColor = yellow
                self.view?.presentScene(mainScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
            }
        }
    }
}
