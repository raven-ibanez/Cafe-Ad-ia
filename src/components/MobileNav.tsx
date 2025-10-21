import React from 'react';
import { useCategories } from '../hooks/useCategories';

interface MobileNavProps {
  activeCategory: string;
  onCategoryClick: (categoryId: string) => void;
}

const MobileNav: React.FC<MobileNavProps> = ({ activeCategory, onCategoryClick }) => {
  const { categories } = useCategories();

  return (
    <div className="sticky top-16 z-40 bg-cafe-blue/10 border-b-2 border-cafe-blue md:hidden shadow-sm">
      <div className="flex overflow-x-auto scrollbar-hide px-4 py-3 space-x-2">
        {categories.map((category) => (
          <button
            key={category.id}
            onClick={() => onCategoryClick(category.id)}
            className={`flex-shrink-0 flex items-center space-x-1 px-3 py-2 rounded-lg transition-all duration-200 font-semibold ${
              activeCategory === category.id
                ? 'bg-cafe-blue text-white shadow-lg'
                : 'bg-white text-cafe-blue border-2 border-cafe-blue hover:bg-cafe-blue hover:text-white'
            }`}
          >
            <span className="text-sm">{category.icon}</span>
            <span className="text-sm whitespace-nowrap">{category.name}</span>
          </button>
        ))}
      </div>
    </div>
  );
};

export default MobileNav;