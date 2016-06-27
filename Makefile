CC      = clang
BIN     = hdr
DIRS    = objdir
SRC     = main.c hdr.c utils.c
LIBS    = -lm
CFLAGS  = -g3 -Wall
MKDIR   = mkdir
EXT     = c
SRCDIR  = src
OBJDIR  = obj
OBJ     := $(subst .$(EXT),.o,$(SRC))
OBJ     := $(addprefix $(OBJDIR)/, $(OBJ))
 
all: $(DIRS) $(BIN)

objdir:
	$(MKDIR) -p $(OBJDIR)

# noising: $(OBJDIR)/noising.o $(OBJDIR)/error.o $(OBJDIR)/png_io.o $(OBJDIR)/utils.o
# 	@echo "Link $< ..."
# 	@$(CC) -o $@ $(OBJDIR)/error.o $(OBJDIR)/png_io.o $(OBJDIR)/utils.o $(OBJDIR)/noising.o $(LIBS)
 
hdr: $(OBJDIR)/main.o $(OBJDIR)/hdr.o $(OBJDIR)/utils.o
	@echo "Link $< ..."
	@$(CC) -o $@ $(OBJDIR)/hdr.o  $(OBJDIR)/utils.o $(OBJDIR)/main.o $(LIBS)
       
$(OBJDIR)/utils.o: $(SRCDIR)/utils.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/hdr.o: $(SRCDIR)/hdr.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
       
$(OBJDIR)/main.o: $(SRCDIR)/main.c
	@echo "Compile $< ..."
	@$(CC) -c $(CFLAGS) -o $@ $<
 
clean:
	rm -r hdr $(OBJDIR)
