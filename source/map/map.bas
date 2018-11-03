'map class

type Map
    private:
        dim chunk(0 to 63, 0 to 63) as Tile
    
    public:
        declare sub render(byval camera as Camera)
end type

sub render(byval camera as Camera)
    
