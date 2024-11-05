"use client"
import React from 'react'
import Button from './components/Button1'
import Heading from './components/Heading'

const page = () => {
    const handleClick = () => {
        alert('Button clicked!');
      };
    
      return (
        <div className='flex flex-col items-center gap-10' >
            <div>
                     <Heading />
            </div>  
        <div className="flex flex-col items-center gap-6 min-h-screen w-full ">
          <Button text="Primary Button" onClick={handleClick} variant="primary" size="md" />
          <Button text="Secondary Button" onClick={handleClick} variant="secondary" size="lg" />
          <Button text="Outline Button" onClick={handleClick} variant="outline" size="sm" />
          <Button text="Disabled Button" onClick={() => {}} disabled />
        </div>
        </div>
      );
    }
export default page