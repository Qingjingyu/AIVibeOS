# AIVibe OS aivibe.json 项目实例配置

## 这份文档解决什么问题

AIVibe OS 现在已经有很多系统级资产了。

但一个真实项目还需要一份“实例配置”，把：

- skills
- profiles
- packs
- bundles
- hooks
- context files

接到同一个项目里。

这份实例配置，建议就叫：

`aivibe.json`

---

## 一、它负责什么

`aivibe.json` 不是用来装业务逻辑的。

它负责：

- 当前项目启用哪些能力
- 当前项目默认上下文文件是什么
- 当前项目默认走哪些 bundles / packs
- 当前项目有哪些 hooks / schedules

---

## 二、推荐字段

```json
{
  "version": "1",
  "project": "example-project",
  "commands": [],
  "skills": [],
  "profiles": [],
  "packs": [],
  "bundles": [],
  "hooks": [],
  "contextFiles": []
}
```

---

## 三、一句话铁规矩

**`aivibe.json` 不是第二套系统，它是把 AIVibe OS 实例化到某个真实项目里的配置入口。**
