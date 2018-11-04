type Player
    private:
        dim x as integer = 0
        dim y as integer = 0
        dim velocityX as integer
        dim velocityY as integer
    public:
        declare sub update()
        declare sub onKeyPress(byval scancode as long)
        declare sub onKeyRelease(byval scancode as long)
        declare function getX() as integer
        declare function getY() as integer
end type


sub Player.update()
    this.x += this.velocityX
    this.y += this.velocityY
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


function Player.getX() as integer
    return this.x
end function


function Player.getY() as integer
    return this.y
end function