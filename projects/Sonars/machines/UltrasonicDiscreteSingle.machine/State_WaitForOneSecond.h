//
// State_WaitForOneSecond.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_UltrasonicDiscreteSingle_State_WaitForOneSecond_h
#define clfsm_UltrasonicDiscreteSingle_State_WaitForOneSecond_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMUltrasonicDiscreteSingle
      {
        namespace State
        {
            class WaitForOneSecond: public CLState
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
                    WaitForOneSecond(const char *name = "WaitForOneSecond");
                    virtual ~WaitForOneSecond();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_WaitForOneSecond_Variables.h"
#                   include "State_WaitForOneSecond_Methods.h"
            };
        }
      }
    }
}

#endif
