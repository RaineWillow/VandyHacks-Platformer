'it's a box
'It's a box
type Box
   private:
      dim BoxX as double
      dim BoxY as double
      dim BoxWidth as double
      dim BoxHeight as double
   public:
      declare function getBoxX() as double
      declare function getBoxY() as double
      declare function getBoxWidth() as double
      declare function getBoxHeight() as double
      declare function getBoxX2() as double
      declare function getBoxY2() as double
      
      declare sub setBoxX(byval NBoxX as double)
      declare sub setBoxY(byval NBoxY as double)
      declare sub setBoxWidth(byval NBoxW as double)
      declare sub setBoxHeight(byval NBoxH as double)
      
      declare sub init(byval NBoxX as double, byval NBoxY as double, NBoxW as double, NBoxH as double)
end type

function Box.getBoxX() as double
   return this.BoxX
end function

function Box.getBoxY() as double
   return this.BoxY
end function

function Box.getBoxWidth() as double
   return this.BoxWidth
end function

function Box.getBoxHeight() as double
   return this.BoxHeight
end function

function Box.getBoxX2() as double
   return this.BoxX + this.BoxWidth
end function

function Box.getBoxY2() as double
   return this.BoxY + this.BoxHeight
end function

sub Box.setBoxX(byval NBoxX as double)
   this.BoxX = NBoxX
end sub

sub Box.setBoxY(byval NBoxY as double)
   this.BoxY = NBoxY
end sub

sub Box.setBoxWidth(byval NBoxW as double)
   this.BoxWidth = NBoxW
end sub

sub Box.setBoxHeight(byval NBoxH as double)
   this.BoxHeight = NBoxH
end sub

sub Box.init(byval NBoxX as double, byval NBoxY as double, NBoxW as double, NBoxH as double)
   this.BoxX = NBoxX
   this.BoxY = NBoxY
   this.BoxWidth = NBoxW
   this.BoxHeight = NBoxH
end sub


declare function getBoxIntersect(byval Box1 as Box, byval Box2 as Box) as double
declare function getBoxInPoint(byval Box1 as Box, byval Px as double, byval Py as double) as double

function getBoxIntersect(byval Box1 as Box, byval Box2 as Box) as double 'Finds out if two boxes are intersecting
   if Box1.GetBoxX() < Box2.GetBoxX2() and Box1.GetBoxX2 > Box2.GetBoxX and Box1.GetBoxY() < Box2.GetBoxY2() and Box1.GetBoxY2() > Box2.GetBoxY() then
      return 1
   else
      return 0
   end if
end function

function getBoxInPoint(byval Box1 as Box, byval Px as double, byval Py as double) as double 'Finds out if a point is within a box
   if Box1.GetBoxX < Px and Box1.GetBoxX2 > Px and Box1.GetBoxY < Py and Box1.GetBoxY2 > Py then
      return 1
   else
      return 0
   end if
end function