
import Link from "next/link";

type MainPageCardProps = {
  name: string;
  image: string;
};

export default function MainPageCard({name, image}: MainPageCardProps) {
  return (
    <Link
      href={`/Search?category=${encodeURIComponent(name)}`}
      className="group rounded-xl border border-gray-200 bg-white p-3 text-center transition duration-300 hover:-translate-y-1 hover:border-[#45A0F0] hover:shadow-lg"
    >
      {/* Category image */}
      <div className="mb-3 aspect-square overflow-hidden rounded-lg bg-gray-100">
        <img
          src={image}
          alt={name}
          className="h-full w-full object-cover transition duration-500 group-hover:scale-110"
        />
      </div>

      {/* Category name */}
      <span className="text-sm font-bold text-gray-700 transition group-hover:text-[#2585D5]">
        {name}
      </span>
    </Link>
  );
}
