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
  fill: currentColor;
  overflow: hidden;
}
</style>
