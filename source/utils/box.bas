'it's a box
'It's a box
type Box
   private:
      dim BoxX as integer
      dim BoxY as integer
      dim BoxWidth as integer
      dim BoxHeight as integer
   public:
      declare function getBoxX() as integer
      declare function getBoxY() as integer
      declare function getBoxWidth() as integer
      declare function getBoxHeight() as integer
      declare function getBoxX2() as integer
      declare function getBoxY2() as integer
      
      declare sub setBoxX(byval NBoxX as integer)
      declare sub setBoxY(byval NBoxY as integer)
      declare sub setBoxWidth(byval NBoxW as integer)
      declare sub setBoxHeight(byval NBoxH as integer)
      
      declare sub init(byval NBoxX as integer, byval NBoxY as integer, NBoxW as integer, NBoxH as integer)
end type

function Box.getBoxX() as integer
   return this.BoxX
end function

function Box.getBoxY() as integer
   return this.BoxY
end function

function Box.getBoxWidth() as integer
   return this.BoxWidth
end function

function Box.getBoxHeight() as integer
   return this.BoxHeight
end function

function Box.getBoxX2() as integer
   return this.BoxX + this.BoxWidth
end function

function Box.getBoxY2() as integer
   return this.BoxY + this.BoxHeight
end function

sub Box.setBoxX(byval NBoxX as integer)
   this.BoxX = NBoxX
end sub

sub Box.setBoxY(byval NBoxY as integer)
   this.BoxY = NBoxY
end sub

sub Box.setBoxWidth(byval NBoxW as integer)
   this.BoxWidth = NBoxW
end sub

sub Box.setBoxHeight(byval NBoxH as integer)
   this.BoxHeight = NBoxH
end sub

sub Box.init(byval NBoxX as integer, byval NBoxY as integer, NBoxW as integer, NBoxH as integer)
   this.BoxX = NBoxX
   this.BoxY = NBoxY
   this.BoxWidth = NBoxW
   this.BoxHeight = NBoxH
end sub


declare function getBoxIntersect(byval Box1 as Box, byval Box2 as Box) as integer
declare function getBoxInPoint(byval Box1 as Box, byval Px as integer, byval Py as integer) as integer

function getBoxIntersect(byval Box1 as Box, byval Box2 as Box) as integer 'Finds out if two boxes are intersecting
   if Box1.GetBoxX() < Box2.GetBoxX2() and Box1.GetBoxX2 > Box2.GetBoxX and Box1.GetBoxY() < Box2.GetBoxY2() and Box1.GetBoxY2() > Box2.GetBoxY() then
      return 1
   else
      return 0
   end if
end function

function getBoxInPoint(byval Box1 as Box, byval Px as integer, byval Py as integer) as integer 'Finds out if a point is within a box
   if Box1.GetBoxX < Px and Box1.GetBoxX2 > Px and Box1.GetBoxY < Py and Box1.GetBoxY2 > Py then
      return 1
   else
      return 0
   end if
end function