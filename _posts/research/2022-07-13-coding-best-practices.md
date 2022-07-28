---
title: Python Coding Best Practices for CS Researchers
summary: >
    Stop hard-coding your main method and changing it every time you want to 
    run something!
layout:  post
modified: 2022-07-10
---
If your code is a monstrous mish-mosh of comments, global variables, and hard-coded who-knows-what, stop right now. This is your sign to *finally* refactor your code.

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

## Invest more effort in `py` files for less effort in running them later.
Using `py` files kind of frustrates me from time to time because I find them more difficult to make quick changes on the fly. They are, however, much better for stable code---and you can't run a notebook from the command line or import a module from a notebook to another file. If you are writing code, you are writing software, and a big research project requires a few software engineering skills (sorry, researchers!).

### Use `argparse` to process command line arguments.
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

It's tedious, vulnerable to off-by-one errors, hard to keep track of what goes where, and doesn't support optional arguments that easily. Use `argparse` instead!

With `argparse`, you can handle a variety of command line arguments, like

```
$ python3 --model_name gpt2
$ python3 --model_name gpt2 --learning_rate 1.0e-5
$ python3 --learning_rate 1.0e-5 --model_name gpt2
```

and so on.


### Use a config `yaml` to write, save, and reuse many command line arguments.
Imagine this: you are trying to run a file with a bunch of command line arguments, you can't remember what half of them are named, and you're tired of retyping a bunch of letters just to change one argument. If this sounds annoyingly familiar, try using a `yaml` file to handle your command line arguments instead.

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
    parser = ArgParse("Train a model to answer questions.")
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

### Stop writing individual function parameters when you could `**params` instead.
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
