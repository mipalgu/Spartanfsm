//
// State_A.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_7SegDigit_State_A_h
#define clfsm_7SegDigit_State_A_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSM7SegDigit
      {
        namespace State
        {
            class A: public CLState
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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];
#pragma clang diagnostic pop


                public:
                    A(const char *name = "A");
                    virtual ~A();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_A_Variables.h"
#                   include "State_A_Methods.h"
            };
        }
      }
    }
}

#endif
