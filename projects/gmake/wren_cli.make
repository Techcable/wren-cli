# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=release_64bit
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
INCLUDES += -I../../src/cli -I../../src/module -I../../deps/wren/include -I../../deps/wren/src/vm -I../../deps/wren/src/optional -I../../deps/libuv/include -I../../deps/libuv/src
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LIBS += -limm32 -lwinmm -lversion -lwldap32 -lws2_32 -lpsapi -liphlpapi -luserenv
LDDEPS +=
LINKCMD = $(CC) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

ifeq ($(config),release_64bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_cli.exe
OBJDIR = obj/64bit/Release
DEFINES += -DNDEBUG -D_CRT_SECURE_NO_WARNINGS
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O3 -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -O3
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 -s /OPT:NOREF

else ifeq ($(config),release_32bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_cli.exe
OBJDIR = obj/32bit/Release
DEFINES += -DNDEBUG -D_CRT_SECURE_NO_WARNINGS
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O3 -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -O3
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 -s /OPT:NOREF

else ifeq ($(config),debug_64bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_cli_d.exe
OBJDIR = obj/64bit/Debug
DEFINES += -DDEBUG -D_CRT_SECURE_NO_WARNINGS
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -g
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -m64 /OPT:NOREF

else ifeq ($(config),debug_32bit)
TARGETDIR = ../../bin
TARGET = $(TARGETDIR)/wren_cli_d.exe
OBJDIR = obj/32bit/Debug
DEFINES += -DDEBUG -D_CRT_SECURE_NO_WARNINGS
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -std=c99
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m32 -g
ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -m32 /OPT:NOREF

else
  $(error "invalid configuration $(config)")
endif

# Per File Configurations
# #############################################


# File sets
# #############################################

OBJECTS :=

OBJECTS += $(OBJDIR)/async.o
OBJECTS += $(OBJDIR)/core.o
OBJECTS += $(OBJDIR)/detect-wakeup.o
OBJECTS += $(OBJDIR)/dl.o
OBJECTS += $(OBJDIR)/error.o
OBJECTS += $(OBJDIR)/fs-event.o
OBJECTS += $(OBJDIR)/fs-poll.o
OBJECTS += $(OBJDIR)/fs.o
OBJECTS += $(OBJDIR)/getaddrinfo.o
OBJECTS += $(OBJDIR)/getnameinfo.o
OBJECTS += $(OBJDIR)/handle.o
OBJECTS += $(OBJDIR)/idna.o
OBJECTS += $(OBJDIR)/inet.o
OBJECTS += $(OBJDIR)/io.o
OBJECTS += $(OBJDIR)/loop-watcher.o
OBJECTS += $(OBJDIR)/main.o
OBJECTS += $(OBJDIR)/modules.o
OBJECTS += $(OBJDIR)/os.o
OBJECTS += $(OBJDIR)/path.o
OBJECTS += $(OBJDIR)/pipe.o
OBJECTS += $(OBJDIR)/poll.o
OBJECTS += $(OBJDIR)/process-stdio.o
OBJECTS += $(OBJDIR)/process.o
OBJECTS += $(OBJDIR)/random.o
OBJECTS += $(OBJDIR)/repl.o
OBJECTS += $(OBJDIR)/scheduler.o
OBJECTS += $(OBJDIR)/signal.o
OBJECTS += $(OBJDIR)/snprintf.o
OBJECTS += $(OBJDIR)/stream.o
OBJECTS += $(OBJDIR)/strscpy.o
OBJECTS += $(OBJDIR)/tcp.o
OBJECTS += $(OBJDIR)/thread.o
OBJECTS += $(OBJDIR)/threadpool.o
OBJECTS += $(OBJDIR)/timer.o
OBJECTS += $(OBJDIR)/timer1.o
OBJECTS += $(OBJDIR)/tty.o
OBJECTS += $(OBJDIR)/udp.o
OBJECTS += $(OBJDIR)/util.o
OBJECTS += $(OBJDIR)/uv-common.o
OBJECTS += $(OBJDIR)/uv-data-getter-setters.o
OBJECTS += $(OBJDIR)/version.o
OBJECTS += $(OBJDIR)/vm.o
OBJECTS += $(OBJDIR)/winapi.o
OBJECTS += $(OBJDIR)/winsock.o
OBJECTS += $(OBJDIR)/wren_compiler.o
OBJECTS += $(OBJDIR)/wren_core.o
OBJECTS += $(OBJDIR)/wren_debug.o
OBJECTS += $(OBJDIR)/wren_opt_meta.o
OBJECTS += $(OBJDIR)/wren_opt_random.o
OBJECTS += $(OBJDIR)/wren_primitive.o
OBJECTS += $(OBJDIR)/wren_utils.o
OBJECTS += $(OBJDIR)/wren_value.o
OBJECTS += $(OBJDIR)/wren_vm.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking wren_cli
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning wren_cli
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CC) -x c-header $(ALL_CFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/fs-poll.o: ../../deps/libuv/src/fs-poll.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/idna.o: ../../deps/libuv/src/idna.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/inet.o: ../../deps/libuv/src/inet.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/random.o: ../../deps/libuv/src/random.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/strscpy.o: ../../deps/libuv/src/strscpy.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/threadpool.o: ../../deps/libuv/src/threadpool.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/timer.o: ../../deps/libuv/src/timer.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/uv-common.o: ../../deps/libuv/src/uv-common.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/uv-data-getter-setters.o: ../../deps/libuv/src/uv-data-getter-setters.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/version.o: ../../deps/libuv/src/version.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/async.o: ../../deps/libuv/src/win/async.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/core.o: ../../deps/libuv/src/win/core.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/detect-wakeup.o: ../../deps/libuv/src/win/detect-wakeup.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/dl.o: ../../deps/libuv/src/win/dl.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/error.o: ../../deps/libuv/src/win/error.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/fs-event.o: ../../deps/libuv/src/win/fs-event.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/fs.o: ../../deps/libuv/src/win/fs.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/getaddrinfo.o: ../../deps/libuv/src/win/getaddrinfo.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/getnameinfo.o: ../../deps/libuv/src/win/getnameinfo.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/handle.o: ../../deps/libuv/src/win/handle.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/loop-watcher.o: ../../deps/libuv/src/win/loop-watcher.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/pipe.o: ../../deps/libuv/src/win/pipe.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/poll.o: ../../deps/libuv/src/win/poll.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/process-stdio.o: ../../deps/libuv/src/win/process-stdio.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/process.o: ../../deps/libuv/src/win/process.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/signal.o: ../../deps/libuv/src/win/signal.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/snprintf.o: ../../deps/libuv/src/win/snprintf.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/stream.o: ../../deps/libuv/src/win/stream.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tcp.o: ../../deps/libuv/src/win/tcp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/thread.o: ../../deps/libuv/src/win/thread.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tty.o: ../../deps/libuv/src/win/tty.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/udp.o: ../../deps/libuv/src/win/udp.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/util.o: ../../deps/libuv/src/win/util.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/winapi.o: ../../deps/libuv/src/win/winapi.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/winsock.o: ../../deps/libuv/src/win/winsock.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_opt_meta.o: ../../deps/wren/src/optional/wren_opt_meta.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_opt_random.o: ../../deps/wren/src/optional/wren_opt_random.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_compiler.o: ../../deps/wren/src/vm/wren_compiler.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_core.o: ../../deps/wren/src/vm/wren_core.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_debug.o: ../../deps/wren/src/vm/wren_debug.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_primitive.o: ../../deps/wren/src/vm/wren_primitive.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_utils.o: ../../deps/wren/src/vm/wren_utils.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_value.o: ../../deps/wren/src/vm/wren_value.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/wren_vm.o: ../../deps/wren/src/vm/wren_vm.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/main.o: ../../src/cli/main.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/modules.o: ../../src/cli/modules.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/path.o: ../../src/cli/path.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/vm.o: ../../src/cli/vm.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/io.o: ../../src/module/io.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/os.o: ../../src/module/os.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/repl.o: ../../src/module/repl.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/scheduler.o: ../../src/module/scheduler.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/timer1.o: ../../src/module/timer.c
	@echo $(notdir $<)
	$(SILENT) $(CC) $(ALL_CFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif