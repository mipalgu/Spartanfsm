//
// State_WaitForPulseEnd.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_UltrasonicDiscreteSingle_State_WaitForPulseEnd_h
#define clfsm_UltrasonicDiscreteSingle_State_WaitForPulseEnd_h

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
            class WaitForPulseEnd: public CLState
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
                    Transition_0(int toState = 7): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 9): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    WaitForPulseEnd(const char *name = "WaitForPulseEnd");
                    virtual ~WaitForPulseEnd();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_WaitForPulseEnd_Variables.h"
#                   include "State_WaitForPulseEnd_Methods.h"
            };
        }
      }
    }
}

#endif
