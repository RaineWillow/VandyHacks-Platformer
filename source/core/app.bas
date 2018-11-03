#include "../scene/camera.bas"
#include "../scene/world.bas"
#include "events.bas"

' These two lines are temporary
dim shared myVal as integer = 0
declare sub testEventHandler(byval ev as AppEvent)

type App
    private:
        dim status as integer
        dim fps as integer
        dim maxFps as integer = 60
        dim cam as Camera
        dim resManager as ResLoader
        dim world1 as World
    public:
    declare function frameCounter() As Integer
    declare function regulate(ByVal MyFps As Integer,ByRef fps As Integer) As Integer
    declare sub start(byval SWIDTH as integer, byval SHEIGHT as integer)
end type

Function App.frameCounter() As Integer
    Var t1=Timer,t2=t1
    Static As Double t3,frames,answer
    frames+=1
    If (t2-t3) >= 1 Then t3 = t2 : answer = frames : frames = 0
    Function= answer
End Function
'==============================================================================
Function App.regulate(ByVal MyFps As Integer, ByRef fps As Integer) As Integer
    fps=FrameCounter()
    Static As Double timervalue,lastsleeptime
    Dim As Double delta
    Var k=fps-myfps,i=1/myfps
    If Abs(k)>1 Then delta+=i*Sgn(k)
    Var sleeptime=lastsleeptime+(i-Timer+timervalue)*2000+delta
    If sleeptime<1 Then sleeptime=1
    lastsleeptime=sleeptime
    timervalue=Timer
    Return sleeptime
End Function

sub App.start(byval SWIDTH as integer, byval SHEIGHT as integer)
    dim gameOver as integer = 0
    this.resManager.init()
    this.world1.init()
    evQueue.addCallback(EventType.keyPress, @testEventHandler)  ' Temporary
    do
        screenlock
        cls
        this.world1.render(this.cam, resManager)
        
        print "FPS: "; this.Fps
        print myVal
        screenunlock

        ' This if block is temporary
        if multikey(SC_A) then
            dim ev as AppEvent
            ev.ty = EventType.keyPress
            ev.data.i = 10
            evQueue.dispatch(ev)
        end if
        
        sleep this.regulate(this.MaxFps, this.fps)
         
    loop until inkey = chr(255) + "k" or multikey(SC_ESCAPE)
end sub

'This function is temporary
sub testEventHandler(byval ev as AppEvent)
    myVal = ev.data.i
end sub