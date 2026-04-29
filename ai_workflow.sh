#!/bin/bash
# AI Coding Workflow 快捷脚本集
# 适用于 OpenClaw / Hermes Agent 工作流

# 检查环境
check_env() {
    echo "📋 环境检查..."
    command -v python3 >/dev/null 2>&1 && echo "✅ Python3: $(python3 --version)" || echo "❌ Python3 not found"
    command -v git >/dev/null 2>&1 && echo "✅ Git: $(git --version)" || echo "❌ Git not found"
}

# 初始化项目 AI 环境
init_project() {
    local project_name=$1
    echo "🚀 初始化项目: $project_name"
    mkdir -p "$project_name"
    cd "$project_name"
    git init
    echo "# $project_name" > README.md
    echo "✅ 项目初始化完成"
}

# AI 辅助代码审查
ai_review() {
    echo "🔍 AI 辅助代码审查..."
    if [ -z "$1" ]; then
        echo "用法: ai_review <file>"
        return 1
    fi
    # 整合 Hermes Agent / OpenClaw 进行审查
    echo "📝 审查文件: $1"
}

# 快速提交并生成提交信息
ai_commit() {
    echo "📦 AI 生成提交信息..."
    changes=$(git diff --staged --stat)
    echo "变更: $changes"
    # 提示用户确认或让 AI 自动生成
}

check_env
echo ""
echo "💡 使用示例:"
echo "   ./ai_workflow.sh init my-project"
echo "   ./ai_workflow.sh review src/main.py"
echo "   ./ai_workflow.sh commit"
