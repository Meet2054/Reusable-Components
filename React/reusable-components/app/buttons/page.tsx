"use client"
import React from 'react'
import Button from './components/Button1'
import Heading from './components/Heading'
import AnimatedButton from './components/AnimatedButton'
import DayNightToggle from './components/daynight'

const page = () => {
    const handleClick = () => {
        alert('Button clicked!');
      };
    
      const handleComplete = () => {
        alert("Download complete!");
      };
    

      return (
        <div className='flex flex-col items-center gap-10' >
            <div>
                     <Heading />
            </div> 
        <div className='grid grid-cols-4 gap-16 ' >
          <div className="flex flex-col items-center gap-6 min-h-screen w-full ">
            <h1 className='text-2xl font-lato font-medium '> Basic Button  </h1>
            <Button text="Primary Button" onClick={handleClick} variant="primary" size="md" />
            <Button text="Secondary Button" onClick={handleClick} variant="secondary" size="lg" />
            <Button text="Outline Button" onClick={handleClick} variant="outline" size="sm" />
            <Button text="Disabled Button" onClick={() => {}} disabled />
          </div>
          <div className="flex flex-col items-center gap-6 min-h-screen w-full ">
          <h1 className='text-2xl font-caveat font-medium '>Designed Button</h1>
          <AnimatedButton label="Download" onComplete={handleComplete} loadingTime={3000} />
          <DayNightToggle onToggle={(isDay) => console.log(`Day mode: ${isDay}`)} />
            <Button text="Outline Button" onClick={handleClick} variant="outline" size="sm" />
            <Button text="Disabled Button" onClick={() => {}} disabled />
          </div>
          <div className="flex flex-col items-center gap-6 min-h-screen w-full ">
            <Button text="Primary Button" onClick={handleClick} variant="primary" size="md" />
            <Button text="Secondary Button" onClick={handleClick} variant="secondary" size="lg" />
            <Button text="Outline Button" onClick={handleClick} variant="outline" size="sm" />
            <Button text="Disabled Button" onClick={() => {}} disabled />
          </div>
          <div className="flex flex-col items-center gap-6 min-h-screen w-full ">
            <Button text="Primary Button" onClick={handleClick} variant="primary" size="md" />
            <Button text="Secondary Button" onClick={handleClick} variant="secondary" size="lg" />
            <Button text="Outline Button" onClick={handleClick} variant="outline" size="sm" />
            <Button text="Disabled Button" onClick={() => {}} disabled />
          </div>
        </div> 
        </div>
      );
    }
export default page