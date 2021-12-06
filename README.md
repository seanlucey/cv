# Sean Lucey's Résumé

This repository contains my Résumé - written and compiled in [LaTex](https://www.latex-project.org/), and published to this GitHub repo via a [GitLab pipeline](https://gitlab.com/seanlucey/resume)!

What began as a fun proof-of-concept has become a super nerdy way to distribute my résumé! I have built a pipeline that allows me to compile this LaTeX document from any computer without needing to rely on a third party service!

For privacy reasons, some personal information is redacted. A full version is available upon request.

[Click Here To View My Resume!](https://github.com/seanlucey/resume/blob/master/resume_cv.pdf)

# Technical Information

This repo is split into two separate 'feature' branches that allows me to target specific functionality with a commit. The desired functionality is defined by the .gitlab-ci.yml, which creates multiple stages that are executed, in order, when code is commited to the repository. Since the end requirements are pretty menial, there are only three stages that needed to be defined:

* **docker_build:**
When a commit is detected to the docker branch, GitLab logs into the GitLab Docker registry using secure CI/CD environment variables, from there, an image is built in the GitLab runner, and pushed to the registry.
* **docker_release:**
Also on the docker branch, after docker_build has been completed the runner then pulls the container image that was just built and tags it as the CONTAINER_RELEASE_IMAGE. This later becomes our latest image.
* **pdf_compile:**
This stage only runs on master branch commits. It utilizes the latest image pushed in the last job, and runs a series of xelatex commands to compile our code. Due to a bug in how artifacts are handled with GitLab, I then need to re-commit the code back to Git - fortunately this is handled automatically, and skips the CI process by including the [skip-ci] block in the commit message.
