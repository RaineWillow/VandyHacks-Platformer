' Enemy class

type Enemy
    private:
        dim velocityX as double = 100
        dim velocityY as double = 100
    public:
        dim rect as Box
        declare sub init()
        declare sub update(byval moveOff as double)
        declare sub render(byref res as ResLoader)
end type


sub Enemy.init()
    this.rect.init(0, 0, 100, 67)
end sub


sub Enemy.update(byval moveOff as double)
    if moveOff > 1/30 then
        moveOff = 0
    end if
    this.rect.setBoxX(this.rect.getBoxX() + this.velocityX*moveOff)
    this.rect.setBoxY(this.rect.getBoxY() + this.velocityY*moveOff)
end sub


sub Enemy.render(byref res as ResLoader)
    put (this.rect.getBoxX(), this.rect.getBoxY()), res.getEnemyFrame(0), trans
end sub
