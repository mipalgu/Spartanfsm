//
// State_SetupMeasure.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_UltrasonicDiscreteSingle_State_SetupMeasure_h
#define clfsm_UltrasonicDiscreteSingle_State_SetupMeasure_h

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
            class SetupMeasure: public CLState
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
                    Transition_0(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    SetupMeasure(const char *name = "SetupMeasure");
                    virtual ~SetupMeasure();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_SetupMeasure_Variables.h"
#                   include "State_SetupMeasure_Methods.h"
            };
        }
      }
    }
}

#endif
