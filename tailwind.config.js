/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        cafe: {
          // Menu-inspired colors
          blue: '#3333CC',        // Royal blue from menu
          dark: '#333333',        // Dark grey from menu
          light: '#F5F5F5',       // Light grey background
          white: '#FFFFFF',       // Pure white
          // Accent colors
          accent: '#3333CC',      // Same as blue for consistency
          text: '#333333',        // Text color
          muted: '#666666',       // Muted text
        }
      },
          fontFamily: {
            'sans': ['Inter', 'system-ui', 'sans-serif'],
            'menu': ['Inter', 'system-ui', 'sans-serif'],
            'display': ['Inter', 'system-ui', 'sans-serif'], // For headings and titles
          },
      animation: {
        'fade-in': 'fadeIn 0.5s ease-in-out',
        'slide-up': 'slideUp 0.4s ease-out',
        'bounce-gentle': 'bounceGentle 0.6s ease-out',
        'scale-in': 'scaleIn 0.3s ease-out',
        'steam': 'steam 2s ease-in-out infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' }
        },
        slideUp: {
          '0%': { transform: 'translateY(20px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' }
        },
        bounceGentle: {
          '0%, 20%, 50%, 80%, 100%': { transform: 'translateY(0)' },
          '40%': { transform: 'translateY(-4px)' },
          '60%': { transform: 'translateY(-2px)' }
        },
        scaleIn: {
          '0%': { transform: 'scale(0.95)', opacity: '0' },
          '100%': { transform: 'scale(1)', opacity: '1' }
        },
        steam: {
          '0%, 100%': { transform: 'translateY(0) scale(1)', opacity: '0.3' },
          '50%': { transform: 'translateY(-10px) scale(1.1)', opacity: '0.6' }
        }
      },
      backgroundImage: {
        'coffee-gradient': 'linear-gradient(135deg, #3E2723 0%, #5D4037 100%)',
        'cream-gradient': 'linear-gradient(135deg, #FFF8E1 0%, #FFFBF5 100%)',
        'warm-gradient': 'linear-gradient(135deg, #FF8A65 0%, #D4A574 100%)',
      },
    },
  },
  plugins: [],
};