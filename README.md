# MWE Slidev x WGLMakie

- first, generate the interactive WGLMakie figure in your local web browser by running src/MWE.jl

Then, to start the slide show:

- `npm install`
- `npm run dev`
- visit http://localhost:3030

Edit the [slides.md](./slides.md) to see the changes.
Specifically, on the second slide, you will see the code calling the local webpage WGLMakie figure

```
layout: iframe-right

# the web page source
url: http://127.0.0.1:9384/browser-display

```

Learn more about Slidev on [documentations](https://sli.dev/).
