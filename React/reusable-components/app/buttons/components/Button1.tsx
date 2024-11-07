// components/Button.js
import React from 'react';

const Button: React.FC<{ text: string; onClick: (event: React.MouseEvent<HTMLButtonElement>) => void; type?: 'button' | 'submit' | 'reset'; size?: 'sm' | 'md' | 'lg'; variant?: 'primary' | 'secondary' | 'outline'; disabled?: boolean }> = ({ text, onClick, type = 'button', size = 'md', variant = 'primary', disabled = false }, ) => {
  const baseStyles = "rounded-lg font-semibold focus:outline-none transition duration-300 ease-in-out";
  
  const sizeStyles = {
    sm: "px-4 py-2 text-sm",
    md: "px-6 py-3",
    lg: "px-8 py-4 text-lg",
  };

  const variantStyles = {
    primary: "bg-blue-500 text-white hover:bg-blue-600",
    secondary: "bg-gray-500 text-white hover:bg-gray-600",
    outline: "border border-blue-500 text-blue-500 hover:bg-blue-50",
    glowing: "bg-gradient-to-r from-yellow-400 to-yellow-600 text-white hover:from-yellow-500 hover:to-yellow-700",
  };

  return (
    <button
      type={type}
      onClick={onClick}
      disabled={disabled}
      className={`${baseStyles} ${sizeStyles[size]} ${variantStyles[variant]} ${
        disabled ? 'opacity-50 cursor-not-allowed' : ''
      }`}
    >
      {text}
    </button>
  );
};

export default Button;
