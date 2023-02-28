import { defineConfig } from 'astro/config';
import compress from 'astro-compress';

// https://astro.build/config
export default defineConfig({
  markdown: {
    shikiConfig: {
      // Choose from Shiki's built-in themes (or add your own)
      // https://github.com/shikijs/shiki/blob/main/docs/themes.md
      theme: 'nord',
      // Add custom languages
      // Note: Shiki has countless langs built-in, including .astro!
      // https://github.com/shikijs/shiki/blob/main/docs/languages.md
      langs: ['c', 'js', 'ts'],
      // Enable word wrap to prevent horizontal scrolling
      wrap: false
    }
  },
  integrations: [compress()]
});
