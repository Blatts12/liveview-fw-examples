<script setup lang="ts">
import type { ButtonHTMLAttributes } from "vue";

interface ButtonProps extends /* @vue-ignore */ ButtonHTMLAttributes {}

const { class: className, ...props } = defineProps<ButtonProps>();
</script>

<template>
  <button
    :class="[
      'px-4 py-2 uppercase font-semibold bg-black hover:bg-black/80 cursor-pointer text-white rounded-md',
      className,
    ]"
    v-bind="props"
  >
    <slot></slot>
  </button>
</template>