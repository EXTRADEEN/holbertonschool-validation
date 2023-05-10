# My Website

## Prerequisites

Before building the website, you must have the following tools installed:

- Go-Hugo
- Make

- Golang in v1.15.*
- NPM v7+ with NodeJS v14.* (stable)
- Python 3 with pip module
- golangci-lint

You must also have the Ananke theme installed in your Hugo site.

## Lifecycle

To build the website, follow these steps:

1. Run `make build` to generate the website from the markdown and configuration
files in the `dist/` directory.
2. To clean up the `dist/` directory, run `make clean`.
3. To create a new blog post with a custom title and filename, run `make post
POST_TITLE="My New Blog Post" POST_NAME="my-new-blog-post"`.
4. To view the website locally, run `hugo server -D`
5. To deploy the website to a hosting provider, run `hugo` to generate the
static files in the `dist/` directory, then upload the contents of that
directory to your hosting provider.

- “lint”: Should fail when the linter catches and error
- “build”: compile the source code of the application to a binary
- “run”: Run the application in background by executing the binary
- “stop”: Stop the application with the command kill XXXXX where XXXXX
   is the Process ID of the application
- “clean”: Stop the application
- “test”: You want to test it to ensure that it behaves as expected
- “help": Print a list of all the goals with a sentence
- “unit-tests": Execute the Golan unit tests
- “integration-tests”: Execute the Golang integration-tests

### Makefile Targets

- `build`: Generate the website from the markdown and
configuration files in the `dist/` directory.
- `clean`: Remove the contents of the `dist/` directory.
- `post`: Create a new blog post with a title and filename specified by the
`POST_TITLE` and `POST_NAME` environment variables.
- `help`: Show the list of Makefile targets and their descriptions.

### Makefile Comments

- `build`: Generates the website using the `hugo` command.
- `clean`: Removes the contents of the `dist/`
            directory using the `rm` command.
- `post`: Creates a new blog post using the `hugo new` and `echo` commands.
- `check`: Succeed by default, and fail when presented with a dead link or
            a badly written Markdown file
- `validate`: Always succeed by default and should
            print the result on the stdout
- `help`: Shows the list of Makefile targets and their descriptions
            using the `grep` and `sed` commands.
