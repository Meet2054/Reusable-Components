import React from 'react';
import Image from 'next/image';
import Logo from '@/public/Logo.png';
import { Twitter, Instagram, Github } from 'lucide-react';

const Footer = () => {
  return (
    <div className='w-full h-[10vh] bottom-0 flex flex-col items-center justify-center gap-4'>
      <hr className="w-[95%] border-2 border-gray-500 rounded-full" />
      <div className='w-[95%] h-[60%] flex flex-row justify-between items-center'>
        {/* Left Section */}
        <div className='flex flex-row gap-4 items-center'>
          <a href="#" className="text-gray-800 hover:text-gray-600 transition-colors">
            <h1>Privacy Policy</h1>
          </a>
          <a href="#" className="text-gray-800 hover:text-gray-600 transition-colors">
            <h1>Subscribe to our newsletter</h1>
          </a>
        </div>
        
        {/* Center Section (Logo) */}
        <div className='flex-1 flex justify-center -ml-32 '>
          <Image src={Logo} alt='logo' width={100} height={100} className='' />
        </div>
        
        {/* Right Section (Social Media Icons) */}
        <div className="flex items-center gap-6">
          <a href="#" className="text-gray-800 hover:text-gray-600 transition-colors">
            <Twitter className="w-6 h-6" />
          </a>
          <a href="#" className="text-gray-800 hover:text-gray-600 transition-colors">
            <Instagram className="w-6 h-6" />
          </a>
          <a href="#" className="text-gray-800 hover:text-gray-600 transition-colors">
            <Github className="w-6 h-6" />
          </a>
        </div>
      </div>
    </div>
  );
};

export default Footer;
