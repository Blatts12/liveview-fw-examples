export function Button({ children, className, ...props }) {
  return (
    <button
      className={`px-4 py-2 uppercase font-semibold bg-black hover:bg-black/80 cursor-pointer text-white rounded-md ${className}`}
      {...props}
    >
      {children}
    </button>
  );
}
