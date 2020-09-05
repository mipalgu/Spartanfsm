//
// State_IncrementCount.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_DigitFlipper_State_IncrementCount_h
#define clfsm_DigitFlipper_State_IncrementCount_h

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
            class IncrementCount: public CLState
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
                    IncrementCount(const char *name = "IncrementCount");
                    virtual ~IncrementCount();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_IncrementCount_Variables.h"
#                   include "State_IncrementCount_Methods.h"
            };
        }
      }
    }
}

#endif
