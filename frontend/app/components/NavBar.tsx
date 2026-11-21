
import Link from "next/link";
import React from "react";

const NavBar = () => {
  return (
    <nav className="w-full flex items-center justify-between px-8 md:px-16 lg:px-24 py-4 bg-[#45A0F0] text-white shadow-md">
      {/* Website name */}
      <Link
        href="/"
        className="text-2xl font-bold transition duration-300 hover:scale-105"
      >
        ConGears
      </Link>

      {/* Navigation links */}
      <ul className="flex items-center gap-4 md:gap-8 text-base md:text-lg">
        <li>
          <Link
            href="/"
            className="rounded-lg px-4 py-2 transition-colors duration-200 hover:bg-white/20"
          >
            Home
          </Link>
        </li>

        <li>
          <Link
            href="/"
            className="rounded-lg px-4 py-2 transition-colors duration-200 hover:bg-white/20">
            Products
          </Link>
        </li>

        <li>
          <Link
            href="/"
            className="rounded-lg px-4 py-2 transition-colors duration-200 hover:bg-white/20">
            Cart
          </Link>
        </li>

        <li>
          <Link
            href="/"
            className="rounded-lg px-4 py-2 transition-colors duration-200 hover:bg-white/20">
            Cart
          </Link>
        </li>
      </ul>
    </nav>
  );
};

export default NavBar;
