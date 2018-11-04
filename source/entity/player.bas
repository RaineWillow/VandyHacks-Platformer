type Player
    private:
        dim velocityX as double
        dim velocityY as double
        
        dim rate as double = 10
        dim rateY as double = 20
        dim speed as double = 300
        dim gravity as double = 900
        dim jump as double = 1200
        
        dim groundTest as integer = 0
        dim spaceTest as integer = 0
    public:
        dim rect as Box
        declare sub init()
        declare function willCollide(byref chunk as Map, byval testBox as Box) as Box
        declare sub update(byval moveOff as double, byref chunk as Map)
        declare sub render(byref res as ResLoader, byval cam as Camera)
        declare sub onKeyPress(byval scancode as long)
        declare sub onKeyRelease(byval scancode as long)
        
        declare function getTileX() as integer
        declare function getTileY() as integer
end type

sub Player.init()
    this.rect.init(80, 0, 68, 121)
end sub

function Player.willCollide(byref chunk as Map, byval testBox as Box) as Box
    dim tileBox as Box
    dim testTile as Tile
    for x as integer = (this.getTileX() - 2) to (this.getTileX() + 2)
        for y as integer = (this.getTileY() - 2) to (this.getTileY + 2)
            tileBox = chunk.getTileBox(x, y)
            testTile = chunk.getTile(x, y)
            if getBoxIntersect(tileBox, testBox) and testTile.isSolid() then
                return tileBox
            end if
        next
    next
    dim falseBox as Box
    falseBox.init(-1, -1, -1, -1)
    return falseBox
end function

sub Player.update(byval moveOff as double, byref chunk as Map)
    'Move the player rect
    this.rect.setBoxX(this.rect.getBoxX() + this.velocityX*moveOff)
    this.rect.setBoxY(this.rect.getBoxY() + this.velocityY*moveOff)
    
    'create test variables for collision
    dim testBox as Box
    dim collideBox as Box
    
    'get input
    if multikey(SC_A) then
        'move the player
        if this.velocityX > 0 then
            this.velocityX = -1*this.velocityX
        end if
        this.velocityX -= rate
        if this.velocityX < -speed then this.velocityX = -speed
    elseif multikey(SC_D) then
        'move the player
        if this.velocityX < 0 then
            this.velocityX = -1*this.velocityX
        end if
        this.velocityX += rate
        if this.velocityX > speed then this.velocityX = speed
    else
        if this.velocityX < 0 then
            this.velocityX += rate
        elseif this.velocityX > 0 then
            this.velocityX -= rate/2
        end if
    end if
    
    'Check collisions-----------------------------------------------------------
    testBox = this.rect
    testBox.setBoxX(this.rect.getBoxX() + this.velocityX*moveOff)
    
    collideBox = this.willCollide(chunk, testBox)
    
    if collideBox.getBoxWidth() <> -1 then
        if this.velocityX > 0 then
            this.velocityX = collideBox.getBoxX() - testBox.getBoxX2()
        elseif this.velocityX < 0 then
            this.velocityX = collideBox.getBoxX2() - testBox.getBoxX()
        end if
    end if
    '---------------------------------------------------------------------------
    
    if multikey(SC_SPACE) then
        if this.spaceTest = 0 and this.groundTest = 1 then
                this.velocityY = -this.jump
                this.spaceTest = 1
        end if
    else
        if this.spaceTest = 1 then
            this.velocityY = rateY
        end if
        this.spaceTest = 0
    end if
    
    this.velocityY += rateY
    if (this.velocityY > this.gravity) then this.velocityY = this.gravity
    
    'check collisions-----------------------------------------------------------
    testBox = this.rect
    testBox.setBoxY(this.rect.getBoxY() + this.velocityY*moveOff)
    
    collideBox = this.willCollide(chunk, testBox)
    
    this.groundTest = 0
    
    if collideBox.getBoxWidth() <> -1 then
        if this.velocityY > 0 then
            this.velocityY = collideBox.getBoxY() - testBox.getBoxY2()
            this.groundTest = 1
        elseif this.velocityY < 0 then
            this.velocityY = collideBox.getBoxY2() - testBox.getBoxY()
        end if
    end if
    '---------------------------------------------------------------------------
    
end sub

sub Player.render(byref res as ResLoader, byval cam as Camera)
    put (this.rect.getBoxX()+cam.getCameraX(), this.rect.getBoxY()+cam.getCameraY()), res.getPlayerFrame(0), trans
    print "Tile X: "; this.getTileX()
    print "Tile Y: "; this.getTileY()
end sub

sub Player.onKeyPress(byval scancode as long)
    if scancode = SC_A then
        this.velocityX = -1
    elseif scancode = SC_D then
        this.velocityX = 1
    end if
end sub


sub Player.onKeyRelease(byval scancode as long)
    if scancode = SC_A or scancode = SC_D then
        this.velocityX = 0
    end if
end sub

function Player.getTileX() as integer
    return ((this.rect.getBoxX+this.rect.getBoxWidth()/2) / 68)
end function

function Player.getTileY() as integer
    return ((this.rect.getBoxY+this.rect.getBoxHeight()/2) / 68)
end function

