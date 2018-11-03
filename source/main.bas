#include "fbgfx.bi"
using FB

#include "utils/split.bas"

dim shared CURR_DIR as string
CURR_DIR = curdir
print CURR_DIR

#include "utils/box.bas"
#include "core/res_loader.bas"
#include "core/app.bas"

dim shared SWIDTH as integer = 800
dim shared SHEIGHT as integer = 600

screenres SWIDTH, SHEIGHT, 32

declare sub main()

sub main()
    dim win as App
    
    win.start(SWIDTH, SHEIGHT)
end sub
