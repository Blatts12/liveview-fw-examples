import React, { useMemo, useState } from "react";
import { Button } from "./Button";

export function Counter({ count = 0, pushEvent }) {
  const [base, setBase] = useState(1);
  const [multi, setMulti] = useState(1);

  const by = useMemo(() => base * multi, [base, multi]);

  const increment = () => {
    pushEvent("inc", { by });
  };

  return (
    <div className="p-2">
      <div className="flex items-center gap-2 mb-2">
        <Button onClick={increment} className="grow">
          +{by}
        </Button>
        <p className="font-semibold min-w-[4ch] text-center">{count}</p>
        <Button phx-click="dec" phx-value-by={by} className="grow">
          -{by}
        </Button>
      </div>

      <label htmlFor="base">Base</label>
      <input
        id="base"
        type="range"
        min="1"
        max="10"
        value={base}
        onChange={(e) => setBase(e.target.valueAsNumber)}
        className="w-full"
      />
      <p className="text-right mr-2">{base}</p>

      <label htmlFor="multi">Multiplier</label>
      <input
        id="multi"
        type="range"
        min="1"
        max="10"
        value={multi}
        onChange={(e) => setMulti(e.target.valueAsNumber)}
        className="w-full"
      />
      <p className="text-right mr-2">{multi}</p>
    </div>
  );
}
