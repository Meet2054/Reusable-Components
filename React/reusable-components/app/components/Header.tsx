import Image from 'next/image'
import React from 'react'
import Logo from '@/public/Logo.png'

const Header = () => {
  return (
    <div className='w-full px-4 h-[12vh] bg-purple-400 flex flex-row justify-between items-center '>
        <div>
        {/* logo */}
           <Image src={Logo} alt='logo' width={100} height={100} />
        </div>
        {/* navigation */}
            <ul className='flex justify-between items-center w-[22%] h-[70%]  bg-white rounded-full' >
                <li className=' h-auto w-auto p-1 px-4 text-center m-1 hover:bg-purple-500 rounded-full ' >Home</li>
                <li className=' h-auto w-auto p-1 px-4 text-center m-1 hover:bg-purple-500 rounded-full ' >About</li>
                <li className=' h-auto w-auto p-1 px- text-center m-1 hover:bg-purple-500 rounded-full ' >Contact</li>
            </ul>
        <div>
        {/* button */}
        {/* <SignInButton /> */}
            <button className='bg-white p-2 px-6 m-2 rounded-full hover:bg-black hover:text-white' >Sign In</button> 
        </div>
    </div>
  )
}

export default Header