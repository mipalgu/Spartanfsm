//
// State_LightOn.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_SuspensibleHelloWorld_State_LightOn_h
#define clfsm_SuspensibleHelloWorld_State_LightOn_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSMSuspensibleHelloWorld
    {
      namespace State
      {
        class LightOn: public CLState
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
          
          class OnSuspend: public CLAction
          {
            virtual void perform(CLMachine *, CLState *) const;
          };
          
          class OnResume: public CLAction
          {
            virtual void perform(CLMachine *, CLState *) const;
          };
          #pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wzero-length-array"
                CLTransition *_transitions[0];
#pragma clang diagnostic pop


                public:
                    LightOn(const char *name = "LightOn");
                    virtual ~LightOn();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_LightOn_Variables.h"
#                   include "State_LightOn_Methods.h"
            };
        }
      }
    }
}

#endif
