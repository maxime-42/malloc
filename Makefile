# Compiler
CC := gcc

# Directories
SRCDIR := src
INCDIR := include
BUILDDIR := build
TARGET := malloc

# Files
SRCEXT := c
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS :=  -Wall -Wextra -Werror -I$(INCDIR)

# Default rule
all: $(TARGET)

# Target rule
$(TARGET): $(OBJECTS)
	@$(CC) $(OBJECTS) -o $(TARGET)

# Compile rule
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

# Clean rule
clean:
	@rm -rf $(BUILDDIR) $(TARGET)

# Phony targets
.PHONY: all clean
