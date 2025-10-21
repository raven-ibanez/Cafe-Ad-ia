import React from 'react';
import { ShoppingCart, Coffee } from 'lucide-react';
import { useSiteSettings } from '../hooks/useSiteSettings';

interface HeaderProps {
  cartItemsCount: number;
  onCartClick: () => void;
  onMenuClick: () => void;
}

const Header: React.FC<HeaderProps> = ({ cartItemsCount, onCartClick, onMenuClick }) => {
  const { siteSettings, loading } = useSiteSettings();

  return (
    <header className="sticky top-0 z-50 bg-cafe-blue border-b-4 border-cafe-blue shadow-lg">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo and Brand */}
          <button 
            onClick={onMenuClick}
            className="flex items-center space-x-3 text-white hover:text-gray-200 transition-colors duration-200"
          >
            {loading ? (
              <div className="w-10 h-10 bg-white/20 rounded animate-pulse" />
            ) : (
              <div className="relative">
                <img 
                  src={siteSettings?.site_logo || "/logo.jpg"} 
                  alt={siteSettings?.site_name || "CAFE ADÉIA"}
                  className="w-10 h-10 rounded object-cover border-2 border-white"
                  onError={(e) => {
                    e.currentTarget.style.display = 'none';
                    e.currentTarget.nextElementSibling?.classList.remove('hidden');
                  }}
                />
                <div className="hidden w-10 h-10 rounded bg-white flex items-center justify-center border-2 border-white">
                  <Coffee className="w-5 h-5 text-cafe-blue" />
                </div>
              </div>
            )}
            <div className="flex flex-col">
              <h1 className="text-2xl font-menu font-bold text-white">
                {loading ? (
                  <div className="w-32 h-6 bg-white/20 rounded animate-pulse" />
                ) : (
                  "CAFE ADÉIA"
                )}
              </h1>
              <p className="text-xs text-white/80 font-normal hidden sm:block">
                est. 2025
              </p>
            </div>
          </button>

          {/* Cart Button */}
          <div className="flex items-center space-x-4">
            <button 
              onClick={onCartClick}
              className="relative p-3 bg-white/10 hover:bg-white/20 text-white rounded-lg transition-colors duration-200"
            >
              <ShoppingCart className="h-6 w-6" />
              {cartItemsCount > 0 && (
                <span className="absolute -top-1 -right-1 bg-red-500 text-white text-xs font-bold rounded-full h-6 w-6 flex items-center justify-center shadow-lg">
                  {cartItemsCount > 99 ? '99+' : cartItemsCount}
                </span>
              )}
            </button>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;