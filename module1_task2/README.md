"## Prerequisites"

Before building the website, you must have the following tools installed:

Go-Hugo
Make
You must also have the ananke theme installed in your Hugo site.

"## Lifecycle"

To build the website, follow these steps:

Run make build to generate the website from the markdown and configuration files in the dist/ directory.
To clean up the dist/ directory, run make clean.
To create a new blog post with a custom title and filename, run make post POST_TITLE="My New Blog Post" POST_NAME="my-new-blog-post".
To view the website locally, run hugo server -D and visit http://localhost:1313 in your web browser.
To deploy the website to a hosting provider, run hugo to generate the static files in the dist/ directory, then upload the contents of that directory to your hosting provider.

Makefile Targets

build: Generate the website from the markdown and configuration files in the dist/ directory.
clean: Cleanup the content of the dist/ directory.
post: Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
help: Show this help usage.
To view the help usage, run make help.

Makefile Comments

build: Generate the website using the hugo command.
clean: Cleanup the dist/ directory using the hugo --cleanDestinationDir command.
post: Create a new blog post using the hugo new and echo commands.
help: Show the list of Makefile targets and their descriptions.
