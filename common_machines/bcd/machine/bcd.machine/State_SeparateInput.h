//
// State_SeparateInput.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_bcd_State_SeparateInput_h
#define clfsm_bcd_State_SeparateInput_h

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
    namespace CLM
    {
      namespace FSMbcd
      {
        namespace State
        {
            class SeparateInput: public CLState
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
                    SeparateInput(const char *name = "SeparateInput");
                    virtual ~SeparateInput();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_SeparateInput_Variables.h"
#                   include "State_SeparateInput_Methods.h"
            };
        }
      }
    }
}

#endif
