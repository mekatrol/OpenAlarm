
// Initialise timers
void TimerInit();

// The number of milli ticks since startup (increments by 1 every 1.024ms)
uint32_t TimerMilliTicks();

// The number of micro ticks since startup (increments by 1 every 4us)
uint32_t TimerMicroTicks(void);

// Check if the timeout period has expired based on start_tick and timeout period
// all in milliseconds
uint8_t TimerCheckForTimeout(uint32_t start_tick, uint32_t timeout_period);
