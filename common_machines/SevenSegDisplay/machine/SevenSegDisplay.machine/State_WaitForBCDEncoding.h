//
// State_WaitForBCDEncoding.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SevenSegDisplay_State_WaitForBCDEncoding_h
#define clfsm_SevenSegDisplay_State_WaitForBCDEncoding_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMSevenSegDisplay
      {
        namespace State
        {
            class WaitForBCDEncoding: public CLState
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
                    WaitForBCDEncoding(const char *name = "WaitForBCDEncoding");
                    virtual ~WaitForBCDEncoding();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 1; }

#                   include "State_WaitForBCDEncoding_Variables.h"
#                   include "State_WaitForBCDEncoding_Methods.h"
            };
        }
      }
    }
}

#endif
