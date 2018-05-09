//
// State_CheckBlank.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_TMDS_State_CheckBlank_h
#define clfsm_TMDS_State_CheckBlank_h

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
            class CheckBlank: public CLState
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

                class Transition_1: public CLTransition
                {
                public:
                    Transition_1(int toState = 4): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[2];

                public:
                    CheckBlank(const char *name = "CheckBlank");
                    virtual ~CheckBlank();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 2; }

#                   include "State_CheckBlank_Variables.h"
#                   include "State_CheckBlank_Methods.h"
            };
        }
      }
    }
}

#endif
