'map class
#include "tile.bas"
type Map
    private:
        dim chunk(0 to 63, 0 to 63) as Tile
    
    public:
        declare sub loadMap()
        declare sub render(byref cam as Camera, byref res as ResLoader)

        declare function getTileBox(byval tx as integer, byval ty as integer, byref cam as Camera) as Box
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
    dim startX as integer
    dim endX as integer
    dim startY as integer
    dim endY as integer

    startX = (-100 - cam.getCameraX())/68
    endX = (SWIDTH - cam.getCameraX())/68
    startY = (-100 - cam.getCameraY())/68
    endY = (SHEIGHT - cam.getCameraY())/68

    startX = iif(startX <= 63, iif(startX >= 0, startX, 0), 63)
    endX = iif(endX <= 63, iif(endX >= 0, endX, 0), 63)
    startY = iif(startY <= 63, iif(startY >= 0, startY, 0), 63)
    endY = iif(endY <= 63, iif(endY >= 0, endY, 0), 63)

    for x as integer = startX to endX
        for y as integer = startY to endY
            this.chunk(x, y).render(x*68+cam.getCameraX(), y*68+cam.getCameraY(), res.getTileImg(this.chunk(x, y).id()))
        next
    next
end sub

function Map.getTileBox(byval tx as integer, byval ty as integer, byref cam as Camera) as Box
    dim LENGTH as integer = 68
    dim b as Box
    b.init(tx*LENGTH + cam.getCameraX(), ty*LENGTH + cam.getCameraY(), LENGTH, LENGTH)
    return b
end function
