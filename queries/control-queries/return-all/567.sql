select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,reason r,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 156 and ws.ws_hash <= 489 and d.d_hash >= 178 and d.d_hash <= 928 and cd.cd_hash >= 337 and cd.cd_hash <= 737
;
