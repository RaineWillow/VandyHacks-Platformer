'map class
#include "tile.bas"
type Map
    private:
        dim chunk(0 to 63, 0 to 63) as Tile
    
    public:
        declare sub loadMap()
        declare sub render(byval cam as Camera, byref res as ResLoader)
end type

sub Map.loadMap()
    dim currVal as string
    open "res/map/test.dat" for input as #1
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            input #1, currVal
            this.chunk(x, y).readTile(currVal)
        next
    next
    close #1
end sub

sub Map.render(byval cam as Camera, byref res as ResLoader)
    
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            this.chunk(x, y).render(x*68+cam.getCameraX(), y*68+cam.getCameraX(), res.getTileImg(this.chunk(x, y).id()))
        next
    next
end sub
