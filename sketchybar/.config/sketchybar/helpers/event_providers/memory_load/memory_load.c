#include "memory.h"
#include "../sketchybar.h"
#include <sys/sysctl.h>

int main (int argc, char** argv) {
  float update_freq;
  if (argc < 3 || (sscanf(argv[2], "%f", &update_freq) != 1)) {
    printf("Usage: %s \"<event-name>\" \"<event_freq>\"\n", argv[0]);
    exit(1);
  }

  alarm(0);
  struct memory mem;
  memory_init(&mem);

  // Setup the event in sketchybar
  char event_message[512];
  snprintf(event_message, 512, "--add event '%s'", argv[1]);
  sketchybar(event_message);

  char trigger_message[512];
  for (;;) {
    // Acquire new info
    memory_update(&mem);

    // Prepare the event message
    snprintf(trigger_message,
             512,
             "--trigger '%s' memory_percent='%02d' used_memory='%llu' total_memory='%llu'",
             argv[1],
             mem.memory_percent,
             mem.used_memory,
             mem.total_memory);

    // Trigger the event
    sketchybar(trigger_message);

    // Wait
    usleep(update_freq * 1000000);
  }
  return 0;
}

