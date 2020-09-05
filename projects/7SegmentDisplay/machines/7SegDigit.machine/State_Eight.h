//
// State_Eight.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_7SegDigit_State_Eight_h
#define clfsm_7SegDigit_State_Eight_h

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
            class Eight: public CLState
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
                    Eight(const char *name = "Eight");
                    virtual ~Eight();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Eight_Variables.h"
#                   include "State_Eight_Methods.h"
            };
        }
      }
    }
}

#endif
