import React from 'react';
import { useCategories } from '../hooks/useCategories';

interface SubNavProps {
  selectedCategory: string;
  onCategoryClick: (categoryId: string) => void;
}

const SubNav: React.FC<SubNavProps> = ({ selectedCategory, onCategoryClick }) => {
  const { categories, loading } = useCategories();

  return (
    <div className="sticky top-16 z-40 bg-white border-b border-gray-200">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center space-x-1 overflow-x-auto py-3 scrollbar-hide">
          {loading ? (
            <div className="flex space-x-1">
              {[1,2,3,4,5].map(i => (
                <div key={i} className="h-8 w-16 bg-gray-200 rounded animate-pulse" />
              ))}
            </div>
          ) : (
            <>
              <button
                onClick={() => onCategoryClick('all')}
                className={`px-3 py-2 text-sm font-medium transition-colors duration-200 whitespace-nowrap ${
                  selectedCategory === 'all'
                    ? 'text-cafe-blue border-b-2 border-cafe-blue'
                    : 'text-cafe-muted hover:text-cafe-blue'
                }`}
              >
                All
              </button>
              {categories.map((c) => (
                <button
                  key={c.id}
                  onClick={() => onCategoryClick(c.id)}
                  className={`px-3 py-2 text-sm font-medium transition-colors duration-200 flex items-center space-x-1 whitespace-nowrap ${
                    selectedCategory === c.id
                      ? 'text-cafe-blue border-b-2 border-cafe-blue'
                      : 'text-cafe-muted hover:text-cafe-blue'
                  }`}
                >
                  <span className="text-xs">{c.icon}</span>
                  <span>{c.name}</span>
                </button>
              ))}
            </>
          )}
        </div>
      </div>
    </div>
  );
};

export default SubNav;


