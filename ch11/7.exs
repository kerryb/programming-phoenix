defmodule Orders do
  defp tax_rates, do: [ NC: 0.075, TX: 0.08 ]

  def totals orders do
    for order <- orders do
      rate = tax_rates[order[:ship_to]] || 0
      order ++ [ total_amount: order[:net_amount] * (1 + rate) ]
    end
  end
end

parse_line = fn(line) ->
  extract_fields = fn([id, <<_::utf8, ship_to::binary>>, net_amount]) ->
    [
      id: String.to_integer(id),
      ship_to: String.to_atom(ship_to),
      net_amount: String.to_float(net_amount),
    ]
  end
  extract_fields.(String.split(line, ","))
end

File.read!("#{__DIR__}/orders.csv")
|> String.split
|> Enum.drop(1)
|> Enum.map(parse_line)
|> Orders.totals
|> IO.inspect
