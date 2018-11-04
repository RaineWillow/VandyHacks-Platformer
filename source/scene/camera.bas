'the camera type

type Camera
    private:
        dim cameraX as double
        dim cameraY as double
        dim speed as double = 100
    public:
        
        declare sub update(byval moveOff as double)
        declare function getCameraX() as integer
        declare function getCameraY() as integer
end type

sub Camera.update(byval moveOff as double)
    if multikey(SC_UP) then
        this.cameraY += speed*moveOff
    elseif multikey(SC_DOWN) then
        this.cameraY -= speed*moveOff
    end if
    if multikey(SC_LEFT) then
        this.cameraX += speed*moveOff
    elseif multikey(SC_RIGHT) then
        this.cameraX -= speed*moveOff
    end if
end sub

function Camera.getCameraX as integer
    return this.cameraX
end function

function Camera.getCameraY as integer
    return this.cameraY
end function
