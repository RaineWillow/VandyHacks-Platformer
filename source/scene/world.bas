'World.bas

type World
    private:
        dim _placeHolder as integer = 1
    public:
        declare function update() as integer
        declare sub render()
end type

function World.update() as integer
    return 1
end function

sub World.render()
    
end sub
