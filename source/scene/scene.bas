'scene class

type Scene
    dim buffer as any pointer
    
    declare sub init()
end type

sub Scene.init(byval screenW as integer, byval screenH as integer)
    self.buffer = imagecreate(screenW, screenH)
end sub

