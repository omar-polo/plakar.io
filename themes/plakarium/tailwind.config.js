console.log("Tailwind config bien chargée ✅");
module.exports = {
    content: [
        './themes/plakarium/layouts/**/*.html',
        './themes/plakarium/content/**/*.md',
        './themes/plakarium/assets/**/*.js',
        './layouts/**/*.html',
        './content/**/*.md',
    ],
    safelist: ['bg-neutral-100'],
    theme: {
        extend: {

            fontFamily: {
                'dm-mono': ['"DM Mono"', 'monospace'],
                'space-text': ['"Space Text"', 'sans-serif'],
                'space-grotesk': ['"Space Grotesk"', 'sans-serif'],
            },
            colors: {
                primary: {
                    50: '#F0F0FF',
                    100: '#DAD9FF',
                    200: '#B3B1FF',
                    300: '#8D88FF',
                    400: '#6760FF',
                    500: '#524CFF', // couleur principale
                    600: '#3D39CC',
                    700: '#2E2C99',
                    800: '#1F1F66',
                    900: '#111133',
                },
                neutral: {
                    50:  '#FFFFFF',
                    100: '#F5F4FB', // fond général clair
                    200: '#E7E6F0',
                    300: '#DCD9E3',
                    400: '#B2B1C7',
                    500: '#9291B0',
                    600: '#6D6C8D',
                    700: '#4F4E66',
                    800: '#2D2C3A',
                    900: '#1C1C1E', // fond section "features"
                },
            },
        },
    },
    plugins: [],
}
