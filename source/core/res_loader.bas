type ResLoader
    private:
        dim tileList(0 to 40) as any pointer
    public:
        declare sub loadTiles()
        
        
        declare sub init()
        declare function getTileImg(byval id as integer) as any pointer
end type

sub ResLoader.loadTiles()
    for i as integer = 0 to 40
        tileList(i) = imagecreate(68, 68)
    next
    
    line tileList(0), (0, 0)-(41, 41), rgb(255, 0, 255)
    
    bload "../../res/tiles/cobblestone.bmp", tileList(1)
    bload "../../res/tiles/cobblestonegrass.bmp", tileList(2)
    
end sub

sub 
    
