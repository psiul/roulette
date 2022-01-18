select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,reason r,date_dim d,customer_demographics cd
where ws.ws_order_number = wr.wr_order_number and wr.wr_reason_sk = r.r_reason_sk and ws.ws_sold_date_sk = d.d_date_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 490 and ws.ws_hash <= 823 and d.d_hash >= 10 and d.d_hash <= 410 and cd.cd_hash >= 218 and cd.cd_hash <= 968
;
