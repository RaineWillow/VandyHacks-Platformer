type App
    private:
        dim status as integer
        dim fps as integer = 60
        dim maxFps as integer
    public:
    declare function frameCounter() As Integer
    declare function regulate(ByVal MyFps As Integer,ByRef fps As Integer) As Integer
    declare sub start(byval SWIDTH as integer, byval SHEIGHT as integer)
end type

'===============================================================================
function App.frameCounter() as integer
    Var t1=Timer,t2=t1
    Static As Double t3,frames,answer
    frames+=1
    If (t2-t3) >= 1 Then t3 = t2 : answer = frames : frames = 0
    function= answer
end function
'==============================================================================
function App.regulate(ByVal MyFps As Integer, ByRef fps As Integer) As Integer
    fps=this.frameCounter()
    Static As Double timervalue,lastsleeptime
    Dim As Double delta
    Var k=fps-myfps,i=1/myfps
    If Abs(k)>1 Then delta+=i*Sgn(k)
    Var sleeptime=lastsleeptime+(i-Timer+timervalue)*2000+delta
    If sleeptime<1 Then sleeptime=1
    lastsleeptime=sleeptime
    timervalue=Timer
    return sleeptime
end function
'===============================================================================

sub App.start(byval SWIDTH as integer, byval SHEIGHT as integer)
    do
        screenlock
        cls
        
        print "FPS: "; this.fps
        screenunlock
        
        sleep this.regulate(this.MaxFps, this.fps)
        sleep 
    loop until inkey = chr(255) + "k" or multikey(SC_ESCAPE)
end sub
