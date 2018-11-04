type Player
    private:
        dim velocityX as double
        dim velocityY as double
        
        dim rate as double = 10
        dim speed as double = 200
    public:
        dim rect as Box
        declare sub init()
        declare sub update(byval moveOff as double)
        declare sub render(byref res as ResLoader, byval cam as Camera)
        declare sub onKeyPress(byval scancode as long)
        declare sub onKeyRelease(byval scancode as long)
end type

sub Player.init()
    this.rect.init(0, 0, 68, 121)
end sub

sub Player.update(byval moveOff as double)
    this.rect.setBoxX(this.rect.getBoxX() + this.velocityX*moveOff)
    this.rect.setBoxY(this.rect.getBoxY() + this.velocityY*moveOff)
    
    if multikey(SC_A) then
        this.velocityX -= rate
        if this.velocityX < -speed then this.velocityX = -speed
    elseif multikey(SC_D) then
        this.velocityX += rate
        if this.velocityX > speed then this.velocityX = speed
    else
        if this.velocityX < 0 then
            this.velocityX += rate
        elseif this.velocityX > 0 then
            this.velocityX -= rate/2
        end if
    end if
end sub

sub Player.render(byref res as ResLoader, byval cam as Camera)
    put (this.rect.getBoxX()+cam.getCameraX(), this.rect.getBoxY()+cam.getCameraY()), res.getPlayerFrame(0), trans
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
