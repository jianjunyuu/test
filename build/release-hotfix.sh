#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e

# 获取执行脚本的第一个参数，并创建hotfix分支名
VERSION=$1
if test -z "$VERSION"; then
  echo 'The parameter `version` is required.' >&2;
  exit 128;
fi

BRANCH_NAME="hotfix-$VERSION"

# release分支
BRANCH_RELEASE=release
# 开发环境分支
BRANCH_DEV=dev

git checkout ${BRANCH_NAME}

# 直接创建release分支，如果有报错，则立即停止
git checkout -b ${BRANCH_RELEASE}

# 删除hotfix本地分支，远程分支可不删
git branch -d ${BRANCH_NAME}
exit 0;
