FROM ubuntu:20.04

RUN apt-get -qq update && apt-get -qq install -y gdb curl emacs-nox > /dev/null
RUN curl -Ls https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz | \
    tar -C /usr/local -xz

ENV GOPATH=/go
RUN echo "export GOPATH=/go" >> /root/.bashrc \
    echo "export PATH=/go/bin:/usr/local/go/bin:$PATH" >> /root/.bashrc

RUN mkdir -p /root/.emacs.d/lisp && \
  curl -Lso /root/.emacs.d/lisp/go-mode.el \
    https://raw.githubusercontent.com/dominikh/go-mode.el/master/go-mode.el && \
  curl -Lso /root/.emacs.d/lisp/go-guru.el \
    https://raw.githubusercontent.com/dominikh/go-mode.el/master/go-guru.el && \
  curl -Lso /root/.emacs.d/lisp/go-rename.el \
    https://raw.githubusercontent.com/dominikh/go-mode.el/master/go-rename.el
COPY .emacs /root/.emacs

RUN echo "add-auto-load-safe-path /usr/local/go/src/runtime/runtime-gdb.py" >> \
     /root/.gdbinit
