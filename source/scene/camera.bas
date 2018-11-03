'the camera type

type Camera
    private:
        dim cameraX as integer
        dim cameraY as integer
    public:
        
        declare sub update(byval playerX as integer, byval playerY as integer)
        declare function getCameraX() as integer
        declare function getCameraY() as integer
end type

sub Camera.update(byval playerX as integer, byval playerY as integer)
    this.cameraX = playerX
    this.cameraY = playerY
end sub

function Camera.getCameraX as integer
    return this.cameraX
end function

function Camera.getCameraY as integer
    return this.cameraY
end function