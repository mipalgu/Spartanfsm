//
// State_D.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_7SegDigit_State_D_h
#define clfsm_7SegDigit_State_D_h

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
            class D: public CLState
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
                    D(const char *name = "D");
                    virtual ~D();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_D_Variables.h"
#                   include "State_D_Methods.h"
            };
        }
      }
    }
}

#endif
