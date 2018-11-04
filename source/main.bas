#include "fbgfx.bi"
using FB

'set the width and height
dim shared SWIDTH as integer = 800
dim shared SHEIGHT as integer = 600

#include "utils/split.bas"

#include "utils/box.bas"
#include "core/res_loader.bas"
#include "core/app.bas"

'create the screen
screenres SWIDTH, SHEIGHT, 32

declare sub main()

'main func
sub main()
    dim win as App
    
    win.start(SWIDTH, SHEIGHT)
end sub
