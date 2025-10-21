import React from 'react';

const HeroSection: React.FC = () => {
  return (
    <section className="bg-cafe-blue text-white">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-16 text-center">
        <h1 className="text-3xl sm:text-4xl font-display font-bold mb-4 tracking-tight">
          CAFE ADÉIA
        </h1>
        <p className="text-lg text-white/80 mb-8">
          Premium Coffee & Delicious Treats
        </p>
        <div className="w-16 h-1 bg-white mx-auto"></div>
      </div>
    </section>
  );
};

export default HeroSection;
