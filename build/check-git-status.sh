#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e

# 检查工作树的状态，如果不干净则提示并中断，需要人工操作之后可继续执行脚本
if test -n "$(git status --porcelain)"
then
  echo 'Unclean working tree. Commit or stash changes first.' >&2
  exit 128;
else
  echo 'Working tree clean.' >&2;
fi
