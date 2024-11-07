import React, { useState } from "react";
import { motion } from "framer-motion";

interface AnimatedButtonProps {
  label: string;
  onComplete?: () => void;
  loadingTime?: number;
}

const AnimatedButton: React.FC<AnimatedButtonProps> = ({
  label,
  onComplete,
  loadingTime = 3000,
}) => {
  const [isLoading, setIsLoading] = useState(false);
  const [isCompleted, setIsCompleted] = useState(false);

  const handleClick = () => {
    if (isLoading) return;

    setIsLoading(true);
    setIsCompleted(false);

    // Simulate loading time
    setTimeout(() => {
      setIsLoading(false);
      setIsCompleted(true);
      if (onComplete) onComplete();
    }, loadingTime);
  };

  return (
    <motion.button
      onClick={handleClick}
      className={`relative px-6 py-3 font-bold text-white rounded-lg transition-all duration-300 overflow-hidden ${
        isLoading ? "bg-blue-500 cursor-not-allowed" : "bg-blue-600 hover:bg-blue-700"
      }`}
      disabled={isLoading}
      whileTap={{ scale: 0.95 }}
    >
      {isCompleted ? (
        <motion.span
          initial={{ opacity: 0, scale: 0.5 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.4 }}
          className="text-green-400"
        >
          ✓
        </motion.span>
      ) : (
        <>
          {isLoading ? (
            <div className="flex items-center">
              <motion.span
                className="inline-block w-5 h-5 mr-2 border-4 border-white border-t-transparent rounded-full"
                animate={{ rotate: 360 }}
                transition={{ repeat: Infinity, duration: 0.8, ease: "linear" }}
              ></motion.span>
              Loading...
            </div>
          ) : (
            label
          )}
        </>
      )}
      
      {/* Animated Progress Bar */}
      <motion.span
        className={`absolute bottom-0 left-0 h-full w-full bg-blue-400 ${
          isLoading ? "rounded-lg" : ""
        }`}
        initial={{ scaleX: 0 }}
        animate={{ scaleX: isLoading ? 1 : 0 }}
        transition={{ duration: loadingTime / 1000, ease: "easeInOut" }}
        style={{ transformOrigin: "left" }}
      ></motion.span>
    </motion.button>
  );
};

export default AnimatedButton;
