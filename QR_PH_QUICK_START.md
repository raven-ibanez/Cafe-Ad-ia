# QR Ph Payment - Quick Start Guide 🚀

## 3-Step Setup

### Step 1️⃣: Run the Migration
```bash
# Navigate to your Supabase Dashboard
# Go to SQL Editor
# Copy and paste this file: supabase/migrations/20251022000000_add_qr_ph_payment_method.sql
# Click "Run"
```

OR using Supabase CLI:
```bash
supabase db push
```

---

### Step 2️⃣: Get Your QR Code

#### For GCash:
```
1. Open GCash app
2. Tap "QR" → "Receive via QR"
3. Screenshot your QR code
```

#### For Maya:
```
1. Open Maya app
2. Tap "Scan QR" → "My QR"
3. Screenshot your QR code
```

#### For Banks (BDO, BPI, UnionBank):
```
1. Open bank app
2. Find "QR Ph" section
3. Generate/view your QR code
4. Screenshot it
```

---

### Step 3️⃣: Upload via Admin Dashboard

```
1. Go to: yourdomain.com/admin
   Password: Adeia@Admin!2025

2. Click: "Payment Methods"

3. Find "QR Ph" → Click "Edit" (pencil icon)

4. Fill in:
   ✏️ Account Number: "Scan QR Code to Pay"
   ✏️ Account Name: "Your Name" or "Cafe Adeia"
   
5. Click: "Upload Image" or "Change Image"
   📤 Upload your QR code screenshot
   
6. Check: ✅ "Active Payment Method"

7. Click: 💾 "Save"
```

---

## ✅ You're Done!

### Test Your Setup:

1. Go to your website
2. Add an item to cart
3. Proceed to checkout
4. Select "QR Ph" payment
5. Verify your QR code displays correctly
6. Try scanning it with your e-wallet app

---

## 📸 Visual Guide

### Admin Dashboard Navigation:
```
Login Page
    ↓
Dashboard
    ↓
Payment Methods (from sidebar)
    ↓
QR Ph → Edit
    ↓
Upload QR Code & Fill Details
    ↓
Enable "Active" → Save
```

### Customer Checkout Flow:
```
Add to Cart
    ↓
Checkout
    ↓
Enter Details
    ↓
Select "QR Ph" Payment
    ↓
See QR Code & Details
    ↓
Scan with E-wallet App
    ↓
Pay & Screenshot Receipt
    ↓
Send Order via Messenger
```

---

## 🆘 Troubleshooting

| Problem | Fix |
|---------|-----|
| QR Ph not showing | Make sure you clicked "Active Payment Method" |
| Image won't upload | Use PNG or JPG, keep under 5MB |
| QR code blurry | Take a clearer screenshot, don't zoom in too much |
| Can't scan QR | Test with your own app first, may need new QR |

---

## 💡 Pro Tips

✅ **Use high-quality QR code** - Clear screenshot, not blurry
✅ **Test before going live** - Scan your QR with your own app
✅ **Keep QR updated** - Some banks expire QR codes
✅ **Monitor payments** - Enable notifications in your e-wallet app
✅ **Backup your QR** - Save the image somewhere safe

---

## 📱 Compatible Apps

Your QR Ph code works with:

- ✅ GCash
- ✅ Maya (PayMaya)
- ✅ GrabPay
- ✅ ShopeePay
- ✅ All major Philippine banks (BDO, BPI, Metrobank, UnionBank, etc.)
- ✅ Any InstaPay-enabled app

---

## ⚡ Quick Reference

**Admin URL:** `/admin`
**Admin Password:** `Adeia@Admin!2025`
**Migration File:** `supabase/migrations/20251022000000_add_qr_ph_payment_method.sql`
**Payment Method ID:** `qr-ph`

**Need More Help?**
See: `QR_PH_SETUP_GUIDE.md` for detailed instructions

---

**Total Setup Time:** ~5 minutes ⏱️
**Difficulty:** Easy 😊
**Required:** QR Ph code from your bank/e-wallet

