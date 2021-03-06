import SpriteKit

class Player: SKSpriteNode, GameSprite {
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named: "pierre.atlas")
    var flyAnimation = SKAction()
    var soarAnimation = SKAction()
    
    func spawn(parentNode: SKNode, position: CGPoint, size: CGSize = CGSize(width: 64, height: 64)) {
        parentNode.addChild(self)
        createAnimation()
        self.size = size
        self.position = position
        
        // If we run an action with a key, we can later reference that key
        // to remove the action
        self.run(flyAnimation, withKey: "flapAnimation")
    }
    
    func createAnimation() {
        let rotateUpAction = SKAction.rotate(toAngle: 0, duration: 0.475)
        rotateUpAction.timingMode = .easeOut
        
        let rotateDownAction = SKAction.rotate(toAngle: -1, duration: 0.8)
        rotateDownAction.timingMode = .easeIn
        
        let flyFrames: [SKTexture] = [
            textureAtlas.textureNamed("pierre-flying-1.png"),
            textureAtlas.textureNamed("pierre-flying-2.png"),
            textureAtlas.textureNamed("pierre-flying-3.png"),
            textureAtlas.textureNamed("pierre-flying-4.png"),
            textureAtlas.textureNamed("pierre-flying-3.png"),
            textureAtlas.textureNamed("pierre-flying-2.png"),
        ]
        
        let flyAction = SKAction.animate(with: flyFrames, timePerFrame: 0.03)
        
        // Group together the flying animation frames with a rotation up
        flyAnimation = SKAction.group([SKAction.repeatForever(flyAction), rotateUpAction])
        
        // Create the soaring animation, just one frame for now
        let soarFrames: [SKTexture] = [
            textureAtlas.textureNamed("piere-flying-1.png")
        ]
        
        let soarAction = SKAction.animate(with: soarFrames, timePerFrame: 1)
        
        // Group the soaring animation with the rotation down
        soarAnimation = SKAction.group([SKAction.repeatForever(soarAction), rotateDownAction])
    }
    
    func onTap() {
        
    }
}
