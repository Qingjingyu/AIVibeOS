# AIVibe OS Runtime 回放样本样例

## 样例 1：extractDesignTokens

- Task 名称：`extractDesignTokens`
- 回放时间：示例样本
- provider / model：`openai / gpt-4.1`
- prompt 版本：`extract-design-tokens@v1`

### 回放样本

- 样本 ID：`tokens-sample-001`
- 输入摘要：一组包含颜色、字号、间距、圆角的 Figma 变量描述
- 输出摘要：结构化 token JSON
- 是否通过规则检查：是

### 对比结果

- 与上一轮是否一致：基本一致
- 是否出现退化：无
- 如果退化，主要表现是什么：无

### 结论

- 是否允许继续发布：是
- 需要补什么：增加边界样本和异常命名样本

## 样例 2：generateReleaseSummary

- Task 名称：`generateReleaseSummary`
- 回放时间：示例样本
- provider / model：`anthropic / claude-sonnet`
- prompt 版本：`release-summary@v2`

### 回放样本

- 样本 ID：`release-summary-001`
- 输入摘要：发布内容、风险项、验证结果
- 输出摘要：结构化发布摘要
- 是否通过规则检查：是

### 对比结果

- 与上一轮是否一致：摘要结构一致，措辞略有变化
- 是否出现退化：无明显退化
- 如果退化，主要表现是什么：无

### 结论

- 是否允许继续发布：是
- 需要补什么：增加高风险发布场景样本

## 一句话铁规矩

**回放样本不是为了凑格式，而是让每次修改后都有东西可比。**
