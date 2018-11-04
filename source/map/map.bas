'map class
#include "tile.bas"
type Map
    private:
        dim chunk(0 to 63, 0 to 63) as Tile
    
    public:
        declare sub loadMap()
        declare sub render(byref cam as Camera, byref res as ResLoader)

        declare function getTileBox(byval tx as integer, byval ty as integer) as Box
end type

'load a map from a file
sub Map.loadMap()
    dim currVal as string
    'open the file -- will soon be an argument in the func
    open "res/map/map.dat" for input as #1
    'loop through the file
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            'get the data from the file and put it into the tile
            input #1, currVal
            this.chunk(x, y).readTile(currVal)
        next
    next
    close #1
end sub

sub Map.render(byref cam as Camera, byref res as ResLoader)
    'loop through the tiles and calculate it's position onscreen
    for x as integer = 0 to 63
        for y as integer = 0 to 63
            dim tileBox as Box = this.getTileBox(x, y)
            this.chunk(x, y).render(tileBox.getBoxX()+cam.getCameraX(), tileBox.getBoxY()+cam.getCameraY(), res.getTileImg(this.chunk(x, y).id()))
        next
    next
end sub

function Map.getTileBox(byval tx as integer, byval ty as integer) as Box
    dim LENGTH as integer = 68
    dim b as Box
    b.init(tx*LENGTH, ty*LENGTH, LENGTH, LENGTH)
    return b
end function
