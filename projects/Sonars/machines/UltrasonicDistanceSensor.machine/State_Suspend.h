//
// State_Suspend.h
//
// Automatically created through MiPalCASE -- do not change manually!
//
#ifndef clfsm_UltrasonicDistanceSensor_State_Suspend_h
#define clfsm_UltrasonicDistanceSensor_State_Suspend_h

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wc++98-compat"

#include "CLState.h"
#include "CLAction.h"
#include "CLTransition.h"

namespace FSM
{
  namespace CLM
  {
    namespace FSMUltrasonicDistanceSensor
    {
      namespace State
      {
        class Suspend: public CLState
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
                    Suspend(const char *name = "Suspend");
                    virtual ~Suspend();

                    virtual CLTransition * const *transitions() const { return _transitions; }
                    virtual int numberOfTransitions() const { return 0; }

#                   include "State_Suspend_Variables.h"
#                   include "State_Suspend_Methods.h"
            };
        }
      }
    }
}

#endif
