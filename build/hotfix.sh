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
# 生产环境对应的分支
BRANCH_PRODUCTION=master

# 切换到生产分支
git checkout ${BRANCH_PRODUCTION}
# 创建指定上线版本的分支
git checkout -b ${BRANCH_NAME}

# 如果成功，则推送到远程去
git push origin ${BRANCH_NAME}
exit 0;
