#!/bin/bash

# 优化版stroke2path脚本
# 基于 https://github.com/reakuragho/jetbrains-product-icons

# 获取脚本所在目录的绝对路径
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ICONS_PRE_DIR="$SCRIPT_DIR"
ICONS_DIR="$(dirname "$SCRIPT_DIR")/icons"

# 确保icons目录存在
mkdir -p "$ICONS_DIR"

echo "🔄 Converting SVG stroke to path..."
echo "📁 Working directory: $ICONS_PRE_DIR"
echo "📁 Output directory: $ICONS_DIR"

# 切换到icons-pre目录
cd "$ICONS_PRE_DIR"

# 清理SVG文件的函数
clean_svg() {
    local file="$1"
    echo "   🧹 Cleaning $file..."

    # 使用Python进行精确清理
    python3 -c "
import re

with open('$file', 'r') as f:
    content = f.read()

# 删除XML声明
content = re.sub(r'<\?xml[^>]*\?>\n?', '', content)

# 删除不需要的元素
content = re.sub(r'<defs[^>]*>.*?</defs>', '', content, flags=re.DOTALL)
content = re.sub(r'<defs[^/>]*/>[\s]*', '', content)
content = re.sub(r'<sodipodi:namedview[^>]*/?>', '', content, flags=re.DOTALL)

# 删除不需要的命名空间和属性
content = re.sub(r'\s*xmlns:inkscape=\"[^\"]*\"', '', content)
content = re.sub(r'\s*xmlns:sodipodi=\"[^\"]*\"', '', content)
content = re.sub(r'\s*xmlns:svg=\"[^\"]*\"', '', content)
content = re.sub(r'\s*sodipodi:[^=]*=\"[^\"]*\"', '', content)
content = re.sub(r'\s*inkscape:[^=]*=\"[^\"]*\"', '', content)
content = re.sub(r'\s*id=\"[^\"]*\"', '', content)
content = re.sub(r'\s*version=\"[^\"]*\"', '', content)

# 处理填充属性
content = re.sub(r'style=\"[^\"]*\"', 'fill=\"currentColor\"', content)
content = re.sub(r'fill=\"#[^\"]*\"', 'fill=\"currentColor\"', content)
content = re.sub(r'fill=\"none\"', 'fill=\"currentColor\"', content)

# 移除stroke属性
content = re.sub(r'\s*stroke=\"[^\"]*\"', '', content)

# 规范化格式
content = re.sub(r'\n\s*\n+', '\n', content)  # 删除多余空行
content = re.sub(r'>\s*\n\s*<', '>\n<', content)  # 规范化标签间换行
content = content.strip()

with open('$file', 'w') as f:
    f.write(content)
"
}

for i in *.svg
do
    echo "Processing $i..."

    # 检查原文件是否存在
    if [ ! -f "$i" ]; then
        echo "❌ File $i not found, skipping..."
        continue
    fi

    # 使用inkscape将stroke转换为path，直接输出到icons目录
    if inkscape --actions="select-all;selection-ungroup;select-all;selection-ungroup;select-all;object-stroke-to-path;" --export-filename="$ICONS_DIR/$i" "$i" 2>/dev/null; then
        echo "✅ Successfully converted $i"

        # 自动清理生成的SVG文件
        clean_svg "$ICONS_DIR/$i"
        echo "   ✨ Cleaned $i"
    else
        echo "❌ Error processing $i with inkscape"
    fi
done

echo ""
echo "🎉 Conversion complete!"
echo "📁 Check the $ICONS_DIR directory for converted files"
echo "✨ SVG files have been automatically cleaned:"
echo "   - Removed inkscape metadata (defs, namedview elements)"
echo "   - Set fill=\"currentColor\" on all elements"
echo "   - Removed sodipodi and inkscape namespaces"
echo "   - Cleaned up IDs and version attributes"
echo ""
echo "🚀 Ready to run 'npm run updateFont' to generate the font"
