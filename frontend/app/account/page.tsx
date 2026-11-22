
import Link from "next/link";

const menuItems = [
  {
    title: "Personal Information",
    description: "Manage your name, email and contact information.",
    href: "/account/profile",
    icon: "👤",
  },
  {
    title: "Order History",
    description: "View your previous orders and their status.",
    href: "/account/orders",
    icon: "📦",
  },
  {
    title: "Notifications",
    description: "Check updates about your orders and account.",
    href: "/account/notifications",
    icon: "🔔",
  },
  {
    title: "Addresses",
    description: "Manage your delivery addresses.",
    href: "/account/addresses",
    icon: "📍",
  },
];

export default function CustomerPage() {
  return (
    <main className="min-h-screen bg-gray-50 px-4 py-10">
      <div className="mx-auto max-w-6xl">

        {/* Page heading */}
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-gray-900">
            My Account
          </h1>
          <p className="mt-2 text-gray-500">
            Manage your personal information and orders.
          </p>
        </div>

        {/* Customer information */}
        <section className="mb-8 rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
          <div className="flex flex-col gap-5 sm:flex-row sm:items-center">
            <div className="flex h-20 w-20 items-center justify-center rounded-full bg-blue-100 text-3xl font-bold text-blue-600">
              C
            </div>

            <div>
              <h2 className="text-xl font-bold text-gray-900">
                Welcome, Customer!
              </h2>
              <p className="mt-1 text-sm text-gray-500">
                customer@example.com
              </p>
              <span className="mt-3 inline-block rounded-full bg-green-100 px-3 py-1 text-xs font-semibold text-green-700">
                Customer Account
              </span>
            </div>
          </div>
        </section>

        {/* Account menu */}
        <section>
          <h2 className="mb-4 text-xl font-bold text-gray-900">
            Account Management
          </h2>

          <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
            {menuItems.map((item) => (
              <Link
                key={item.title}
                href={item.href}
                className="group flex items-start gap-4 rounded-xl border border-gray-200 bg-white p-6 transition hover:border-blue-400 hover:shadow-md"
              >
                <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg bg-blue-50 text-2xl">
                  {item.icon}
                </div>

                <div className="flex-1">
                  <h3 className="font-semibold text-gray-900 group-hover:text-blue-600">
                    {item.title}
                  </h3>
                  <p className="mt-2 text-sm text-gray-500">
                    {item.description}
                  </p>
                </div>

                <span className="text-xl text-gray-400 group-hover:text-blue-600">
                  →
                </span>
              </Link>
            ))}
          </div>
        </section>

        {/* Back to shopping */}
        <div className="mt-8">
          <Link
            href="/Search"
            className="inline-block rounded-lg bg-blue-600 px-6 py-3 text-sm font-semibold text-white transition hover:bg-blue-700"
          >
            Continue Shopping
          </Link>
        </div>

      </div>
    </main>
  );
}
