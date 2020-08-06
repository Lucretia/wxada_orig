# Standard targets.

$(OUTPUT_DIR)/%.d: %.cc
	$(CXX) -MM $(CXXFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(OUTPUT_DIR)/\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

#.adb.o:
#	$(ADA) $(ADAFLAGS) -o $@ $<
#	
#.ads.o:
#	$(ADA) $(ADAFLAGS) -o $@ $<
	
#.cc.o:
$(OUTPUT_DIR)/%.o: %.cc
	$(CXX) $(CXXFLAGS) -o $@ $<
	
.c.o:
	$(CC) $(CFLAGS) -o $@ $<

.s.o:
	$(AS) $(ASFLAGS) -o $@ $<

.PHONY: subdirs install-subdirs clean-subdirs

subdirs:
	@set -e; \
	for dir in ${SUBDIRS}; do \
		(cd $$dir; ${MAKE} all); \
	done
	
install-subdirs:
	@set -e; \
	for dir in ${SUBDIRS}; do \
		(cd $$dir; ${MAKE} install); \
	done
	
clean-subdirs:
	@set -e; \
	for dir in ${SUBDIRS}; do \
		(cd $$dir; ${MAKE} clean); \
	done
