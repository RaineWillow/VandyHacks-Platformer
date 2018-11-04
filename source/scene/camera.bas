'the camera type

type Camera
    private:
        dim cameraX as double
        dim cameraY as double
        dim speed as double = 500
    public:
        
        declare sub update(byval px as double, byval py as double)
        declare function getCameraX() as double
        declare function getCameraY() as double
end type

sub Camera.update(byval px as double, byval py as double)
    this.cameraX = -1*px + SWIDTH/2-60
    this.cameraY = -1*py + SHEIGHT/2-80
end sub

function Camera.getCameraX as double
    return this.cameraX
end function

function Camera.getCameraY as double
    return this.cameraY
end function
