const MAX_EVENTS as integer = 10
const MAX_CALLBACKS as integer = 10

enum EventType explicit
    keyPress
end enum


union EventData
    dim i as integer
end union


type AppEvent
    public:
        dim ty as EventType
        dim data as EventData
end type


type EventQueue
    private:
        dim callbacks(0 to MAX_EVENTS, 0 to MAX_CALLBACKS) as sub(byval ev as AppEvent)
        dim callbackTotals(0 to MAX_EVENTS) as integer
    public:
        declare constructor
        declare sub dispatch(byval ev as AppEvent)
        declare sub addCallback(byval ty as EventType, byval cb as Sub(byval ev as AppEvent))
'       declare sub removeCallback(byval ty as EventType, byval cb as Sub(byval ev as AppEvent))
end type


constructor EventQueue
    for i as integer = 0 to MAX_EVENTS
        this.callbackTotals(i) = 0
    next
end constructor


sub EventQueue.dispatch(byval ev as AppEvent)
    if this.callbackTotals(ev.ty) = 0 then
        return
    end if

    for i as integer = 0 to this.callbackTotals(ev.ty) - 1
        this.callbacks(ev.ty, i)(ev)
    next
end sub


sub EventQueue.addCallback(byval ty as EventType, byval cb as Sub(byval ev as AppEvent))
    if callbackTotals(ty) < MAX_CALLBACKS then
        callbacks(ty, callbackTotals(ty)) = cb
        callbackTotals(ty) += 1
    end if
end sub

dim shared evQueue as EventQueue