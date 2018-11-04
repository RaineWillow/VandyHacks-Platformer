'World.bas
#include "../entity/player.bas"
#include "../entity/enemy.bas"
#include "../map/map.bas"


type World
    private:
        dim currMap as Map
        dim character as Player
        dim theMonsterWhoShallNotBeNamed as Enemy
    public:
        declare sub init()
        declare sub update()
        declare sub render(byval Cam as Camera, byref res as ResLoader)
end type

sub World.init()
    this.currMap.loadMap()
    this.character.init()
    this.theMonsterWhoShallNotBeNamed.init()
end sub

sub World.update()
    this.character.update()
    this.theMonsterWhoShallNotBeNamed.update()
end sub

sub World.render(byval cam as Camera, byref res as ResLoader)
    this.currMap.render(cam, res)
    this.character.render(res)
    this.theMonsterWhoShallNotBeNamed.render(res)
end sub
