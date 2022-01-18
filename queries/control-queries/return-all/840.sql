select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,web_returns wr,date_dim d,reason r
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_sold_date_sk = d.d_date_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 161 and ws.ws_hash <= 911 and cd.cd_hash >= 144 and cd.cd_hash <= 544 and d.d_hash >= 146 and d.d_hash <= 479
;
