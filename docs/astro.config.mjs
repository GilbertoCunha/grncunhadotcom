// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: 'https://grncunha.com',
	base: '/',
	integrations: [
		starlight({
			title: 'grncunha.com',
			social: [
				{
					icon: 'codeberg',
					label: 'Codeberg',
					href: 'https://codeberg.org/grncunha13',
				},
			],
		}),
	],
});
