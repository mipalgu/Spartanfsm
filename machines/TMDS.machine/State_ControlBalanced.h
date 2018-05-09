//
// State_ControlBalanced.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_TMDS_State_ControlBalanced_h
#define clfsm_TMDS_State_ControlBalanced_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMTMDS
      {
        namespace State
        {
            class ControlBalanced: public CLState
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
                    ControlBalanced(const char *name = "ControlBalanced");
                    virtual ~ControlBalanced();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_ControlBalanced_Variables.h"
#                   include "State_ControlBalanced_Methods.h"
            };
        }
      }
    }
}

#endif
