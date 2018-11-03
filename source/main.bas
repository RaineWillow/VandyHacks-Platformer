#include "fbgfx.bi"
using FB

#include "core/app.bas"

dim shared SWIDTH as integer = 800
dim shared SHEIGHT as integer = 600

screenres SWIDTH, SHEIGHT, 32

declare sub main()

sub main()
    dim win as App
    
    win.start(SWIDTH, SHEIGHT)
end sub

main()
