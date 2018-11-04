'World.bas
#include "../entity/player.bas"
#include "../map/map.bas"


type World
    private:
        dim currMap as Map
    public:
        declare sub init()
        declare sub render(byval Cam as Camera, byref res as ResLoader)
end type

sub World.init()
    currMap.loadMap()
end sub

sub World.render(byval cam as Camera, byref res as ResLoader)
    currMap.render(cam, res)
end sub
