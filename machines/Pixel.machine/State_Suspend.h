//
// State_Suspend.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_Pixel_State_Suspend_h
#define clfsm_Pixel_State_Suspend_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMPixel
      {
        namespace State
        {
            class Suspend: public CLState
            {
                class OnEntry: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class OnExit: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Internal: public CLAction
                {
                    virtual void perform(CLMachine *, CLState *) const;
                };

                class Transition_0: public CLTransition
                {
                public:
                    Transition_0(int toState = 0): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    Suspend(const char *name = "Suspend");
                    virtual ~Suspend();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Suspend_Variables.h"
#                   include "State_Suspend_Methods.h"
            };
        }
      }
    }
}

#endif
