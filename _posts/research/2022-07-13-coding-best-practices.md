---
title: Python Coding Best Practices for CS Researchers
summary: >
    Stop hard-coding your main method and changing it every time you want to 
    run something!
layout:  post
modified: 2022-07-10
---
If your code is a monstrous mish-mosh of comments, global variables, and hard-coded who-knows-what, stop right now. This is your sign to *finally* refactor your code.

This file uses a lot of examples related to using machine learning models, but it hopefully it will be useful for anyone with intermediate experience in Python!

**Table of Contents**
- toc
{:toc}

## Check out some of my favorite resources.
- VSCode with at least these plugins...
    - Jupyter: run Jupyter notebooks from inside VSCode. No more `jupyter notebook --no-browser ...`
    - Remote SSH: use VSCode on a remote server
    - Vim: keybindings
- Google Colab
    - Easy access to cloud computing (including GPUs, in a limited but still useful form), lots of built-in packages, convenient load and save functionality with Google Drive, collaboration.
- Online Python environments, for when you want to know what a teeny bit of code would do but don't want to open a whole new file to test it.

## Use notebooks with care.
This is definitely a personal preference, so go ahead and ignore this one if you already have a system you like. If you, like me, find yourself waffling from notebooks to `py` files and back again, here are some tips to stay organized.

### Use notebooks for quick experimentation.
I like to use notebooks when I'm trying a new library, looking at sample output, or rapidly refactoring code as I go. I like that you can run individual cells within a notebook instead of having to fiddle with the main method, comment stuff out, or open the Terminal in another window.

The more complex your code becomes, however, the dangerous the flexibility of a notebook can be. You should switch to using a `py` file when you find yourself frequently running the same cells, with unchanged code, especially if you keep running the same cells out of order. You could also clean up some code into a single cell that contains stable functions or drop the code into a `utils.py` file that you import into the notebook. (More on utils files later.)

You probably could work on your entire research project from a single notebook (I did used one notebook and a couple `py` files for an entire internship). It just becomes a little hard to deal with after a while!

### Alternatively, use (Colab) notebooks for long-term tutorials.
Python notebooks, especially Colab notebooks, are great for interactive tutorials. Some of my favorite tutorials have the following features...

- Consistent use of Markdown cells with headers, essential information, and other details throughout the document.
- All imports in the top cell of the notebook (preferably in alphabetical order, but does anyone besides me actually care about that?).
- Cells contain logical chunks of code---avoid one-liners or massively long cells, if possible---meaning that each cell teaches me one important idea.
- Cells can be run in order without breaking.
- Output! Show me something once in a while! I love when a cell teaches me what to do (like train a model) and then shows me what's going on (like a graph, progress bar, or even "training complete!" message).

### Whatever you do, avoid floating code in notebooks!
I know that it's super easy and tempting to treat each cell in a notebook as a mini main method and write standalone for loops, variables, and whatever else you want, but avoid this as much as you can! First of all, floating variables can cause a mess somewhere else in your notebook, especially if you use the same variable name (gasp) for different code chunks. Perhaps more importantly, floating code is much harder to refactor into a `py` file later on. If you find yourself running the same chunk of code over and over again, do your future self a favor and refactor it into its own function.

## Invest more effort in py files for less effort in running them later.
Using `py` files kind of frustrates me from time to time because I find them more difficult to make quick changes on the fly. They are, however, much better for stable code---and you can't run a notebook from the command line or import a module from a notebook to another file. If you are writing code, you are writing software, and a big research project requires a few software engineering skills (sorry, researchers!).

### Use argparse to process command line arguments.
Traditional, no-frills command line arguments in Python work like this:

First, you pass in *all* of the arguments, *in order*, without argument names.
```
$ python3 run_experiment.py gpt2 1.0e-5 200
```

Then, you parse the arguments and cast them to their appropriate type (I'm pretty sure all command line arguments are parsed as strings).
```
import sys

if __name__ == "__main__":
    args = sys.argv

    # args[0] == "run_experiment.py"

    model_name = args[1]  # "gpt2"
    learning_rate = float(args[2])  # 1.0e-5
    num_train_epochs = int(args[3])  # 200
```

It's tedious, vulnerable to off-by-one errors, hard to keep track of what goes where, and doesn't support optional arguments that easily. Use ArgParse instead!

To install ArgParse:

```pip install argparse```

With ArgParse, you can handle a variety of command line arguments, like

```
$ python3 --model_name gpt2
$ python3 --model_name gpt2 --learning_rate 1.0e-5
$ python3 --learning_rate 1.0e-5 --model_name gpt2
```

and so on. It looks something like this:

```
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser("Description of file here.")
    parser.add_argument(
        "model_name",  # variable names without the -- prefix are required
        default="gpt2",  # default value
        type=str,
        help="Name of the model to load."
    )
    parser.add_argument(
        "--learning_rate",  # optional argument
        type=float
    )
    parser.add_argument(
        "--num_train_epochs",
        type=int
    )
    args = parser.parse_args()

    ...

    run_experiment(
        model_name=args.model_name,
        learning_rate=args.learning_rate,
        epochs=args.num_train_epochs,
        ...
    )
```

ArgParse also supports lists as input values for parameters with the `extend` action:

```
$ run_experiment --num_train_epochs 1 10 100 500
```

```
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--num_train_epochs",
        action="extend",
        type=int
    )
    args = parser.parse_args()

    ...

    args.num_train_epochs == [1, 10, 100, 500]
```

**Important note about booleans**: ArgParse doesn't handle booleans they way you might expect or want. For example, running the command

```
$ run_experiment.py --save_model False
```

with the ArgParse set up like

```
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--save_model",
        type=bool
    )
    args = parser.parse_args()
```

will not give you

```
$ args.save_model == False  # in this case, args.save_model is actually True!
```

This is because, under the hood, `argparse` is applying the `type()` function that you specify to the value it receives. In this case, it applies `bool()`. A command line argument is initially parsed as a string. Only empty strings (`""`) and `None` are defined to be `False`. Every other string, including the string `"False"`, is defined to be `True`.

```
$ bool("True") == True
$ bool("0") == True
$ bool("False") == True
$ bool("I like potato chips") == True
$ bool("") == False
$ bool(None) == False
```

For completeness, I should also mention that the *integer* `0` is defined to be `False` and every other `int` is `True`.
```
$ bool("0") == True
$ bool(0) == False

$ bool("1") == True
$ bool(1) == True
$ bool(6789998212) == True
```

The *canonical* way to deal with this would be to do something like

```
$ run_experiment.py --save-model
$ run_experiment.py --no-save-model
```

```
import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--save_model",
        action=argparse.BooleanOptionalAction
    )
    args.parse_args()
```


but if you're stubborn like me you could do something hacky like

```
import argparse

if __name__ == "main":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--save_model",
        type=str
    )
    args.parse_args()

    ...

    if args.save_model == "true":
        do_stuff()
    else:
        do_other_stuff()
```


### Use a config yaml to write, save, and reuse many command line arguments.
Imagine this: you are trying to run a file with a bunch of command line arguments, you can't remember what half of them are named, and you're tired of retyping a bunch of letters just to change one argument. If this sounds annoyingly familiar, try using a `yaml` file to handle your command line arguments instead.

First, install `pyyaml`:
```
pip install pyyaml
```

`YAML` stands for Yet Another Markup Language, and it's an easy way to store key-value pairs in a plaintext file. If you're trying to run a model, you might have a `config.yaml` like this:

```
- model_name: "gpt2"
- model_input: "how much wood would a woodchuck chuck if a woodchuck could chuck wood?"
- expected_output: "a woodchuck would chuck all the wood it could chuck if a woodchuck could chuck wood."
```

You would pass it to your file as a single command line argument like this:
```
$ python3 run_experiment.py config.yaml
```

You can then parse it in your `py` file like this:
```
import argparse
import yaml

if __name__ == __main__:
    parser = argparse.ArgumentParser("Train a model to answer questions.")
    parser.add_argument("config")
    args = parser.parse_args()

    with open(args.config, "r") as infile:
        config = yaml.full_load(infile)

    run_experiment(config["model_name"], config["input"], config["expected_output"])
```

`YAML` can even handle nested arguments quite easily. Your `yaml` file basically becomes a bunch of nested dictionary. For example, this `yaml` file

```
- model_name: "gpt2"
- train_params:
    - learning_rate: 1.0e-5  # decimal necessary here! 1e-5 will be parsed as string in YAML.
    - num_train_epochs: 100  # decimal not necessary here
```

looks like this in a `py` file

```
$ config["model_name"]  # "gpt2"
$ config["train_params"]  # { "learning_rate": 0.00001, "num_train_epochs": 100 }
$ config["train_params"]["num_train_epochs"]  # 100
```

### Combine argparse and yaml config files for ultimate flexibility.
This is redundant, but once I had YAML config files set up I got tired of needing to open, edit, and save files just to change one or two command line arguments, so I started doing this:

```
import argparse
import yaml

def update_config(args, yaml_config):
    if args.learning_rate:  # if args.learning_rate is not None
        yaml_config["learning_rate"] = args.learning_rate

    return yaml_config


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "yaml_config_path",
        help="Required path to YAML config file."
    )
    parser.add_argument(
        "--learning_rate",
        type=float,
        default=None,
        help="If no learning rate is given, then args.learning_rate is None."
    )
    args = parser.parse_args()

    with open(args.yaml_config_path, "r") as infile:
        yaml_config = yaml.full_load(infile)

    yaml_config = update_config(yaml_config)
```

Right now, I pretty much hardcode my `update_confgs()` file whenever I have a parameter I want to be able to update from the command line. It's a bit tedious, but if you set it up once it works forever.

### Stop writing individual function parameters when you could unwrap a dictionary instead.
`YAML` and dictionaries are great for another time-saving function: unwrapping function arguments. In our previous example, instead of doing something like

```
train_model(learning_rate=config["train_params"]["learning_rate"], ...)
```

you could simply do

```
train_model(**config["train_params"])
```

The `**` notation in front of a dictionary name will unwrap the dictionary into keys and values for you, making it a lot easier to pass in a bunch of parameters values at once.

You could do something like this programmatically too, like

```
train_params = get_train_params()  # returns dictionary
train_model(**train_params)
```

## Use Python classes instead of global variables.
Frequently using global variables in a `py` file is a sign that you should refactor your code into using a Python `class`. [Global variables are considered bad in any programming language](https://stackoverflow.com/questions/19158339/why-are-global-variables-evil){:target="_blank"}, and I think they are especially annoying in Python because you need to use the keyword `global` every time you want to use a global variable:

```
index = 0

def increase_index():
    global index
    index += 1


def decrease_index():
    global index
    index -= 1


def get_index():
    global index
    return index
```

It's a silly example, but you can see that accessing a global variable requires double the lines of code. Instead of relying on global variables, you should consider refactoring your code into a class with instance variables, like this:

```
class Index():
    def __init__(self):
        self.index = 0

    def increase_index(self):
        self.index += 1


    def decrease_index(self):
        self.index -= 1


    def get_index(self):
        return self.index
```

```
>>> i = Index()
>>> i.increase_index()  # 1
>>> i.decrease_index()  # 0
>>> i.get_index()  # 0
```

Python classes aren't really necessary if you have safe coding practices and a simple use case, but they're very helpful for wrapper classes and more complex functionality.

Compare this sample file with global variables

```
data = []
output = []

def load_data(path):
    with open(path, "r") as infile:
        for line in infile:
            global data
            data.append(line)


def train_model(model):
    global data
    model.train(data)


def generate_sentence(model_input, model):
    model_output = model.generate(model_input)
    global output
    output.append(model_output)
```

to this sample file wrapped in a class

```
class MyModel():
    def __init__(self):
        self.data = []
        self.output = []


    def load_data(self, path):
        with open(path, "r") as infile:
            for line in infile:
                self.data.append(line)
    

    def train_model(model):
        model.train(self.data)


    def generate_sentence(model_input, model):
        model_output = model.generate(model_input):
        self.output.append(model_output)
```

It would be even better if you included `model` as an instance variable of `MyModel` along with functions for instantiating it. Either way, wrapping the `load_data()`, `train_model()`, and `generate_sentence()` functions in a class makes it easier to import them to other files.

```
from MyModelFile import load_data, train_model, generate_sentence
```

vs. 

```
from MyModelFile import MyModel
```

Hooray for encapsulation!