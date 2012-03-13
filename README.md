# mdpress

This is a tool that converts markdown files to presentations using impress.

# Example

[This presentation](http://egonschiele.github.com/mdpress/default) was created from [this markdown file](https://raw.github.com/egonSchiele/mdpress/master/examples/demo.md).
[This presentation](http://egonschiele.github.com/mdpress/impress) was created from the same markdown file and a different stylesheet using `mdpress -s [stylesheet name]`.


## Advantages

- dead simple, works with any markdown file
- comes with a beautiful default stylesheet + more styles (more styles TBD) ... no need to write your own
- ...but you can write your own easily if you want!
- comes with [prettify](http://code.google.com/p/google-code-prettify/) integrated, does code highlighting out of the box
- has an auto-update mode; update your markdown file and mdpress will update your presentation automatically
- quick install as a ruby gem
- presentations are tiny and easy to distribute
- presentations are easy to read as a plain text file

## Install

	gem install mdpress

## Usage

	mdpress [filename.md]

This creates a directory named `filename`. Start the presentation by opening up `index.html`.

## Quickstart (writing your first presentation!)

	# Chicken Chicken Chicken
	## By Chicken

	---

	# Chicken
	- Chicken
	- Chicken Chicken

Save that as `test.md` and then use `mdpress test.md` to convert it to a presentation. 
`mdpress` uses [Redcarpet](https://github.com/tanoku/redcarpet), so it can parse whatever markdown you throw at it.
We use the horizonal rule, `---`, to indicate the start of a new slide.

### Getting Fancy: adding transformations

So far the slide transitions haven't been that exciting. Let's spice them up.
Below the `---`, type:

	= data-x="1000"

And re-compile with `mdpress test.md` (you might have to delete your old presentation directory first).

Aha! Not bad! We specify transformations with `= [list of transformations]` as the first line of whatever slide we want to apply the transformation to.

We could have written

	= data-x="1000" data-scale="2"

To make it scale as well as swipe.

## Possible Attributes

- `data-x`, `data-y`, `data-z`: positioning
- `data-rotate-x`, `data-rotate-y`, 'data-rotate-z`, `data-rotate`: rotation (`data-rotate` and `data-rotate-z` are exactly the same)
- `data-scale`: scale
- `id`: used as the slide link. For example, if you use `id=intro`, you can link to that slide using `index.html#/intro`.

See [impress.js](https://github.com/bartaz/impress.js/blob/master/index.html) for a broader description of these.

Adding this syntax to Markdown feels like kind of a hack, but it's concise. I'm open to suggestions for something better.

## Auto-update

Earlier, our workflow involved having to delete the old presentation and recompile every time we made an edit. The better choice is to use the automatic mode:

	mdpress -a [filename.md]

Now, `mdpress` will keep running and check for updates to your markdown file. It will automatically recompile the presentation for you, so you can seamlessly edit your markdown and view your changes instantly.

## Stylesheets

`mdpress` comes with a default stylesheet, plus a few more. See the full list of available stylesheets with

	mdpress -l

Or specify a stylesheet to use with

	mdpress -s [stylesheet]

If you make your own stylesheets, send me a pull request and I'll add them to the list! See below.

## Running a presentation

Someone emailed you a `mdpress` presentation. Now you want to **just run it**? Sure:

	mdpress -r [filename.md]

That will automatically compile the presentation and open it in a browser window.

## Contributing

To contribute a new stylesheet, follow these steps:

1. Fork this repo.
2. Place your new stylesheet in `lib/impress_css/[your stylesheet name].css`
3. Send me a pull request!

## I want the typewriter sound to play when I change slides!

Go away.

## License (MIT)

Copyright (C) 2012 by Aditya Bhargava

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
