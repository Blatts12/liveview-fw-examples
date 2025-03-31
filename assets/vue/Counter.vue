<script setup lang="ts">
import { ref, computed } from "vue";
import { useLiveVue } from "live_vue";
import Button from "./Button.vue";

const live = useLiveVue();
const props = defineProps<{ count: number }>();
const emit = defineEmits<{ inc: [{ by: number }] }>();

const base = ref<string>("1");
const multi = ref<string>("1");

const by = computed(() => parseInt(base.value) * parseInt(multi.value));
</script>

<template>
	<div class="p-2">
		<div class="flex items-center gap-2 mb-2">
			<Button @click="emit('inc', { by })" class="grow">+{{ by }}</Button>
			<p class="font-semibold min-w-[4ch] text-center">{{ props.count }}</p>
			<Button @click="live.pushEvent('dec', { by })" class="grow">-{{ by }}</Button>
		</div>

		<label for="base">Base</label>
		<input id="base" type="range" min="1" max="10" v-model="base" class="w-full" />
		<p class="text-right mr-2">{{ base }}</p>


		<label for="multi">Multiplier</label>
		<input id="multi" type="range" min="1" max="10" v-model="multi" class="w-full" />
		<p class="text-right mr-2">{{ multi }}</p>
	</div>
</template>
