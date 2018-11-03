'scene class

type Scene
    dim buffer as any pointer
    
    declare sub init()
    
    declare sub render()
end type

sub Scene.init(byval screenW as integer, byval screenH as integer)
    self.buffer = imagecreate(screenW, screenH)
end sub

sub Scene.render()
    put (0, 0), self.buffer
end sub


