//
// State_XoredState.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_TMDS_State_XoredState_h
#define clfsm_TMDS_State_XoredState_h

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
            class XoredState: public CLState
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
                    Transition_0(int toState = 5): CLTransition(toState) {}

                    virtual bool check(CLMachine *, CLState *) const;
                };

                CLTransition *_transitions[1];

                public:
                    XoredState(const char *name = "XoredState");
                    virtual ~XoredState();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_XoredState_Variables.h"
#                   include "State_XoredState_Methods.h"
            };
        }
      }
    }
}

#endif
