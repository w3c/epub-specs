
#  Repo subdirectory for the EPUB Annotation vocabulary

- Changes must be done on the `index.yml` or `template.html` files, all the others are generated.
- Generation is done via the [`yml2vocab`](https://w3c.github.io/yml2vocab/) tool. I relies on the [deno](https://deno.land) Typescript environment. To run it:
    - If yml2vocab is installed locally: `yml2vocab -c -v index`.
    - Otherwise: `deno x jsr:@iherman/yml2vocab/cli -c -v index` (if running after a change in the `yml2vocab` run `deno run -A --reload…` once to refresh the local cache).
