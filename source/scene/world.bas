'World.bas
#include "../entity/player.bas"
#include "../map/map.bas"


type World
    private:
        dim currMap as Map
        dim character as Player
    public:
        declare sub init()
        declare sub update()
        declare sub render(byval Cam as Camera, byref res as ResLoader)
end type

sub World.init()
    this.currMap.loadMap()
    this.character.init()
end sub

sub World.update()
    this.character.update()
end sub

sub World.render(byval cam as Camera, byref res as ResLoader)
    this.currMap.render(cam, res)
    this.character.render(res)
end sub
