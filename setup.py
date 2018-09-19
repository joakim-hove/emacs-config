#!/usr/bin/env python
import os
import subprocess
import contextlib

HOME = os.environ["HOME"]
local_emacs_dir = ".emacs.d"
dot_spacemacs = ".spacemacs"
spacemacs_url = "https://github.com/syl20bnr/spacemacs"

@contextlib.contextmanager
def pushd(path):
    cwd0 = os.getcwd()
    os.chdir(path)

    yield

    os.chdir(cwd0)



def clone_spacemacs():
    with pushd(HOME):
        if os.path.exists(local_emacs_dir):
            raise Exception("Sorry - old .emacs.d directory already exists")

        subprocess.call(["git", "clone", spacemacs_url, local_emacs_dir])


def link_spacemacs():
    cwd = os.getcwd()
    with pushd(HOME):
        if os.path.exists(dot_spacemacs):
            os.unlink(dot_spacemacs)

        link = dot_spacemacs
        target = os.path.join(cwd, "spacemacs")
        print("Linking {link} -> {target}".format(link=link, target=target))
        os.symlink(target, dot_spacemacs)



def main():
    clone_spacemacs()
    link_spacemacs()


if __name__ == "__main__":
    main()
