bin_PROGRAMS = \
	demo

demo_SOURCES = \
	main.cc

demo_CXXFLAGS = \
	$(CXXFLAGS) \
	-std=c++11 \
 	-Wall

demo_LDFLAGS = \
	$(LDFLAGS)

AM_CPPFLAGS = \
	-DPACKAGE_LOCALE_DIR=\""$(prefix)/$(DATADIRNAME)/locale"\" \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\"