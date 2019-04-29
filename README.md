# @vue/cli 3.0 使用 svg-sprite-loader 加载本地 SVG 文件

[online demo](https://nusr.github.io/vuecli3.0-svg)
[github](https://github.com/nusr/vuecli3.0-svg)

[Vue cli 3.0](https://cli.vuejs.org/) 使用 svg-symbol(svg 雪碧图)，整个 [https://www.iconfont.cn](https://www.iconfont.cn) 的图标库为你所用，加快开发速度.

Vue 脚手架升级 3.0，项目也随之升级。

## 运行

1. 装包 `yarn` or `npm i`
2. 运行 `npm run serve`

## 使用

使用 **svg-symbol** 引入图标

svg 文件会导入到 HTML 文件中，无需使用两张 png 切换

`./src/main.js` 引入 `import "./icons";` 

在 `./src/icons/svg` 文件夹下的 svg 文件会自动导入项目

1. [https://www.iconfont.cn](https://www.iconfont.cn) 下载图标  
2. 下载的 svg 图标放在 `./src/icons/svg` 文件夹下
3. 为了使用当前环境下的颜色，去掉 svg 的 fill 属性
4. 调用 `<svg-icon icon-name="home" class-name="test"></svg-icon>`

## 配置 **svg-sprite-loader**


```js
// ./vue.config.js
'use strict'
const path = require('path')

function resolve(dir) {
    return path.join(__dirname, dir)
}

module.exports = {
    publicPath: process.env.NODE_ENV === "production" ? "/vue-svg" : "/",
    chainWebpack: config => {
        config.module
            .rule('svg')
            .exclude.add(resolve('src/icons'))
            .end()
        config.module
            .rule('icons')
            .test(/\.svg$/)
            .include.add(resolve('src/icons'))
            .end()
            .use('svg-sprite-loader')
            .loader('svg-sprite-loader')
            .options({
                symbolId: 'icon-[name]'
            })
            .end()
    }
};


```

## SVG 组件

> 当前环境的颜色改变，图标颜色也会跟着改变


```html
<!--SvgIcon-->
<template>
  <svg :class="svgClass" aria-hidden="true">
    <use :xlink:href="name"></use>
  </svg>
</template>

<script>
export default {
  name: "SvgIcon",
  props: {
    iconName: {
      // icon 文件名
      type: String,
      required: true
    },
    className: {
      // 样式类
      type: String,
      default: ""
    }
  },
  computed: {
    name() {
      let icon = this.iconName;
      return icon ? `#icon-${icon}` : "";
    },
    svgClass() {
      let className = this.className;
      return className ? `svg-icon ${className}` : "svg-icon";
    }
  }
};
</script>

<style>
.svg-icon {
  width: 1em;
  height: 1em;
  fill: currentColor; /* 关键 */
  overflow: hidden;
}
</style>

```

## props

|props|说明|type|
|-|-|-|
|iconName|svg 文件名，不要加上后缀|string|
|className|图标样式类|string|

## React

[Ant Design](https://ant.design/components/icon-cn/#SVG-%E5%9B%BE%E6%A0%87) 组件库使用了 Svg-Symbol，也提供了对 Svg-Symbol 的支持。
