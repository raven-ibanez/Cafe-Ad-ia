import React from 'react';
import { Trash2, Plus, Minus, ArrowLeft, ShoppingBag } from 'lucide-react';
import { CartItem } from '../types';

interface CartProps {
  cartItems: CartItem[];
  updateQuantity: (id: string, quantity: number) => void;
  removeFromCart: (id: string) => void;
  clearCart: () => void;
  getTotalPrice: () => number;
  onContinueShopping: () => void;
  onCheckout: () => void;
}

const Cart: React.FC<CartProps> = ({
  cartItems,
  updateQuantity,
  removeFromCart,
  clearCart,
  getTotalPrice,
  onContinueShopping,
  onCheckout
}) => {
  if (cartItems.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12">
        <div className="text-center py-16 bg-cafe-blue text-white rounded-lg shadow-lg">
          <div className="text-6xl mb-4">☕</div>
          <h2 className="text-2xl font-menu font-bold mb-2">Your cart is empty</h2>
          <p className="text-white/80 mb-6">Add some delicious items to get started!</p>
          <button
            onClick={onContinueShopping}
            className="bg-white text-cafe-blue px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-colors duration-200 inline-flex items-center space-x-2"
          >
            <ShoppingBag className="h-4 w-4" />
            <span>Browse Menu</span>
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      {/* Header */}
      <div className="flex items-center justify-between mb-8 bg-cafe-blue text-white p-4 rounded-lg shadow-lg">
        <button
          onClick={onContinueShopping}
          className="flex items-center space-x-2 text-white/80 hover:text-white transition-colors duration-200"
        >
          <ArrowLeft className="h-4 w-4" />
          <span>Continue Shopping</span>
        </button>
        <h1 className="text-2xl font-menu font-bold">Your Cart</h1>
        <button
          onClick={clearCart}
          className="text-red-300 hover:text-red-100 transition-colors duration-200"
        >
          Clear All
        </button>
      </div>

      {/* Cart Items */}
      <div className="bg-white rounded-lg shadow-sm border-2 border-cafe-blue mb-8">
        {cartItems.map((item, index) => (
          <div key={item.id} className={`p-4 ${index !== cartItems.length - 1 ? 'border-b-2 border-cafe-blue' : ''}`}>
            <div className="flex items-center justify-between">
              <div className="flex-1">
                <h3 className="text-lg font-menu font-semibold text-cafe-blue mb-1">{item.name}</h3>
                {item.selectedVariation && (
                  <p className="text-sm text-cafe-muted mb-1">
                    Size: {item.selectedVariation.name}
                  </p>
                )}
                {item.selectedAddOns && item.selectedAddOns.length > 0 && (
                  <p className="text-sm text-cafe-muted mb-1">
                    Add-ons: {item.selectedAddOns.map(addOn => 
                      addOn.quantity && addOn.quantity > 1 
                        ? `${addOn.name} x${addOn.quantity}`
                        : addOn.name
                    ).join(', ')}
                  </p>
                )}
                <p className="text-lg font-bold text-cafe-blue">₱{item.totalPrice} each</p>
              </div>
              
              <div className="flex items-center space-x-4 ml-4">
                <div className="flex items-center space-x-2 bg-cafe-blue/10 border border-cafe-blue rounded p-1">
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity - 1)}
                    className="p-1 hover:bg-cafe-blue/20 rounded transition-colors duration-200 text-cafe-blue"
                  >
                    <Minus className="h-4 w-4" />
                  </button>
                  <span className="font-semibold text-cafe-blue min-w-[24px] text-center">{item.quantity}</span>
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity + 1)}
                    className="p-1 hover:bg-cafe-blue/20 rounded transition-colors duration-200 text-cafe-blue"
                  >
                    <Plus className="h-4 w-4" />
                  </button>
                </div>
                
                <div className="text-right">
                  <p className="text-lg font-bold text-cafe-blue">₱{(item.totalPrice * item.quantity).toFixed(2)}</p>
                </div>
                
                <button
                  onClick={() => removeFromCart(item.id)}
                  className="p-2 text-red-500 hover:text-red-600 hover:bg-red-50 rounded transition-all duration-200"
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Total and Checkout */}
      <div className="bg-cafe-blue text-white rounded-lg shadow-sm p-6">
        <div className="flex items-center justify-between text-2xl font-menu font-bold mb-6">
          <span>Total:</span>
          <span>₱{parseFloat(getTotalPrice() || 0).toFixed(2)}</span>
        </div>
        
        <button
          onClick={onCheckout}
          className="w-full bg-white text-cafe-blue py-3 rounded hover:bg-gray-50 transition-all duration-200 font-menu font-semibold text-lg"
        >
          Proceed to Checkout
        </button>
      </div>
    </div>
  );
};

export default Cart;
