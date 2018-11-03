'tile object
type Tile
    private:
        dim tileId as integer
        dim solid as integer
    public:
        
        declare sub render(byval x as integer, byval y as integer, byval img as any pointer)
        declare sub readTile(byval tile as string)
        
        declare function id() as integer
        declare function isSolid() as integer
        
        declare function getTile() as string
end type

sub Tile.render(byval x as integer, byval y as integer, byval img as any pointer)
    put (x, y), img, trans
end sub

sub Tile.readTile(byval tile as string)
    dim tileSet() as string
    split(tile, , , tileSet())
    this.tileId = val(tileSet(0))
    this.solid = val(tileSet(1))
end sub

function Tile.id() as integer
    return this.tileId
end function

function Tile.isSolid() as integer
    return this.solid
end function

function Tile.getTile() as string
    return str(this.tileId) + " " + str(this.solid)
end function

