
import Link from "next/link";

export default function Footer() {
  return (
    <footer className="w-full bg-[#3F3F3F] text-white">
      <div className=" px-8 md:px-16 lg:px-24 py-6 md:flex md:items-center md:justify-between">

        <span className="text-sm text-gray-300 sm:text-center">
          © 2026{" "}
          <Link href="/" className="font-semibold text-white hover:text-[#45A0F0] transition-colors">
            ConGears
          </Link>
          . All Rights Reserved.
        </span>

        <ul className="flex flex-wrap items-center gap-5 mt-4 text-sm font-medium text-gray-300 md:mt-0">
          <li>
            <Link href="/about" className="hover:text-white transition-colors">
              About
            </Link>
          </li>

          <li>
            <Link href="/privacy" className="hover:text-white transition-colors">
              Privacy Policy
            </Link>
          </li>

          <li>
            <Link href="/licensing" className="hover:text-white transition-colors">
              Licensing
            </Link>
          </li>

          <li>
            <Link href="/contact" className="hover:text-white transition-colors">
              Contact
            </Link>
          </li>
        </ul>

      </div>
    </footer>
  );
}
