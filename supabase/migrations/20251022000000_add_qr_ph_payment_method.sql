/*
  # Add QR PH Payment Method

  1. Changes
    - Add QR PH (QR Philippines) as a new payment method
    - QR PH is a unified QR payment standard in the Philippines
    - Supports InstaPay and PESONet

  2. Details
    - Payment method will be inactive by default
    - Admin can activate it and upload the QR code via the admin dashboard
    - Sort order set to 4 to appear after existing payment methods
*/

-- Insert QR PH payment method
INSERT INTO payment_methods (id, name, account_number, account_name, qr_code_url, sort_order, active) VALUES
  (
    'qr-ph',
    'QR Ph',
    'Scan QR Code to Pay',
    'Cafe Adeia',
    'https://images.pexels.com/photos/8867482/pexels-photo-8867482.jpeg?auto=compress&cs=tinysrgb&w=300&h=300&fit=crop',
    4,
    false
  )
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  account_number = EXCLUDED.account_number,
  account_name = EXCLUDED.account_name,
  sort_order = EXCLUDED.sort_order;

-- Add comment explaining QR PH
COMMENT ON TABLE payment_methods IS 'Payment methods available for checkout. Includes e-wallets, bank transfers, and QR Ph payment standard.';

