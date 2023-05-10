# My Website

## Prerequisites

Before building the website, you must have the following tools installed:

- Go-Hugo
- Make

You must also have the Ananke theme installed in your Hugo site.

## Lifecycle

To build the website, follow these steps:

1. Run `make build` to generate the website from the markdown and configuration files in the `dist/` directory.
2. To clean up the `dist/` directory, run `make clean`.
3. To create a new blog post with a custom title and filename, run `make post POST_TITLE="My New Blog Post" POST_NAME="my-new-blog-post"`.
4. To view the website locally, run `hugo server -D` and visit http://localhost:1313 in your web browser.
5. To deploy the website to a hosting provider, run `hugo` to generate the static files in the `dist/` directory, then upload the contents of that directory to your hosting provider.

### Makefile Targets

- `build`: Generate the website from the markdown and configuration files in the `dist/` directory.
- `clean`: Remove the contents of the `dist/` directory.
- `post`: Create a new blog post with a title and filename specified by the `POST_TITLE` and `POST_NAME` environment variables.
- `help`: Show the list of Makefile targets and their descriptions.

### Makefile Comments

- `build`: Generates the website using the `hugo` command.
- `clean`: Removes the contents of the `dist/` directory using the `rm` command.
- `post`: Creates a new blog post using the `hugo new` and `echo` commands.
- `check`: Succeed by default, and fail when presented with a dead link or a badly written Markdown file
- `validate`: Always succeed by default and should print the result on the stdout
- `help`: Shows the list of Makefile targets and their descriptions using the `grep` and `sed` commands.
