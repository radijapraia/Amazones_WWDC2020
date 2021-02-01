
//  import PlaygroundSupport
import SpriteKit

let ENDED = ":ended"
let FLIPPED = ":flipped"

let BACK_CARD = SKTexture(imageNamed: "backCard.png")

// Create a card
func createCard(giria: Giria, x posX: Int, y posY: Int) -> SKSpriteNode {
    let image = SKSpriteNode(texture: BACK_CARD)
    image.setScale(0.18)
    image.position = .init(x: posX, y: posY)
    image.name = giria.name
    return (image)
}

func addFlipAudio() -> SKAudioNode {
    let flipAudio = SKAudioNode(fileNamed: "flip_no_noise")
    flipAudio.autoplayLooped = false
    flipAudio.name = "flipAudio"
    return flipAudio
}

class MemoryScene : SKScene {
    
    var selectedCard: SKNode? = nil
    var panel: SKShapeNode? = nil
    var clickAudio: SKAudioNode? = nil
    var flipAudio: SKAudioNode? = nil
    
    var flippedCards = 0
    
    var score: Int = 0
    
    override func sceneDidLoad() {
        self.anchorPoint = .init(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
        
        self.clickAudio = addAudio()
        self.flipAudio = addFlipAudio()
        self.addChild(self.clickAudio!)
        self.addChild(self.flipAudio!)
        
        self.addChild(addBorder(fillColor: .white))
        
        // Shuffle cards
        var groupCards: [Giria] = []
        for (key, giria) in girias {
            groupCards += [giria, giria]
        }
        let embaralhado: [Giria] = groupCards.shuffled()
        
        // Positioning the cards
        var allCards: [SKSpriteNode] = []
        var xPos = 0
        for index in 0...15 {
            let card = createCard(
                giria: embaralhado[index],
                x: (xPos * 84) - 126,
                y: 180 - (index/4 * 120)
            )
            self.addChild(card)
            xPos += 1
            if (xPos == 4) {
                xPos = 0
            }
            allCards.append(card)
        }
        
        //Flip all cards
        for card in allCards {
            let frontCard = girias[card.name!]!.cardTexture
            card.run(SKAction.sequence([
                SKAction.wait(forDuration: 1),
                SKAction.scaleX(to: 0, duration: 0.25),
                SKAction.setTexture(frontCard),
                SKAction.scaleX(to: 0.18, duration: 0.25),
                SKAction.wait(forDuration: 1),
                SKAction.scaleX(to: 0, duration: 0.25),
                SKAction.setTexture(BACK_CARD),
                SKAction.scaleX(to: 0.18, duration: 0.25)
            ]))
        }
    }
    
    private func flipToFront(node: SKNode) {
        let frontCard = girias[node.name!]!.cardTexture
        node.run(SKAction.sequence([
            SKAction.scaleX(to: 0, duration: 0.25),
            SKAction.setTexture(frontCard),
            SKAction.scaleX(to: 0.18, duration: 0.25)
        ]))
        self.flippedCards += 1
    }
    
    private func flipToBack(node: SKNode) {
        node.run(SKAction.sequence([
            SKAction.scaleX(to: 0, duration: 0.25),
            SKAction.setTexture(BACK_CARD),
            SKAction.scaleX(to: 0.18, duration: 0.25)
        ]))
        self.flippedCards -= 1
    }
    
    private func isEndded(node: SKNode) -> Bool {
        return node.name!.contains(ENDED)
    }
    
    private func isFilpped(node: SKNode) -> Bool {
        return node.name!.contains(FLIPPED)
    }
    
    private func flipFirstCard(node: SKNode) {
        self.flipToFront(node: node)
        selectedCard = node
    }
    
    private func flipBothCards(node: SKNode) {
        let frontCard = girias[node.name!]!.cardTexture
        node.run(SKAction.sequence([
            SKAction.scaleX(to: 0, duration: 0.25),
            SKAction.setTexture(frontCard),
            SKAction.scale(to: 0.18, duration: 0.25),
            SKAction.wait(forDuration: 1),
            SKAction.scaleX(to: 0, duration: 0.25),
            SKAction.setTexture(BACK_CARD),
            SKAction.scale(to: 0.18, duration: 0.25)
        ]))
        selectedCard!.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.5),
            SKAction.scaleX(to: 0, duration: 0.25),
            SKAction.setTexture(BACK_CARD),
            SKAction.scale(to: 0.18, duration: 0.25)
        ]))
        self.flippedCards = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = self.atPoint(location)
            
            if (node.name == nil) { continue }
            
            if (node.name == "panel") { continue }
            
            if (node.name == "next") {
                let view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 500, height: 500)))
                let mainScene = LastScene(size: (view.frame.size))
                mainScene.backgroundColor = yellow
                self.view?.presentScene(mainScene, transition: SKTransition.moveIn(with: .right, duration: 0.5))
                break
            }
            
            if (node.name == "close") {
                self.clickAudio!.run(.play())
                self.panel?.run(SKAction.fadeAlpha(by: 0, duration: 0.5))
                self.removeChildren(in: [self.panel!])
                
                if self.score == 8 {
                    let endPopup = showEndPopup()
                    self.addChild(endPopup)
                }
                
                break
            }
            
            if (!self.isEndded(node: node)) {
//                  if (self.flippedCards == 2) { continue }
                self.flipAudio?.run(.play())
                // When the card (node) already match with its pair
                if (selectedCard == nil) {
                    // When a card is already showed
                    flipFirstCard(node: node)
                } else {
                    // Check if both cards matches their images
                    if (selectedCard?.name == node.name) {
                        if (selectedCard == node) {
                            // When both cards are the same
                            self.flipToBack(node: selectedCard!)
                        } else {
                            // When both cards are different with same image
                            self.flipToFront(node: node)
                            self.panel = createPopup(node: self.selectedCard!)
                            self.addChild(self.panel!)
                            self.panel?.run(SKAction.sequence([
                                SKAction.wait(forDuration: 0.25),
                                SKAction.fadeAlpha(by: 1, duration: 0.5)
                            ]))
                            selectedCard!.name! += ENDED
                            node.name! += ENDED
                            self.score += 1
                        }
                    } else {
                        flipBothCards(node: node)
                    }
                    selectedCard = nil
                }
                print(node.name)
            }
        }
    }
}

