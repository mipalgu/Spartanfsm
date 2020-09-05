//
// State_ResetCount.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_DigitFlipper_State_ResetCount_h
#define clfsm_DigitFlipper_State_ResetCount_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMDigitFlipper
      {
        namespace State
        {
            class ResetCount: public CLState
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
                    Transition_0(int toState = 3): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    ResetCount(const char *name = "ResetCount");
                    virtual ~ResetCount();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_ResetCount_Variables.h"
#                   include "State_ResetCount_Methods.h"
            };
        }
      }
    }
}

#endif
