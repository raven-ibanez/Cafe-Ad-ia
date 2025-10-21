import React, { useState } from 'react';
import { Plus, Minus, X, ShoppingCart } from 'lucide-react';
import { MenuItem, Variation, AddOn } from '../types';

interface MenuItemCardProps {
  item: MenuItem;
  onAddToCart: (item: MenuItem, quantity?: number, variation?: Variation, addOns?: AddOn[]) => void;
  quantity: number;
  onUpdateQuantity: (id: string, quantity: number) => void;
}

const MenuItemCard: React.FC<MenuItemCardProps> = ({ 
  item, 
  onAddToCart, 
  quantity, 
  onUpdateQuantity 
}) => {
  const [showCustomization, setShowCustomization] = useState(false);
  const [showQuantityPopup, setShowQuantityPopup] = useState(false);
  const [popupQuantity, setPopupQuantity] = useState(1);
  const [customizationQuantity, setCustomizationQuantity] = useState(1);
  const [selectedVariation, setSelectedVariation] = useState<Variation | undefined>(
    item.variations?.[0]
  );
  const [selectedAddOns, setSelectedAddOns] = useState<(AddOn & { quantity: number })[]>([]);

  const calculatePrice = () => {
    // Use effective price (discounted or regular) as base
    let price = item.effectivePrice || item.basePrice;
    if (selectedVariation) {
      price = (item.effectivePrice || item.basePrice) + selectedVariation.price;
    }
    selectedAddOns.forEach(addOn => {
      price += addOn.price * addOn.quantity;
    });
    return price;
  };

  const handleAddToCart = () => {
    if (item.variations?.length || item.addOns?.length) {
      setShowCustomization(true);
    } else {
      setShowQuantityPopup(true);
    }
  };

  const handleQuantityAddToCart = () => {
    onAddToCart(item, popupQuantity);
    setShowQuantityPopup(false);
    setPopupQuantity(1);
  };

  const handleCustomizedAddToCart = () => {
    // Convert selectedAddOns back to regular AddOn array for cart
    const addOnsForCart: AddOn[] = selectedAddOns.flatMap(addOn => 
      Array(addOn.quantity).fill({ ...addOn, quantity: undefined })
    );
    onAddToCart(item, customizationQuantity, selectedVariation, addOnsForCart);
    setShowCustomization(false);
    setSelectedAddOns([]);
    setCustomizationQuantity(1);
  };

  const handleIncrement = () => {
    onUpdateQuantity(item.id, quantity + 1);
  };

  const handleDecrement = () => {
    if (quantity > 0) {
      onUpdateQuantity(item.id, quantity - 1);
    }
  };

  const updateAddOnQuantity = (addOn: AddOn, quantity: number) => {
    setSelectedAddOns(prev => {
      const existingIndex = prev.findIndex(a => a.id === addOn.id);
      
      if (quantity === 0) {
        // Remove add-on if quantity is 0
        return prev.filter(a => a.id !== addOn.id);
      }
      
      if (existingIndex >= 0) {
        // Update existing add-on quantity
        const updated = [...prev];
        updated[existingIndex] = { ...updated[existingIndex], quantity };
        return updated;
      } else {
        // Add new add-on with quantity
        return [...prev, { ...addOn, quantity }];
      }
    });
  };

  const groupedAddOns = item.addOns?.reduce((groups, addOn) => {
    const category = addOn.category;
    if (!groups[category]) {
      groups[category] = [];
    }
    groups[category].push(addOn);
    return groups;
  }, {} as Record<string, AddOn[]>);

  return (
    <>
      <div className={`bg-white rounded-2xl shadow-sm overflow-hidden relative transition-all duration-300 hover:shadow-lg hover:scale-105 ${!item.available ? 'opacity-60' : ''}`}>
        {/* Square Image Container */}
        <div className="relative aspect-square bg-gray-50 overflow-hidden">
          {item.image ? (
            <img
              src={item.image}
              alt={item.name}
              className="w-full h-full object-cover"
              loading="lazy"
              decoding="async"
              onError={(e) => {
                e.currentTarget.style.display = 'none';
                e.currentTarget.nextElementSibling?.classList.remove('hidden');
              }}
            />
          ) : null}
          <div className={`absolute inset-0 flex items-center justify-center ${item.image ? 'hidden' : ''}`}>
            <div className="text-6xl opacity-20 text-cafe-blue">☕</div>
          </div>
          
          {/* Badges */}
          <div className="absolute top-2 left-2 flex flex-col gap-1">
            {item.isOnDiscount && item.discountPrice && (
              <div className="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded">
                SALE
              </div>
            )}
            {item.popular && (
              <div className="bg-cafe-blue text-white text-xs font-bold px-2 py-1 rounded">
                POPULAR
              </div>
            )}
          </div>
          
          {!item.available && (
            <div className="absolute top-2 right-2 bg-red-500 text-white text-xs font-bold px-2 py-1 rounded">
              OUT OF STOCK
            </div>
          )}
        </div>
        
        {/* Content */}
        <div className="p-4 pb-6">
          <h4 className="text-lg font-display font-bold text-cafe-dark mb-1">{item.name}</h4>
          
          {/* Pricing */}
          <div className="mb-4">
            {item.isOnDiscount && item.discountPrice ? (
              <div className="flex items-center space-x-2">
                <span className="text-sm text-cafe-muted">from</span>
                <span className="text-lg font-bold text-cafe-blue">
                  ₱{item.discountPrice.toFixed(2)}
                </span>
                <span className="text-sm text-gray-400 line-through">
                  ₱{item.basePrice.toFixed(2)}
                </span>
              </div>
            ) : (
              <div className="flex items-center space-x-1">
                <span className="text-sm text-cafe-muted">from</span>
                <span className="text-lg font-bold text-cafe-blue">
                  ₱{item.basePrice.toFixed(2)}
                </span>
              </div>
            )}
          </div>
        </div>
        
        {/* Circular Add Button */}
        {!item.available ? (
          <div className="absolute bottom-2 right-2 w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center">
            <span className="text-gray-500 text-lg">×</span>
          </div>
        ) : quantity === 0 ? (
          <button
            onClick={handleAddToCart}
            className="absolute bottom-2 right-2 w-10 h-10 bg-cafe-blue text-white rounded-full flex items-center justify-center hover:bg-cafe-blue/90 transition-colors duration-200 shadow-lg"
          >
            <Plus className="h-5 w-5" />
          </button>
        ) : (
          <div className="absolute bottom-2 right-2 flex items-center space-x-1 bg-white border-2 border-cafe-blue rounded-full p-1 shadow-lg">
            <button
              onClick={handleDecrement}
              className="w-6 h-6 bg-cafe-blue text-white rounded-full flex items-center justify-center hover:bg-cafe-blue/90 transition-colors duration-200"
            >
              <Minus className="h-3 w-3" />
            </button>
            <span className="font-bold text-cafe-blue min-w-[20px] text-center text-sm">{quantity}</span>
            <button
              onClick={handleIncrement}
              className="w-6 h-6 bg-cafe-blue text-white rounded-full flex items-center justify-center hover:bg-cafe-blue/90 transition-colors duration-200"
            >
              <Plus className="h-3 w-3" />
            </button>
          </div>
        )}
      </div>

          {/* Quantity Popup Modal */}
          {showQuantityPopup && (
            <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
              <div className="bg-white rounded-lg max-w-sm w-full shadow-xl">
                <div className="p-6">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="text-lg font-menu font-bold text-cafe-blue">Add to Cart</h3>
                    <button
                      onClick={() => setShowQuantityPopup(false)}
                      className="p-1 hover:bg-gray-100 rounded transition-colors duration-200"
                    >
                      <X className="h-5 w-5 text-cafe-muted" />
                    </button>
                  </div>
                  
                  <div className="mb-6">
                    <h4 className="font-semibold text-cafe-dark mb-2">{item.name}</h4>
                    <p className="text-cafe-muted text-sm mb-4">{item.description}</p>
                    <div className="text-xs text-cafe-muted mb-2">
                      {item.category && (
                        <span className="bg-cafe-blue/10 text-cafe-blue px-2 py-1 rounded">
                          {item.category.replace('-', ' ').toUpperCase()}
                        </span>
                      )}
                    </div>
                    
                    <div className="space-y-4">
                      <div className="flex items-center justify-between">
                        <span className="text-lg font-bold text-cafe-blue">₱{item.effectivePrice || item.basePrice}</span>
                        <span className="text-sm text-cafe-muted">per item</span>
                      </div>
                      
                      <div className="flex items-center justify-center space-x-4">
                        <span className="text-sm font-medium text-cafe-dark">Quantity:</span>
                        <div className="flex items-center space-x-2 bg-cafe-blue/10 border border-cafe-blue rounded p-1">
                          <button
                            onClick={() => setPopupQuantity(Math.max(1, popupQuantity - 1))}
                            className="p-2 hover:bg-cafe-blue/20 rounded transition-colors duration-200 text-cafe-blue"
                          >
                            <Minus className="h-4 w-4" />
                          </button>
                          <span className="font-semibold text-cafe-blue min-w-[32px] text-center text-lg">{popupQuantity}</span>
                          <button
                            onClick={() => setPopupQuantity(popupQuantity + 1)}
                            className="p-2 hover:bg-cafe-blue/20 rounded transition-colors duration-200 text-cafe-blue"
                          >
                            <Plus className="h-4 w-4" />
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div className="flex items-center justify-between text-lg font-bold text-cafe-blue mb-6">
                    <span>Total:</span>
                    <span>₱{((item.effectivePrice || item.basePrice) * popupQuantity).toFixed(2)}</span>
                  </div>
                  
                  <button
                    onClick={handleQuantityAddToCart}
                    className="w-full btn-menu py-3 flex items-center justify-center space-x-2"
                  >
                    <ShoppingCart className="h-5 w-5" />
                    <span>Add to Cart - ₱{((item.effectivePrice || item.basePrice) * popupQuantity).toFixed(2)}</span>
                  </button>
                </div>
              </div>
            </div>
          )}

          {/* Customization Modal */}
          {showCustomization && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-lg max-w-md w-full max-h-[90vh] overflow-y-auto shadow-xl">
            <div className="sticky top-0 bg-cafe-blue text-white p-4 flex items-center justify-between rounded-t-lg">
              <div>
                <h3 className="text-lg font-menu font-bold">Customize {item.name}</h3>
                <p className="text-sm text-white/80 mt-1">Choose your preferences</p>
              </div>
              <button
                onClick={() => setShowCustomization(false)}
                className="p-1 hover:bg-white/20 rounded transition-colors duration-200"
              >
                <X className="h-5 w-5" />
              </button>
            </div>

            <div className="p-6 bg-coffee-cream/20">
              {/* Size Variations */}
              {item.variations && item.variations.length > 0 && (
                <div className="mb-6">
                  <h4 className="font-bold text-coffee-mocha mb-4 flex items-center text-lg font-display">
                    <span className="mr-2">☕</span> Choose Your Size
                  </h4>
                  <div className="space-y-3">
                    {item.variations.map((variation) => (
                      <label
                        key={variation.id}
                        className={`flex items-center justify-between p-4 border-2 rounded-xl cursor-pointer transition-all duration-200 ${
                          selectedVariation?.id === variation.id
                            ? 'border-coffee-mocha bg-coffee-cream shadow-lg'
                            : 'border-coffee-cappuccino hover:border-coffee-mocha hover:bg-white bg-white'
                        }`}
                      >
                        <div className="flex items-center space-x-3">
                          <input
                            type="radio"
                            name="variation"
                            checked={selectedVariation?.id === variation.id}
                            onChange={() => setSelectedVariation(variation)}
                            className="text-coffee-mocha focus:ring-coffee-gold"
                          />
                          <span className="font-semibold text-coffee-dark">{variation.name}</span>
                        </div>
                        <span className="text-coffee-mocha font-bold text-lg">
                          ₱{((item.effectivePrice || item.basePrice) + variation.price).toFixed(2)}
                        </span>
                      </label>
                    ))}
                  </div>
                </div>
              )}

              {/* Add-ons */}
              {groupedAddOns && Object.keys(groupedAddOns).length > 0 && (
                <div className="mb-6">
                  <h4 className="font-bold text-coffee-mocha mb-4 flex items-center text-lg font-display">
                    <span className="mr-2">✨</span> Enhance Your Drink
                  </h4>
                  {Object.entries(groupedAddOns).map(([category, addOns]) => (
                    <div key={category} className="mb-4">
                      <h5 className="text-sm font-semibold text-coffee-latte mb-3 capitalize">
                        {category.replace('-', ' ')}
                      </h5>
                      <div className="space-y-3">
                        {addOns.map((addOn) => (
                          <div
                            key={addOn.id}
                            className="flex items-center justify-between p-4 border-2 border-coffee-cappuccino rounded-xl hover:border-coffee-mocha hover:bg-white transition-all duration-200 bg-white"
                          >
                            <div className="flex-1">
                              <span className="font-semibold text-coffee-dark">{addOn.name}</span>
                              <div className="text-sm text-coffee-latte">
                                {addOn.price > 0 ? `₱${addOn.price.toFixed(2)} each` : '✅ Free'}
                              </div>
                            </div>
                            
                            <div className="flex items-center space-x-2">
                              {selectedAddOns.find(a => a.id === addOn.id) ? (
                                <div className="flex items-center space-x-2 bg-coffee-gold/20 rounded-xl p-1 border-2 border-coffee-gold">
                                  <button
                                    type="button"
                                    onClick={() => {
                                      const current = selectedAddOns.find(a => a.id === addOn.id);
                                      updateAddOnQuantity(addOn, (current?.quantity || 1) - 1);
                                    }}
                                    className="p-1.5 hover:bg-coffee-gold/40 rounded-lg transition-colors duration-200"
                                  >
                                    <Minus className="h-3 w-3 text-coffee-mocha" />
                                  </button>
                                  <span className="font-bold text-coffee-dark min-w-[24px] text-center text-sm">
                                    {selectedAddOns.find(a => a.id === addOn.id)?.quantity || 0}
                                  </span>
                                  <button
                                    type="button"
                                    onClick={() => {
                                      const current = selectedAddOns.find(a => a.id === addOn.id);
                                      updateAddOnQuantity(addOn, (current?.quantity || 0) + 1);
                                    }}
                                    className="p-1.5 hover:bg-coffee-gold/40 rounded-lg transition-colors duration-200"
                                  >
                                    <Plus className="h-3 w-3 text-coffee-mocha" />
                                  </button>
                                </div>
                              ) : (
                                <button
                                  type="button"
                                  onClick={() => updateAddOnQuantity(addOn, 1)}
                                  className="flex items-center space-x-1 px-4 py-2 bg-coffee-gradient text-white rounded-xl hover:shadow-lg transition-all duration-200 text-sm font-semibold"
                                >
                                  <Plus className="h-3 w-3" />
                                  <span>Add</span>
                                </button>
                              )}
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>
                  ))}
                </div>
              )}

              {/* Quantity Selection */}
              <div className="border-t border-gray-200 pt-4 mb-6">
                <div className="flex items-center justify-center space-x-4 mb-4">
                  <span className="text-sm font-medium text-cafe-dark">Quantity:</span>
                  <div className="flex items-center space-x-2 bg-cafe-blue/10 border border-cafe-blue rounded p-1">
                    <button
                      onClick={() => setCustomizationQuantity(Math.max(1, customizationQuantity - 1))}
                      className="p-2 hover:bg-cafe-blue/20 rounded transition-colors duration-200 text-cafe-blue"
                    >
                      <Minus className="h-4 w-4" />
                    </button>
                    <span className="font-semibold text-cafe-blue min-w-[32px] text-center text-lg">{customizationQuantity}</span>
                    <button
                      onClick={() => setCustomizationQuantity(customizationQuantity + 1)}
                      className="p-2 hover:bg-cafe-blue/20 rounded transition-colors duration-200 text-cafe-blue"
                    >
                      <Plus className="h-4 w-4" />
                    </button>
                  </div>
                </div>
              </div>

              {/* Price Summary */}
              <div className="border-t border-gray-200 pt-4 mb-6">
                <div className="flex items-center justify-between text-xl font-bold text-cafe-dark font-menu">
                  <span>Total:</span>
                  <span className="text-cafe-blue">₱{(calculatePrice() * customizationQuantity).toFixed(2)}</span>
                </div>
              </div>

              <button
                onClick={handleCustomizedAddToCart}
                className="w-full btn-menu py-3 flex items-center justify-center space-x-2 text-base"
              >
                <ShoppingCart className="h-5 w-5" />
                <span>Add to Cart - ₱{(calculatePrice() * customizationQuantity).toFixed(2)}</span>
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
};

export default MenuItemCard;