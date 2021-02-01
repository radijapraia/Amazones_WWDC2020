import PlaygroundSupport
import SpriteKit

public func startAmazones() {
    let view = SKView(frame: CGRect(origin: .zero, size: CGSize(width: 500, height: 500)))
    let scene = FirstScene(size: view.frame.size)
    scene.backgroundColor = yellow
    view.presentScene(scene)
    PlaygroundPage.current.setLiveView(view)
}
