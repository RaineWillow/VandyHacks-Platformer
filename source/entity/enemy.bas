' Enemy class

type Enemy
    private:
        dim velocityX as integer = 10
        dim velocityY as integer = 10
    public:
        dim rect as Box
        declare sub init()
        declare sub update()
        declare sub render(byref res as ResLoader)
end type


sub Enemy.init()
    this.rect.init(0, 0, 100, 67)
end sub


sub Enemy.update()
    this.rect.setBoxX(this.rect.getBoxX() + this.velocityX)
    this.rect.setBoxY(this.rect.getBoxY() + this.velocityY)
end sub


sub Enemy.render(byref res as ResLoader)
    put (this.rect.getBoxX(), this.rect.getBoxY()), res.getEnemyFrame(0), trans
end sub
