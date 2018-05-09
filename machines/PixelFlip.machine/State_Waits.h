//
// State_Waits.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_PixelFlip_State_Waits_h
#define clfsm_PixelFlip_State_Waits_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMPixelFlip
      {
        namespace State
        {
            class Waits: public CLState
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
                    Waits(const char *name = "Waits");
                    virtual ~Waits();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_Waits_Variables.h"
#                   include "State_Waits_Methods.h"
            };
        }
      }
    }
}

#endif
