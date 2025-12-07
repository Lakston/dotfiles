#include <mach/mach.h>
#include <stdbool.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/sysctl.h>

struct memory {
  host_t host;
  mach_msg_type_number_t count;
  vm_size_t page_size;
  vm_statistics64_data_t stats;
  
  unsigned long long total_memory;
  unsigned long long used_memory;
  unsigned long long free_memory;
  int memory_percent;
};

static inline void memory_init(struct memory* mem) {
  mem->host = mach_host_self();
  mem->count = HOST_VM_INFO64_COUNT;
  
  // Get page size
  host_page_size(mem->host, &mem->page_size);
  
  // Get total physical memory
  int mib[2] = {CTL_HW, HW_MEMSIZE};
  size_t length = sizeof(mem->total_memory);
  sysctl(mib, 2, &mem->total_memory, &length, NULL, 0);
}

static inline void memory_update(struct memory* mem) {
  kern_return_t error = host_statistics64(mem->host,
                                           HOST_VM_INFO64,
                                           (host_info64_t)&mem->stats,
                                           &mem->count);
  
  if (error != KERN_SUCCESS) {
    printf("Error: Could not read memory host statistics.\n");
    return;
  }
  
  // Calculate memory usage
  unsigned long long pages_used = mem->stats.active_count +
                                   mem->stats.inactive_count +
                                   mem->stats.wire_count;
  
  mem->used_memory = pages_used * mem->page_size;
  mem->free_memory = mem->total_memory - mem->used_memory;
  mem->memory_percent = (int)((double)mem->used_memory / (double)mem->total_memory * 100.0);
}

