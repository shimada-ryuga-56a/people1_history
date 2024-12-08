module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [require("daisyui")],
  daisyui: {
    themes: [
      {
        aqua: {
          ...require("daisyui/src/theming/themes")["aqua"],
          accent: '#fffdde'
        },
      },
      "dark", "synthwave"],
    darkTheme: false, // ダークモードをONにする場合は削除
  },
  theme: {
    extend: {},
    fontFamily: {
      body: [
        "DotGothic16"
      ],
    }
  },
}
