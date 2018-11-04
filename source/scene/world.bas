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
        declare sub update(byval moveOff as double)
        declare sub render(byval Cam as Camera, byref res as ResLoader)
end type

sub World.init()
    this.currMap.loadMap()
    this.character.init()
end sub


sub World.update(byval moveOff as double)
    if moveOff > 1/30 then
        moveOff = 0
    end if
    this.character.update(moveOff)
end sub

sub World.render(byval cam as Camera, byref res as ResLoader)
    this.currMap.render(cam, res)
    this.character.render(res)
end sub
