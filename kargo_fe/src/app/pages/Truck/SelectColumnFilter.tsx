import * as React from 'react';

// export function SelectColumnFilter({
//   column: { filterValue, setFilter, preFilteredRows, id, render },
// }) {
//   // Calculate the options for filtering
//   // using the preFilteredRows
//   const options = React.useMemo(() => {
//     const options = new Set();
//     preFilteredRows.forEach(row => {
//       options.add(row.values[id]);
//     });
//     return options.values();
//   }, [id, preFilteredRows]);

//   // Render a multi-select box
//   return (
//     <label className="flex gap-x-2 items-baseline">
//       <span className="text-gray-700">{render('Header')}: </span>
//       <select
//         className="rounded-md border-gray-300 shadow-sm focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50"
//         name={id}
//         id={id}
//         value={filterValue}
//         onChange={e => {
//           setFilter(e.target.value || undefined);
//         }}
//       >
//         <option value="">All</option>
//         {options.map((option, i) => (
//           <option key={i} value={option}>
//             {option}
//           </option>
//         ))}
//       </select>
//     </label>
//   );
// }
