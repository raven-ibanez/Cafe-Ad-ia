# QR Ph Payment Method Setup Guide

## Overview
QR Ph (QR Philippines) is a unified QR payment standard in the Philippines that allows customers to pay using any participating bank or e-wallet app. This guide explains how to set up and manage QR Ph payments in your Cafe Adeia admin dashboard.

## What is QR Ph?
QR Ph is the national QR code standard for instant payments in the Philippines. It supports:
- **InstaPay** - Real-time fund transfers between participating banks and e-wallets
- **PESONet** - Batch electronic fund transfers
- All major banks (BDO, BPI, Metrobank, UnionBank, etc.)
- E-wallets (GCash, Maya, GrabPay, ShopeePay, etc.)

## Prerequisites
1. You need a bank account or e-wallet that supports QR Ph
2. You need to generate your QR Ph code from your bank/e-wallet app
3. Access to the admin dashboard (password: `Adeia@Admin!2025`)

## Database Migration

### Step 1: Run the Migration
The QR Ph payment method has been added via SQL migration. To apply it:

1. **If using Supabase CLI:**
   ```bash
   supabase db push
   ```

2. **If using Supabase Dashboard:**
   - Go to your Supabase project dashboard
   - Navigate to SQL Editor
   - Copy the contents of `supabase/migrations/20251022000000_add_qr_ph_payment_method.sql`
   - Run the SQL query

### Step 2: Verify the Migration
After running the migration, QR Ph should appear in your payment methods table (initially inactive).

## Setting Up QR Ph in Admin Dashboard

### Step 1: Access Admin Dashboard
1. Navigate to your website's admin page: `yourdomain.com/admin` or `localhost:5173/admin`
2. Enter the admin password: `Adeia@Admin!2025`
3. Click "Access Dashboard"

### Step 2: Navigate to Payment Methods
1. On the main dashboard, click **"Payment Methods"** from the Quick Actions menu
2. You should see a list of all payment methods including "QR Ph"

### Step 3: Edit QR Ph Payment Method
1. Find the "QR Ph" payment method in the list
2. Click the **Edit** button (pencil icon)
3. Update the following fields:

   **Payment Method Name:**
   - Default: "QR Ph"
   - You can customize this (e.g., "QR Ph - InstaPay", "Scan to Pay")

   **Method ID:**
   - Fixed: `qr-ph` (cannot be changed)

   **Account Number/Phone:**
   - Enter your account details or instructions
   - Example: "Scan QR Code to Pay"
   - Or: "Account Name: Juan Dela Cruz"

   **Account Name:**
   - Enter the registered name on your QR Ph account
   - Example: "Cafe Adeia" or "Juan Dela Cruz"

   **QR Code Image:**
   - Click "Upload Image" or "Change Image"
   - Upload your QR Ph QR code image (PNG, JPG, or JPEG)
   - The image will be automatically uploaded to Supabase Storage
   - **Important:** Make sure the QR code is clear and scannable

   **Sort Order:**
   - Default: 4
   - Lower numbers appear first in checkout
   - Adjust if you want QR Ph to appear in a different position

   **Active Payment Method:**
   - Check this box to enable QR Ph payments
   - Leave unchecked to hide it from customers

4. Click **"Save"** to apply changes

## Generating Your QR Ph Code

### For GCash Users:
1. Open GCash app
2. Tap "QR" at the bottom
3. Tap "Receive via QR"
4. Take a screenshot of your QR code
5. Upload this screenshot to the admin dashboard

### For Maya Users:
1. Open Maya app
2. Tap "Scan QR"
3. Tap "My QR"
4. Take a screenshot of your QR code
5. Upload this screenshot to the admin dashboard

### For Bank Users (BDO, BPI, UnionBank, etc.):
1. Open your bank's mobile app
2. Navigate to "QR Ph" or "QR Code" section
3. Select "Generate QR" or "My QR"
4. Take a screenshot of your QR code
5. Upload this screenshot to the admin dashboard

### For InstaPay QR:
1. Ask your bank to generate an InstaPay QR code
2. This QR code works across all banks and e-wallets
3. Save the QR code image
4. Upload to the admin dashboard

## How Customers Use QR Ph

Once you've set up QR Ph:

1. **Customer adds items to cart** and proceeds to checkout
2. **Customer enters their details** (name, contact, delivery address)
3. **Customer proceeds to payment** and sees payment options
4. **Customer selects "QR Ph"** as their payment method
5. **QR code is displayed** with your account details
6. **Customer scans the QR code** using their bank/e-wallet app
7. **Customer completes payment** and takes a screenshot
8. **Customer places order via Messenger** and attaches payment proof

## Payment Flow Example

```
┌─────────────────────┐
│   Customer Cart     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Enter Details      │
│  (Name, Address)    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Select Payment     │
│  Choose: QR Ph      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Display QR Code    │
│  Account: Cafe      │
│  [QR CODE IMAGE]    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Customer Scans QR  │
│  Pays via App       │
│  Takes Screenshot   │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Send via Messenger │
│  Attach Receipt     │
│  Order Confirmed    │
└─────────────────────┘
```

## Testing QR Ph Payment

### Test Checklist:
- [ ] QR Ph appears in payment methods list
- [ ] QR Ph is marked as "Active"
- [ ] QR code image displays correctly in checkout
- [ ] Account name shows correctly
- [ ] Account details show correctly
- [ ] QR code is scannable with a real app
- [ ] Payment instructions are clear
- [ ] Messenger order includes QR Ph payment info

### Test Payment:
1. Add a test item to cart
2. Proceed through checkout
3. Select QR Ph as payment method
4. Verify QR code displays properly
5. Try scanning with your own e-wallet app
6. Complete the order flow

## Managing Multiple Payment Methods

You can have multiple payment methods active at the same time:
- ✅ GCash (e-wallet)
- ✅ Maya (e-wallet)
- ✅ Bank Transfer (traditional)
- ✅ QR Ph (unified QR)
- ✅ Cash on Delivery

### Recommended Setup:
1. **Keep QR Ph active** - Most convenient for customers
2. **Keep Cash on Delivery** - For customers who prefer cash
3. **Keep one e-wallet** - As alternative to QR Ph
4. **Optional: Bank Transfer** - For large orders

## Troubleshooting

### QR Ph doesn't appear in checkout
**Solution:**
- Check if "Active Payment Method" is enabled in admin
- Verify the migration was run successfully
- Clear browser cache and refresh

### QR code image not showing
**Solution:**
- Check if image uploaded successfully
- Verify image format (PNG, JPG, JPEG only)
- Try uploading a smaller image (< 5MB)
- Check Supabase Storage permissions

### QR code is blurry
**Solution:**
- Take a higher resolution screenshot
- Ensure QR code fills most of the image
- Avoid taking photos of screen - use screenshot instead

### Customers can't scan QR code
**Solution:**
- Verify QR code is valid by testing yourself
- Ensure QR code is not expired (some banks expire QR codes)
- Generate a new QR code from your bank/e-wallet
- Make sure QR code image is not compressed too much

### Payment verification issues
**Solution:**
- Ask customers to include reference number in Messenger
- Request clear screenshot of payment confirmation
- Check payment received in your bank/e-wallet app
- Keep transaction history for reconciliation

## Security Best Practices

1. **Never share your QR code publicly** outside of the checkout process
2. **Monitor your transactions** regularly through your bank/e-wallet app
3. **Keep your admin password secure** - Change it from default
4. **Verify payments** before fulfilling orders
5. **Screenshot all transactions** for your records
6. **Enable transaction notifications** on your bank/e-wallet app

## Benefits of QR Ph

✅ **Universal** - Works with all major banks and e-wallets
✅ **Instant** - Real-time payments via InstaPay
✅ **Secure** - Bank-grade encryption
✅ **Convenient** - One QR code for all payment apps
✅ **Transparent** - Clear payment trail
✅ **Free or Low Cost** - Most banks offer free QR Ph transactions

## Support

If you encounter any issues:
1. Check this guide for troubleshooting steps
2. Verify your QR code is valid by testing it yourself
3. Contact your bank's support for QR Ph specific issues
4. Check Supabase dashboard for database/storage issues

## Additional Resources

- **BSP QR Ph Info:** https://www.bsp.gov.ph/
- **GCash Support:** https://help.gcash.com/
- **Maya Support:** https://help.maya.ph/
- **BDO Digital Banking:** https://www.bdo.com.ph/personal/digital-banking
- **BPI Online:** https://www.bpi.com.ph/bank/online-banking
- **UnionBank Online:** https://www.unionbankph.com/online-banking

## Version History

- **v1.0** (October 22, 2025) - Initial QR Ph payment method implementation
  - Added QR Ph to payment methods table
  - Integrated with existing checkout flow
  - Full admin dashboard support for editing
  - Automatic QR code display in checkout

---

**Note:** This payment method integrates seamlessly with your existing payment system. All payment verifications are done via Messenger screenshots as per your current workflow.

