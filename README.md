# Cafe Adeia - Online Ordering System

A modern, full-featured cafe ordering system with admin dashboard, built with React, TypeScript, and Supabase.

## Features

### Customer Features
- 🛒 **Online Ordering** - Browse menu, add to cart, customize orders
- 💳 **Multiple Payment Options** - GCash, Maya, Bank Transfer, QR Ph, Cash on Delivery
- 🚚 **Multiple Service Types** - Dine-in, Pickup, Delivery
- 🏷️ **Discounts & Promotions** - Time-based discount pricing
- 📱 **Responsive Design** - Works on mobile, tablet, and desktop
- 🔍 **Category Filtering** - Easy menu navigation

### Admin Features
- 🎯 **Dashboard Overview** - Stats, quick actions, category breakdown
- 📝 **Menu Management** - Add, edit, delete menu items
- 🖼️ **Image Uploads** - Direct upload to Supabase Storage
- 💰 **Discount Pricing** - Set time-based discounts for items
- 🏷️ **Category Management** - Create and manage menu categories
- 💳 **Payment Methods** - Configure payment options with QR codes
- ⚙️ **Site Settings** - Customize site name, logo, description
- ✅ **Bulk Operations** - Bulk delete, bulk category change

## Recent Updates

### ✨ QR Ph Payment Method (October 22, 2025)
- Added QR Ph (QR Philippines) as a payment option
- Fully editable via admin dashboard
- Supports InstaPay and PESONet
- Works with all major Philippine banks and e-wallets
- See `QR_PH_SETUP_GUIDE.md` for detailed setup instructions

## Tech Stack

- **Frontend:** React 18 + TypeScript + Vite
- **Styling:** Tailwind CSS
- **Database:** Supabase (PostgreSQL)
- **Storage:** Supabase Storage (for images)
- **Icons:** Lucide React
- **Deployment:** Vercel

## Getting Started

### Prerequisites
- Node.js 18+ and npm
- Supabase account and project

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd template-web-1-11
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up environment variables**
   Create a `.env` file:
   ```env
   VITE_SUPABASE_URL=your_supabase_url
   VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
   ```

4. **Run database migrations**
   ```bash
   # Using Supabase CLI
   supabase db push
   
   # Or manually via Supabase Dashboard SQL Editor
   # Run each file in supabase/migrations/ in order
   ```

5. **Start development server**
   ```bash
   npm run dev
   ```

6. **Access the application**
   - Customer site: `http://localhost:5173/`
   - Admin dashboard: `http://localhost:5173/admin`
   - Default admin password: `Adeia@Admin!2025`

## Project Structure

```
template-web-1-11/
├── src/
│   ├── components/          # React components
│   │   ├── AdminDashboard.tsx
│   │   ├── Cart.tsx
│   │   ├── CategoryManager.tsx
│   │   ├── Checkout.tsx
│   │   ├── Header.tsx
│   │   ├── Menu.tsx
│   │   ├── PaymentMethodManager.tsx
│   │   └── ...
│   ├── hooks/              # Custom React hooks
│   │   ├── useCart.ts
│   │   ├── useMenu.ts
│   │   ├── usePaymentMethods.ts
│   │   └── ...
│   ├── types/              # TypeScript types
│   │   └── index.ts
│   ├── lib/                # Libraries & configs
│   │   └── supabase.ts
│   └── data/               # Static data
│       └── menuData.ts
├── supabase/
│   └── migrations/         # Database migrations
├── public/                 # Static assets
└── ...
```

## Database Schema

### Main Tables
- `menu_items` - Menu items with pricing, variations, add-ons
- `categories` - Menu categories with icons
- `payment_methods` - Payment options with QR codes
- `site_settings` - Site configuration

## Admin Dashboard

Access at `/admin` with password: `Adeia@Admin!2025`

### Available Sections:
1. **Dashboard** - Overview and statistics
2. **Menu Items** - Manage menu with bulk operations
3. **Categories** - Configure menu categories
4. **Payment Methods** - Set up payment options (including QR Ph)
5. **Site Settings** - Customize site information

### Payment Methods Setup
See `QR_PH_SETUP_GUIDE.md` for instructions on setting up QR Ph and other payment methods.

## Payment Methods

### Supported Payment Options:
- 💚 **GCash** - E-wallet with QR code
- 💙 **Maya (PayMaya)** - E-wallet with QR code
- 🏦 **Bank Transfer** - Direct bank transfer
- 🔗 **QR Ph** - Universal QR payment (NEW!)
- 💵 **Cash on Delivery** - Pay when order arrives

All payment methods (except COD) support QR code display during checkout.

## Deployment

### Deploy to Vercel

1. **Connect your repository to Vercel**
2. **Set environment variables** in Vercel dashboard:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
3. **Deploy** - Vercel will automatically build and deploy

### Build for Production

```bash
npm run build
```

The production-ready files will be in the `dist/` directory.

## Environment Variables

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

## Security Notes

⚠️ **Important Security Considerations:**

1. **Change the default admin password** - The hardcoded password in `AdminDashboard.tsx` should be replaced with proper authentication
2. **Implement proper backend auth** - Current auth is client-side only
3. **Use Row Level Security (RLS)** - Already enabled on Supabase tables
4. **Secure your Supabase keys** - Never commit `.env` files to git

## Documentation

- `QR_PH_SETUP_GUIDE.md` - Comprehensive guide for setting up QR Ph payments
- `QR_PH_SUMMARY.md` - Quick summary of QR Ph implementation
- `REDESIGN_SUMMARY.md` - Previous redesign notes

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Support

For issues or questions:
1. Check the documentation files
2. Review Supabase logs for database issues
3. Check browser console for frontend errors
4. Verify environment variables are set correctly

## License

[Your License Here]

## Credits

Built with ❤️ for Cafe Adeia

---

**Version:** 1.1
**Last Updated:** October 22, 2025
