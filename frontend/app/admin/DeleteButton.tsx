"use client";

export default function DeleteButton({
  action,
  label = "Xóa",
  className = "",
}: {
  action: () => void | Promise<void>;
  label?: string;
  className?: string;
}) {
  return (
    <form
      action={action}
      onSubmit={(event) => {
        if (!window.confirm("Bạn chắc chắn muốn xóa bản ghi này? Thao tác không thể hoàn tác.")) {
          event.preventDefault();
        }
      }}
    >
      <button
        type="submit"
        className={
          className ||
          "rounded-lg border border-rose-200 px-2.5 py-1.5 text-xs font-semibold text-rose-600 transition hover:bg-rose-50"
        }
      >
        {label}
      </button>
    </form>
  );
}
