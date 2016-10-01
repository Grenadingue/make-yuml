# make-yuml
YUML Makefile snippet with working example

## Dependancies
* A Linux/Unix environment or equivalent
* `make`
* `yuml` from https://github.com/wandernauta/yuml
* `python` v2.*
* `pip`
* An active internet connection to be able to make requests to http://www.yuml.me

## Install dependancies
* Install the following utilities packaged with your distribution
  * `make`
  * `python` v2.*
  * `pip`
* Install the `yuml` utility with `pip`
  * Usually: `sudo pip install https://github.com/wandernauta/yuml/zipball/master`
  * For Arch Linux: just replace `pip` by `pip2`

## Get it
```
$ git clone https://github.com/Grenadingue/make-yuml.git
$ cd make-yuml
```

## Use it
### Use the example
We can see in the `example_diagrams` folder that there are the source files available. These are just a copy/paste from the example snippets available from the official [yuml website](http://www.yuml.me/diagram/scruffy/class/draw).
```
$ ls example_diagrams
example-diagram.activity.yuml.txt  example-diagram.class.yuml.txt  example-diagram.usecase.yuml.txt
```

Now we will generate the `.png` files from the source `.txt` files.
```
$ make
```

We can see that the `.png` files appeared in the `example_diagrams` folder.
```
$ ls example_diagrams
example-diagram.activity.yuml.png  example-diagram.class.yuml.png  example-diagram.usecase.yuml.png
example-diagram.activity.yuml.txt  example-diagram.class.yuml.txt  example-diagram.usecase.yuml.txt
```
You can open them with the image viewer you want.

We can erase every generated image with:
```
$ make clean
```
Or:
```
$ make fclean
```

And finally we can erase and regenerate every diagram from source with:
```
$ make re
```

### Diagram file extensions
For makefile code convenience and better files name readability, the inputed diagrams files name MUST follow the following pattern:
* The __name__ of your diagram (e.g. `your_super_diagram_name`)
* The __type__ of your diagram (`activity` or `class` or `usecase`)
* The `yuml` extension
* The `txt` extension

And finally, each part described above MUST be separated by a dot. You can refer to the files inside `example_diagrams` as example. A quick example: `your_super_diagram_name.class.yuml.txt`

The outputed diagrams will follow the same pattern as the inputed one, except that the final extension will be replaced. e.g. `.txt` will become `.png`.

### Customize the Makefile for your needs
[Here](/Makefile#L20) are the three diagrams types available. You can replace the example diagrams by your owns. Example:
```
CLASS_SRCS = my_first_diagram.class.yuml.txt \
             my_second_diagram.class.yuml.txt \
             my_second_diagram.class.yuml.txt
```
Note the trailing `\` character at the end of each line except the last one.

[Here](/Makefile#L29) choose the `yuml` flags you will use in your Makefile. You can find a quick description of the avaiable flags directly in the Makefile. For a more detailed description and other available flags, see https://github.com/wandernauta/yuml#options

And finally, [here](/Makefile#L45) choose the diagrams output types that will be generated during the process. Instructions in the Makefile.

## Contributing
Don't hesitate to contribute, every contribution is welcome! Just open an issue and we will discuss it.
