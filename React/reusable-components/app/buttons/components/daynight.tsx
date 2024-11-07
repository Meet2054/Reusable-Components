"use client";
import React, { useState, useEffect } from "react";
import { IoSunny, IoMoonSharp } from "react-icons/io5";
import { motion } from "framer-motion";

interface DayNightToggleProps {
  onToggle?: (isDay: boolean) => void;
}

const DayNightToggle: React.FC<DayNightToggleProps> = ({ onToggle }) => {
  const [isDay, setIsDay] = useState(true);

  // Toggle theme mode
  const toggleTheme = () => {
    const newMode = !isDay;
    setIsDay(newMode);
    document.documentElement.classList.toggle("dark", !newMode);
    if (onToggle) onToggle(newMode);
  };

  useEffect(() => {
    // Set the initial theme based on system preference
    const initialTheme = window.matchMedia("(prefers-color-scheme: dark)").matches;
    setIsDay(!initialTheme);
    document.documentElement.classList.toggle("dark", initialTheme);
  }, []);

  return (
    <button
      onClick={toggleTheme}
      className={`relative flex items-center w-16 h-8 p-1 rounded-full transition-colors duration-500 ${
        isDay ? "bg-yellow-300" : "bg-gray-800"
      }`}
    >
      {/* Sliding icon container */}
      <motion.div
        layout
        transition={{ type: "spring", stiffness: 500, damping: 30 }}
        className={`absolute w-6 h-6 bg-white rounded-full flex items-center justify-center ${
          isDay ? "left-1" : "right-1"
        }`}
      >
        {isDay ? (
          <IoSunny className="text-yellow-500" size={16} />
        ) : (
          <IoMoonSharp className="text-blue-500" size={16} />
        )}
      </motion.div>
    </button>
  );
};

export default DayNightToggle;
