//
// State_LostPulse.h
//
// Automatically created through MiCASE -- do not change manually!
//
#ifndef clfsm_UltrasonicDiscreteSingle_State_LostPulse_h
#define clfsm_UltrasonicDiscreteSingle_State_LostPulse_h

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
            class LostPulse: public CLState
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
                    Transition_0(int toState = 1): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    LostPulse(const char *name = "LostPulse");
                    virtual ~LostPulse();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_LostPulse_Variables.h"
#                   include "State_LostPulse_Methods.h"
            };
        }
      }
    }
}

#endif
