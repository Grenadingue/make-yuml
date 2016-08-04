#
##
### Makefile for YUML diagrams generation from text files to png/jpg/svg/pdf


#
## Command line tools
YUML =	yuml

RM =	rm -f


#
## Diagrams location
FOLDER = example_diagrams


#
## Class, activity and use case diagrams source files (txt)
CLASS_SRCS = $(FOLDER)/example-diagram.class.yuml.txt

ACTIVITY_SRCS = $(FOLDER)/example-diagram.activity.yuml.txt

USECASE_SRCS = $(FOLDER)/example-diagram.usecase.yuml.txt


#
## Rules that convert the source files to the desired format (png, jpg, svg, pdf)
YUML_PNGS = 	$(CLASS_SRCS:.class.yuml.txt=.class.yuml.png) \
		$(ACTIVITY_SRCS:.activity.yuml.txt=.activity.yuml.png) \
		$(USECASE_SRCS:.usecase.yuml.txt=.usecase.yuml.png)

YUML_JPGS = 	$(CLASS_SRCS:.class.yuml.txt=.class.yuml.jpg) \
		$(ACTIVITY_SRCS:.activity.yuml.txt=.activity.yuml.jpg) \
		$(USECASE_SRCS:.usecase.yuml.txt=.usecase.yuml.jpg)

YUML_SVGS = 	$(CLASS_SRCS:.class.yuml.txt=.class.yuml.svg) \
		$(ACTIVITY_SRCS:.activity.yuml.txt=.activity.yuml.svg) \
		$(USECASE_SRCS:.usecase.yuml.txt=.usecase.yuml.svg)

YUML_PDFS = 	$(CLASS_SRCS:.class.yuml.txt=.class.yuml.pdf) \
		$(ACTIVITY_SRCS:.activity.yuml.txt=.activity.yuml.pdf) \
		$(USECASE_SRCS:.usecase.yuml.txt=.usecase.yuml.pdf)


#
## YUML flags to adjust the desired outputs
##
## verbose: -v
## note: log output
##
## styles: -s (plain || nofunky || scruffy)
## note: diagram output; default is scruffy
##
## scale: --scale N
## note: diagram output; where N is a number representing a percentage;
##       this precentage representing the scale of the outputed diagram
##       in term of image resolution
YUML_FLAGS =	-v -s plain


#
## Makefile rules to convert .txt files to the desired output(s)
##
## .txt to .png
%.class.yuml.png:	%.class.yuml.txt
		$(YUML) -i $< -o $@ -f png -t class $(YUML_FLAGS)

%.activity.yuml.png:	%.activity.yuml.txt
		$(YUML) -i $< -o $@ -f png -t activity $(YUML_FLAGS)

%.usecase.yuml.png:	%.usecase.yuml.txt
		$(YUML) -i $< -o $@ -f png -t usecase $(YUML_FLAGS)

#
## .txt to .jpg
%.class.yuml.jpg:	%.class.yuml.txt
		$(YUML) -i $< -o $@ -f jpg -t class $(YUML_FLAGS)

%.activity.yuml.jpg:	%.activity.yuml.txt
		$(YUML) -i $< -o $@ -f jpg -t activity $(YUML_FLAGS)

%.usecase.yuml.jpg:	%.usecase.yuml.txt
		$(YUML) -i $< -o $@ -f jpg -t usecase $(YUML_FLAGS)

#
## .txt to .svg
%.class.yuml.svg:	%.class.yuml.txt
		$(YUML) -i $< -o $@ -f svg -t class $(YUML_FLAGS)

%.activity.yuml.svg:	%.activity.yuml.txt
		$(YUML) -i $< -o $@ -f svg -t activity $(YUML_FLAGS)

%.usecase.yuml.svg:	%.usecase.yuml.txt
		$(YUML) -i $< -o $@ -f svg -t usecase $(YUML_FLAGS)

#
## .txt to .pdf
%.class.yuml.pdf:	%.class.yuml.txt
		$(YUML) -i $< -o $@ -f pdf -t class $(YUML_FLAGS)

%.activity.yuml.pdf:	%.activity.yuml.txt
		$(YUML) -i $< -o $@ -f pdf -t activity $(YUML_FLAGS)

%.usecase.yuml.pdf:	%.usecase.yuml.txt
		$(YUML) -i $< -o $@ -f pdf -t usecase $(YUML_FLAGS)


#
## Desired output format(s)
## Replace `PNG` by the desired output format
## Or add multiple output formats if you want more
## e.g.: $(YUML_PNGS) $(YUML_JPGS) $(YUML_SVGS) $(YUML_PDFS)
YUML_OUTPUT =	$(YUML_PNGS)

#
## Callable rules
##
## Will convert every source file to the desired output format(s)
all:		$(YUML_OUTPUT)

#
## Will delete every outputed file
clean:
		$(RM) $(YUML_OUTPUT)

#
## Same as clean; for convenience only
fclean:		clean

#
## Will delete every outputed file then regenerate them
re:		fclean all

.PHONY:		all clean fclean re
